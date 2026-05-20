<?php

namespace App\Exports;

use App\Models\ChatbotAccessLog;
use App\Models\ChatbotLog;
use App\Models\Mahasiswa;
use App\Models\Soal;
use Maatwebsite\Excel\Concerns\WithMultipleSheets;

class LogDataChatbotExport implements WithMultipleSheets
{
    protected $idKelas;
    protected $idLevel;
    protected $idSoal;

    protected $mahasiswas;
    protected $countBiasa;
    protected $allHistory; // [ mahasiswa_id => [ ...history rows ] ]

    public function __construct($idKelas = null, $idLevel = null, $idSoal = null)
    {
        $this->idKelas = $idKelas;
        $this->idLevel = $idLevel;
        $this->idSoal  = $idSoal;

        $this->loadData();
    }

    // ─── Load semua data sekali, dibagi ke sheet ─────────────────────────────

    private function loadData(): void
    {
        // 1. Mahasiswa
        $query = (new Mahasiswa())->setView('v_mahasiswa');

        if (!empty($this->idKelas)) {
            $query = $query->where('id_kelas', $this->idKelas);
        }

        $mahasiswas    = $query->get(['id', 'nim', 'name', 'kelas_name']);
        $mahasiswaIds  = $mahasiswas->pluck('id')->filter()->values();

        if ($mahasiswaIds->isEmpty()) {
            $this->mahasiswas = collect();
            $this->countBiasa = collect();
            $this->allHistory = [];
            return;
        }

        // 2. Filter berdasarkan level/soal jika ada
        if (!empty($this->idLevel) || !empty($this->idSoal)) {
            $relevantIds = ChatbotLog::whereIn('id_mahasiswa', $mahasiswaIds)
                ->where('type', 'biasa')
                ->when(!empty($this->idLevel), fn ($q) => $q->where('id_level', $this->idLevel))
                ->when(!empty($this->idSoal),  fn ($q) => $q->where('id_soal',  $this->idSoal))
                ->pluck('id_mahasiswa')->unique()->values();
        } else {
            $relevantIds = $mahasiswaIds;
        }

        $this->mahasiswas = $mahasiswas->filter(
            fn ($m) => $relevantIds->contains($m->id)
        )->values();

        $this->countBiasa = $this->countBiasaChatbotAccesses(
            $relevantIds, $this->idLevel, $this->idSoal
        );

        // 3. Load history + conversation untuk semua mahasiswa
        $this->allHistory = $this->loadAllHistory($relevantIds);
    }

