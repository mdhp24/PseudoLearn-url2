<?php

namespace App\Http\Controllers\Quiz;

use App\Models\Soal;
use App\Models\Level;
use App\Models\Nyawa;
use App\Models\Ujian;
use App\Models\BankSoalKonversi;
use App\Models\LabelSkor;
use App\Models\Mahasiswa;
use Illuminate\Http\Request;
use App\Models\UjianKode;
use App\Services\SoalService;
use App\Services\LevelService;
use App\Services\KonversiService;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
// use Illuminate\Support\Facades\Log;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;

class QuizController extends Controller
{
    protected $levelService;
    protected $soalService;
    protected $konversiService;
    protected $soalModel;
    protected $bankSoalKonversiModel;
    protected $mahasiswaModel;
    protected $ujianModel;
    protected $labelSkorModel;
    protected $ujianKodeModel;
    protected $levelModel;
    protected $visibleLimit = 15;

    public function __construct()
    {
        $this->levelService         = new LevelService();
        $this->soalService          = new SoalService();
        $this->konversiService      = new KonversiService();
        $this->soalModel            = new Soal();
        $this->bankSoalKonversiModel = new BankSoalKonversi();
        $this->mahasiswaModel       = new Mahasiswa();
        $this->ujianModel           = new Ujian();
        $this->labelSkorModel       = new LabelSkor();
        $this->ujianKodeModel       = new UjianKode();
        $this->levelModel           = new Level();
    }

