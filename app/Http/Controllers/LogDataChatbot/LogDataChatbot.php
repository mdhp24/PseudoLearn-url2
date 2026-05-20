<?php

namespace App\Http\Controllers\LogDataChatbot;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Level;
use App\Models\Soal;
use App\Models\Kelas;
use App\Models\Mahasiswa;
use App\Models\ChatbotAccessLog;
use App\Models\ChatbotLog;
use App\Exports\LogDataChatbotExport;
use Maatwebsite\Excel\Facades\Excel;

class LogDataChatbot extends Controller
{
    protected $levelModel;
    protected $soalModel;
    protected $kelasModel;
    protected $mahasiswaModel;

    public function __construct()
    {
        $this->levelModel    = new Level();
        $this->soalModel     = new Soal();
        $this->kelasModel    = new Kelas();
        $this->mahasiswaModel = new Mahasiswa();
    }

    public function index()
    {
        $list_kelas = $this->kelasModel->get(['id', 'name', 'angkatan'])->toArray();

        $list_kelas = collect($list_kelas)->prepend(['id' => '', 'name' => 'Semua Kelas', 'angkatan' => '']);

        $list_kelas = collect($list_kelas)->map(function ($item) {
            return [
                'id'       => $item['id'],
                'name'     => $item['name'],
                'angkatan' => $item['angkatan'],
            ];
        })->values()->toArray();

        $list_level = $this->levelModel->orderBy('order', 'asc')->get(['id', 'name'])
            ->pluck('name', 'id')
            ->toArray();

        $list_level = collect($list_level)->map(function ($name, $id) {
            return ['id' => $id, 'name' => $name];
        })->values()->toArray();

        return view('pages.logDataChatbot.index', [
            'title'      => 'Log Data Chatbot',
            'list_kelas' => $list_kelas,
            'list_level' => $list_level,
        ]);
    }

    public function table(Request $request)
    {
        $kelas  = $request->input('kelas');
        $level  = $request->input('level');
        $soal   = $request->input('soal');
        $search = $request->input('search')['value'] ?? '';

        $baseQuery = $this->mahasiswaModel->setView('v_mahasiswa');

        if (!empty($kelas)) {
            $baseQuery = $baseQuery->where('id_kelas', $kelas);
        }

        if (!empty($search)) {
            $baseQuery = $baseQuery->where(function ($q) use ($search) {
                $q->where('name', 'like', "%{$search}%")
                  ->orWhere('nim', 'like', "%{$search}%");
            });
        }

        $totalRecords  = (clone $baseQuery)->count();
        $filteredQuery = clone $baseQuery;

        if (!empty($level) || !empty($soal)) {
            $relevantIdsQuery = ChatbotLog::query()->where('type', 'biasa');

            if (!empty($level)) {
                $relevantIdsQuery->where('id_level', $level);
            }

            if (!empty($soal)) {
                $relevantIdsQuery->where('id_soal', $soal);
            }

            $relevantIds   = $relevantIdsQuery->distinct()->pluck('id_mahasiswa');
            $filteredQuery = $filteredQuery->whereIn('id', $relevantIds);
        }

        $filteredRecords = (clone $filteredQuery)->count();

        $start      = $request->input('start', 0);
        $length     = $request->input('length', 10);
        $mahasiswas = $filteredQuery->skip($start)->take($length)->get();

        $mahasiswaIds             = $mahasiswas->pluck('id');
        $latestLevelByMahasiswa   = [];

        $latestChatbotLogs = ChatbotLog::whereIn('id_mahasiswa', $mahasiswaIds)
            ->where('type', 'biasa')
            ->with('level:id,name')
            ->when(!empty($level), fn ($q) => $q->where('id_level', $level))
            ->when(!empty($soal),  fn ($q) => $q->where('id_soal', $soal))
            ->orderBy('created_at', 'desc')
            ->get(['id_mahasiswa', 'id_level', 'created_at']);

        foreach ($latestChatbotLogs as $log) {
            if (!isset($latestLevelByMahasiswa[$log->id_mahasiswa])) {
                $latestLevelByMahasiswa[$log->id_mahasiswa] = $log->level?->name ?? '-';
            }
        }

        $countBiasa = $this->countBiasaChatbotAccesses($mahasiswaIds, $level, $soal);

        $data = $mahasiswas->map(function ($mahasiswa) use ($countBiasa, $latestLevelByMahasiswa) {
            return [
                'id'            => $mahasiswa->id,
                'nim'           => $mahasiswa->nim,
                'name'          => $mahasiswa->name,
                'kelas_name'    => $mahasiswa->kelas_name ?? '-',
                'level_name'    => $latestLevelByMahasiswa[$mahasiswa->id] ?? '-',
                'jumlah_chatbot'=> $countBiasa[$mahasiswa->id] ?? 0,
            ];
        });

        return response()->json([
            'draw'            => intval($request->input('draw')),
            'recordsTotal'    => $totalRecords,
            'recordsFiltered' => $filteredRecords,
            'data'            => $data,
        ]);
    }