    private function loadAllHistory($mahasiswaIds): array
    {
        $allHistory = [];

        // Load semua access logs
        $accessLogs = ChatbotAccessLog::whereIn('id_mahasiswa', $mahasiswaIds)
            ->where('type', 'biasa')
            ->orderBy('id_mahasiswa')
            ->orderBy('opened_at', 'desc')
            ->get();

        // Load semua chatbot logs
        $chatbotLogs = ChatbotLog::whereIn('id_mahasiswa', $mahasiswaIds)
            ->where('type', 'biasa')
            ->with(['level:id,name', 'soal:id,judul'])
            ->when(!empty($this->idLevel), fn ($q) => $q->where('id_level', $this->idLevel))
            ->when(!empty($this->idSoal),  fn ($q) => $q->where('id_soal',  $this->idSoal))
            ->orderBy('created_at', 'asc')
            ->get();

        // Soal titles (termasuk yang sudah dihapus)
        $soalIds = $chatbotLogs->pluck('id_soal')->filter()->unique()->values();
        $soalTitlesById = $soalIds->isNotEmpty()
            ? Soal::withTrashed()->whereIn('id', $soalIds->all())->pluck('judul', 'id')
            : collect();

        // Group by mahasiswa
        $accessByMahasiswa  = $accessLogs->groupBy('id_mahasiswa');
        $chatbotByMahasiswa = $chatbotLogs->groupBy('id_mahasiswa');

        foreach ($mahasiswaIds as $mahasiswaId) {
            $sessions     = $accessByMahasiswa->get($mahasiswaId, collect());
            $logsOfThis   = $chatbotByMahasiswa->get($mahasiswaId, collect());

            $sessionRows = [];
            $noSesi = 1;

            foreach ($sessions as $log) {

                // Durasi
                $durasiText = '-';
                if (!is_null($log->durasi_menit)) {
                    if ($log->durasi_menit > 0) {
                        $durasiText = $log->durasi_menit . ' menit';
                    } else {
                        $detik      = $log->opened_at && $log->closed_at
                            ? abs($log->opened_at->diffInSeconds($log->closed_at))
                            : 0;
                        $durasiText = '0 menit ' . $detik . ' detik';
                    }
                }

                // Chatbot logs dalam sesi
                $sessionEnd  = $log->closed_at ?? now();
                $matchedLogs = $logsOfThis->filter(function ($cl) use ($log, $sessionEnd) {
                    return $cl->created_at
                        && $log->opened_at
                        && $cl->created_at->betweenIncluded($log->opened_at, $sessionEnd);
                });

                $levelName = $matchedLogs->first()?->level?->name ?? '-';
                $soalNames = $matchedLogs->pluck('id_soal')->filter()->unique()
                    ->map(fn ($sid) => $soalTitlesById[$sid] ?? null)
                    ->filter()->values();
                $soalName  = $soalNames->isNotEmpty() ? $soalNames->implode(', ') : '-';

                // Conversation messages
                $conversation = [];
                $noPesan = 1;

                foreach ($matchedLogs as $cl) {
                    $msgTimestamp = $cl->created_at
                        ? $cl->created_at->copy()->setTimezone('Asia/Jakarta')->format('d/m/Y - H:i:s') . ' WIB'
                        : '-';

                    if (trim((string) $cl->pesan) !== '') {
                        $conversation[] = [
                            'no_pesan'  => $noPesan++,
                            'pengirim'  => 'Siswa',
                            'waktu'     => $msgTimestamp,
                            'pesan'     => trim((string) $cl->pesan),
                        ];
                    }

                    if (trim((string) $cl->respons) !== '') {
                        $conversation[] = [
                            'no_pesan'  => $noPesan++,
                            'pengirim'  => 'Chatbot',
                            'waktu'     => $msgTimestamp,
                            'pesan'     => trim((string) $cl->respons),
                        ];
                    }
                }

                $sessionRows[] = [
                    'no_sesi'      => $noSesi++,
                    'level_name'   => $levelName,
                    'soal'         => $soalName,
                    'waktu_akses'  => $log->opened_at
                        ? $log->opened_at->setTimezone('Asia/Jakarta')->format('d/m/Y - H:i:s') . ' WIB'
                        : '-',
                    'durasi'       => $durasiText,
                    'conversation' => $conversation,
                ];
            }

            $allHistory[$mahasiswaId] = $sessionRows;
        }

        return $allHistory;
    }

    // ─── Multiple Sheets ─────────────────────────────────────────────────────

    public function sheets(): array
    {
        return [
            new LogDataChatbotSummarySheet($this->mahasiswas, $this->countBiasa),
            new LogDataChatbotHistorySheet($this->mahasiswas, $this->allHistory),
            new LogDataChatbotConversationSheet($this->mahasiswas, $this->allHistory),
        ];
    }

    // ─── Helper ──────────────────────────────────────────────────────────────

    private function countBiasaChatbotAccesses($mahasiswaIds, ?string $level = null, ?string $soal = null)
    {
        $query = ChatbotAccessLog::withoutGlobalScopes()
            ->from('chatbot_access_logs as access_logs')
            ->join('chatbot_logs as logs', function ($join) {
                $join->on('logs.id_mahasiswa', '=', 'access_logs.id_mahasiswa')
                    ->whereColumn('logs.created_at', '>=', 'access_logs.opened_at')
                    ->whereRaw('logs.created_at <= COALESCE(access_logs.closed_at, CURRENT_TIMESTAMP)');
            })
            ->where('access_logs.type', 'biasa')
            ->where('logs.type', 'biasa')
            ->whereNull('access_logs.deleted_at')
            ->whereIn('access_logs.id_mahasiswa', $mahasiswaIds)
            ->selectRaw('access_logs.id_mahasiswa as mahasiswa_id, COUNT(DISTINCT access_logs.id) as total')
            ->groupBy('access_logs.id_mahasiswa');

        if (!empty($level)) $query->where('logs.id_level', $level);
        if (!empty($soal))  $query->where('logs.id_soal', $soal);

        return $query->pluck('total', 'mahasiswa_id');
    }
}