    public function index()
    {
        $dataLevelResponse = $this->levelService->getData();

        if ($dataLevelResponse instanceof JsonResponse) {
            $dataLevel = $dataLevelResponse->getData(true);
        } else {
            $dataLevel = $dataLevelResponse;
        }

        $userId    = Auth::id();
        $mahasiswa = $this->mahasiswaModel->where('id_user', $userId)->first();

        $levelCompletion = [];

        foreach ($dataLevel as $i => $level) {
            $levelId = $level['id'];

            // Total soal aktif (dibatasi visibleLimit)
            $totalSoal = min(
                $this->soalModel->where('id_level', $levelId)->where('status', 1)->count(),
                $this->visibleLimit
            );

            $totalKonversi = min(
                DB::table('bank_soal_konversi')->where('id_level', $levelId)->count(),
                $this->visibleLimit
            );

            // Soal & konversi yang sudah selesai (distinct)
            $completedSoal = $this->ujianModel
                ->where('id_mahasiswa', $mahasiswa->id)
                ->where('id_level', $levelId)
                ->where('status', 1)
                ->distinct('id_soal')
                ->count('id_soal');

            $completedKonversi = DB::table('ujian_kode')
                ->where('id_mahasiswa', $mahasiswa->id)
                ->where('id_level', $levelId)
                ->distinct('id_bank_soal_konversi')
                ->count('id_bank_soal_konversi');

            $algopoinPerLevel = $this->labelSkorModel
                ->where('id_mahasiswa', $mahasiswa->id)
                ->whereNull('id_soal')
                ->whereNull('label')
                ->where('id_level', $levelId)
                ->sum('skor');

            // Soal & konversi aktif yang belum dikerjakan
            $activeSoal = $this->soalModel
                ->where('id_level', $levelId)
                ->where('status', 1)
                ->whereNotIn('id', function ($q) use ($mahasiswa, $levelId) {
                    $q->select('id_soal')
                        ->from((new Ujian)->getTable())
                        ->where('id_mahasiswa', $mahasiswa->id)
                        ->where('id_level', $levelId)
                        ->where('status', 1);
                })
                ->orderBy('difficulty', 'asc')
                ->first();

            $activeKonversi = DB::table('bank_soal_konversi')
                ->where('id_level', $levelId)
                ->whereNotIn('id', function ($q) use ($mahasiswa, $levelId) {
                    $q->select('id_bank_soal_konversi')
                        ->from('ujian_kode')
                        ->where('id_mahasiswa', $mahasiswa->id)
                        ->where('id_level', $levelId);
                })
                ->orderBy('created_at', 'asc')
                ->first();

            $remainingSoal     = max(0, $totalSoal - $completedSoal);
            $remainingKonversi = max(0, $totalKonversi - $completedKonversi);

            $allSoalDone     = ($totalSoal == 0)     || ($completedSoal >= $totalSoal);
            $allKonversiDone = ($totalKonversi == 0) || ($completedKonversi >= $totalKonversi);
            $hasAlgopoin     = $algopoinPerLevel > 0;

            $isLevelCompleted        = $allSoalDone && $allKonversiDone && $hasAlgopoin;
            $levelCompletion[$i]     = $isLevelCompleted;

            $dataLevel[$i]['jumlahSoalPseudocode']        = $totalSoal;
            $dataLevel[$i]['jumlahSoalKonversi']          = $totalKonversi;
            $dataLevel[$i]['jumlahSoalPseudocodeSelesai'] = $completedSoal;
            $dataLevel[$i]['jumlahSoalKonversiSelesai']   = $completedKonversi;
            $dataLevel[$i]['algopoin']                    = $algopoinPerLevel;
            $dataLevel[$i]['isLevelCompleted']            = $isLevelCompleted;
            $dataLevel[$i]['jumlahSoalPseudocodeAktif']   = $remainingSoal;
            $dataLevel[$i]['jumlahSoalKonversiAktif']     = $remainingKonversi;
            $dataLevel[$i]['activeSoal']                  = $activeSoal ? [
                'id'    => $activeSoal->id,
                'judul' => $activeSoal->judul,
                'order' => $activeSoal->order,
            ] : null;
            $dataLevel[$i]['activeKonversi'] = $activeKonversi ? [
                'id'    => $activeKonversi->id,
                'judul' => $activeKonversi->judul_soal ?? $activeKonversi->judul ?? null,
                'order' => $activeKonversi->order,
            ] : null;
        }

        // Locking antar level
        foreach ($dataLevel as $i => $level) {
            $manualActive = intval($level['manual_active']) === 1;

            if ($manualActive) {
                $dataLevel[$i]['isLocked'] = false;
                continue;
            }

            if ($i === 0) {
                $dataLevel[$i]['isLocked'] = false;
                continue;
            }

            $prevLevel    = $dataLevel[$i - 1];
            $prevIsManual = intval($prevLevel['manual_active']) === 1;
            $canUnlock    = !$prevIsManual && !empty($levelCompletion[$i - 1]);

            $dataLevel[$i]['isLocked'] = !$canUnlock;
        }

        $algopoin = $this->labelSkorModel
            ->where('id_mahasiswa', $mahasiswa->id)
            ->whereNull('id_soal')
            ->whereNull('label')
            ->sum('skor');

        $algobadge = $this->labelSkorModel
            ->where('id_mahasiswa', $mahasiswa->id)
            ->whereNotNull('id_soal')
            ->whereIn('id_soal', function ($q) {
                $q->select('id')
                    ->from((new Soal)->getTable())
                    ->where('status', 1);
            })
            ->count();

        $nyawa = Nyawa::where('id_user', $userId)->first();
        $nyawa->checkAndRegenerate();

        return view('pages.quiz.index', [
            'title'         => 'Quiz',
            'dataLevel'     => $dataLevel,
            'algopoin'      => $algopoin,
            'algobadge'     => $algobadge,
            'lives'         => $nyawa->nyawa,
            'max_lives'     => $nyawa->max_nyawa,
            'next_regen_at' => $nyawa->next_regen_at,
        ]);
    }

public function questionList(Request $request)
{
    $levelId     = $request->query('level');
    $idUser      = Auth::id();
    $idMahasiswa = $this->mahasiswaModel->where('id_user', $idUser)->value('id');

    $soalList = $this->soalModel
        ->where('id_level', $levelId)
        ->where('status', 1)
        ->orderBy('order', 'asc')
        ->get();

    $result     = [];
    $unlockNext = true;

    foreach ($soalList as $soal) {
        $konversi = DB::table('bank_soal_konversi')
            ->where('id_soal', $soal->id)
            ->where('id_level', $levelId)
            ->first();

        $isPseudoDone = $this->ujianModel
            ->where('id_mahasiswa', $idMahasiswa)
            ->where('id_soal', $soal->id)
            ->where('status', 1)
            ->exists();

        $isKonversiDone = true;
        if ($konversi) {
            $isKonversiDone = DB::table('ujian_kode')
                ->where('id_mahasiswa', $idMahasiswa)
                ->where('id_bank_soal_konversi', $konversi->id)
                ->exists();
        }

        if (!$unlockNext) {
            $pseudoStatus = 'locked';
        } elseif ($isPseudoDone) {
            $pseudoStatus = 'done';
        } else {
            $pseudoStatus = 'active';
        }

        if (!$isPseudoDone) {
            $konversiStatus = 'locked';
        } elseif ($isKonversiDone) {
            $konversiStatus = 'done';
        } else {
            $konversiStatus = 'active';
        }

        $badge = $this->labelSkorModel
            ->where('id_mahasiswa', $idMahasiswa)
            ->where('id_level', $levelId)
            ->where('id_soal', $soal->id)
            ->value('label');

        $result[] = [
            'type'       => 'soal',
            'id'         => $soal->id,
            'judul'      => $soal->judul,
            'difficulty' => $soal->difficulty,
            'status'     => $pseudoStatus,
            'badge'      => $badge,
        ];

        if ($konversi) {
            // Ambil judul konversi dari kolom eksplisit saja
            $konversiJudul = $konversi->judul_soal ?? $konversi->judul ?? null;

            // ✅ PERBAIKAN: Jika judul konversi sama dengan judul soal induk
            // (atau kosong), gunakan judul soal induk tapi JANGAN tampilkan subtitle
            $konversiSubtitle = null;
            if (!empty($konversiJudul) && $konversiJudul !== $soal->judul) {
                // Judul konversi berbeda → subtitle = judul soal induk sebagai konteks
                $konversiSubtitle = $soal->judul;
            } else {
                // Tidak ada judul konversi unik → pakai judul soal induk, tanpa subtitle
                $konversiJudul    = $soal->judul;
                $konversiSubtitle = null; // ← ini yang menghilangkan duplikat
            }

            $result[] = [
                'type'     => 'konversi',
                'id'       => $konversi->id,
                'judul'    => $konversiJudul,
                'subtitle' => $konversiSubtitle, // null = tidak ditampilkan di view
                'difficulty' => $soal->difficulty,
                'status'   => $konversiStatus,
            ];
        }

        if (!$isPseudoDone || !$isKonversiDone) {
            $unlockNext = false;
        }
    }

    // Deduplicated konversi names
    $konversiNames = [];
    foreach ($result as $item) {
        if (!empty($item['type']) && $item['type'] === 'konversi') {
            $konversiNames[] = $item['judul'];
        }
    }
    $konversiNames = array_values(array_unique($konversiNames));

    $algopoin = $this->labelSkorModel
        ->where('id_mahasiswa', $idMahasiswa)
        ->whereNull('id_soal')
        ->whereNull('label')
        ->where('id_level', $levelId)
        ->sum('skor');

    $dataLevel = $this->levelModel->find($levelId);

    $jumlahSoalKonversi = DB::table('bank_soal_konversi')
        ->where('id_level', $levelId)
        ->count();

    $nyawa = Nyawa::where('id_user', $idUser)->first();
    $nyawa->checkAndRegenerate();

    return view('pages.quiz.question-list', [
        'title'              => 'List Soal',
        'dataSoal'           => $result,
        'algopoin'           => $algopoin,
        'levelId'            => $levelId,
        'nilaiKonversiList'  => [],
        'dataLevel'          => $dataLevel,
        'jumlahSoalKonversi' => $jumlahSoalKonversi,
        'konversiSoalNames'  => $konversiNames,
        'lives'              => $nyawa->nyawa,
        'max_lives'          => $nyawa->max_nyawa,
        'next_regen_at'      => $nyawa->next_regen_at,
    ]);
}