    public function getSoalByLevel(Request $request)
    {
        $levelId = $request->input('level_id');

        if (empty($levelId)) {
            return response()->json([]);
        }

        $soals = $this->soalModel->where('id_level', $levelId)
            ->orderBy('order', 'asc')
            ->get(['id', 'judul']);

        return response()->json($soals);
    }

    public function detail($id)
    {
        $mahasiswa = $this->mahasiswaModel->setView('v_mahasiswa')->find($id);

        if (!$mahasiswa) {
            return response()->json([
                'success' => false,
                'message' => 'Data mahasiswa tidak ditemukan',
            ]);
        }

        $accessLogs = ChatbotAccessLog::where('id_mahasiswa', $id)
            ->where('type', 'biasa')
            ->orderBy('opened_at', 'desc')
            ->get();

        $chatbotLogs = ChatbotLog::where('id_mahasiswa', $id)
            ->where('type', 'biasa')
            ->with(['level:id,name', 'soal:id,judul'])
            ->orderBy('created_at', 'asc')
            ->get();

        $soalIds = $chatbotLogs->pluck('id_soal')->filter()->unique()->values();

        $soalTitlesById = $soalIds->isNotEmpty()
            ? Soal::withTrashed()->whereIn('id', $soalIds->all())->pluck('judul', 'id')
            : collect();

        $jumlahBiasa = $accessLogs->where('type', 'biasa')->count();
        $latestLevel = $chatbotLogs->last()?->level?->name ?? '-';

        $history = $accessLogs->map(function ($log) use ($chatbotLogs, $soalTitlesById) {

            // --- Durasi ---
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

            // --- Chatbot logs dalam sesi ini ---
            $sessionEnd  = $log->closed_at ?? now();
            $matchedLogs = $chatbotLogs->filter(function ($chatbotLog) use ($log, $sessionEnd) {
                return $chatbotLog->created_at
                    && $log->opened_at
                    && $chatbotLog->created_at->betweenIncluded($log->opened_at, $sessionEnd);
            });

            $levelName  = $matchedLogs->first()?->level?->name ?? '-';
            $soalNames  = $matchedLogs
                ->pluck('id_soal')->filter()->unique()
                ->map(fn ($soalId) => $soalTitlesById[$soalId] ?? null)
                ->filter()->values();
            $soalName   = $soalNames->isNotEmpty() ? $soalNames->implode(', ') : '-';

            // --- Conversation: pasangan pesan-respons dalam sesi ini ---
            $conversation = $matchedLogs->flatMap(function ($chatbotLog) use ($soalTitlesById) {
                $timestamp = $chatbotLog->created_at
                    ? $chatbotLog->created_at->copy()->setTimezone('Asia/Jakarta')->format('d/m/Y - H:i:s') . ' WIB'
                    : '-';

                $levelName = $chatbotLog->level?->name ?? '-';
                $soalName  = $soalTitlesById[$chatbotLog->id_soal] ?? ($chatbotLog->soal?->judul ?? '-');

                $messages = [];

                if (trim((string) $chatbotLog->pesan) !== '') {
                    $messages[] = [
                        'timestamp'  => $timestamp,
                        'level_name' => $levelName,
                        'soal_name'  => $soalName,
                        'speaker'    => 'Siswa',
                        'message'    => trim((string) $chatbotLog->pesan),
                    ];
                }

                if (trim((string) $chatbotLog->respons) !== '') {
                    $messages[] = [
                        'timestamp'  => $timestamp,
                        'level_name' => $levelName,
                        'soal_name'  => $soalName,
                        'speaker'    => 'Chatbot',
                        'message'    => trim((string) $chatbotLog->respons),
                    ];
                }

                return $messages;
            })->values()->toArray();

            return [
                'level_name'   => $levelName,
                'soal'         => $soalName,
                'waktu_akses'  => $log->opened_at
                    ? $log->opened_at->setTimezone('Asia/Jakarta')->format('d/m/Y - H:i:s') . ' WIB'
                    : '-',
                'durasi'       => $durasiText,
                'conversation' => $conversation,   // ← tambahan
            ];
        })->values()->toArray();

        return response()->json([
            'success' => true,
            'data'    => [
                'id'             => $mahasiswa->id,
                'nim'            => $mahasiswa->nim,
                'name'           => $mahasiswa->name,
                'kelas_name'     => $mahasiswa->kelas_name ?? '-',
                'level_name'     => $latestLevel,
                'jumlah_chatbot' => $jumlahBiasa,
                'history'        => $history,
            ],
        ]);
    }

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

        if (!empty($level)) {
            $query->where('logs.id_level', $level);
        }

        if (!empty($soal)) {
            $query->where('logs.id_soal', $soal);
        }

        return $query->pluck('total', 'mahasiswa_id');
    }

    public function export(Request $request)
    {
        $idKelas  = $request->input('kelas');
        $idLevel  = $request->input('level');
        $idSoal   = $request->input('soal');
        $filename = 'Log_Data_Chatbot_' . date('Y-m-d_H-i-s') . '.xlsx';

        return Excel::download(new LogDataChatbotExport($idKelas, $idLevel, $idSoal), $filename);
    }
}