    public function calculateAvgSkor(Request $request)
    {
        $levelId     = $request->input('level_id');
        $idUser      = Auth::id();
        $idMahasiswa = $this->mahasiswaModel->where('id_user', $idUser)->value('id');

        $soalIds = $this->soalModel
            ->where('id_level', $levelId)
            ->where('status', 1)
            ->pluck('id')
            ->toArray();

        $labelSkorSoal = $this->labelSkorModel
            ->where('id_mahasiswa', $idMahasiswa)
            ->where('id_level', $levelId)
            ->whereIn('id_soal', $soalIds)
            ->pluck('skor', 'id_soal')
            ->toArray();

        if (count($soalIds) === 0 || count($labelSkorSoal) < count($soalIds)) {
            return response()->json([
                'message' => 'Belum memenuhi kriteria perhitungan rata-rata skor.',
            ]);
        }

        $totalSkor   = array_sum($labelSkorSoal);
        $jumlahSoal  = count($soalIds);
        $averageSkor = $jumlahSoal > 0 ? $totalSkor / $jumlahSoal : 0;

        $existing = $this->labelSkorModel
            ->where('id_mahasiswa', $idMahasiswa)
            ->where('id_level', $levelId)
            ->whereNull('id_soal')
            ->whereNull('label')
            ->first();

        if ($existing) {
            if ($existing->skor == $averageSkor) {
                return response()->json([
                    'message'  => 'Tidak ada update, skor sama.',
                    'avgSkor'  => $averageSkor,
                ]);
            }

            $existing->skor       = $averageSkor;
            $existing->updated_at = now();
            $existing->save();

            return response()->json([
                'message' => 'Skor diperbarui.',
                'avgSkor' => $averageSkor,
            ]);
        }

        $this->labelSkorModel->insert([
            'id'           => (string) Str::uuid(),
            'id_level'     => $levelId,
            'id_soal'      => null,
            'id_mahasiswa' => $idMahasiswa,
            'label'        => null,
            'skor'         => $averageSkor,
            'created_at'   => now(),
            'updated_at'   => now(),
        ]);

        return response()->json([
            'message' => 'Skor berhasil disimpan.',
            'avgSkor' => $averageSkor,
        ]);
    }
}