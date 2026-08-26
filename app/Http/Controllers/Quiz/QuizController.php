<?php

namespace App\Http\Controllers\Quiz;

use App\Http\Controllers\Controller;
use App\Models\Level;
use App\Models\LabelSkor;
use App\Models\Mahasiswa;
use App\Models\BankSoalKonversi;
use App\Models\Nyawa;
use App\Models\Soal;
use App\Models\Ujian;
use App\Models\UjianKode;
use App\Services\KonversiService;
use App\Services\LevelService;
use App\Services\SoalService;
use App\Services\ArsReportService;
use Illuminate\Contracts\View\View;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Schema;
use App\Models\ArsResult;
use \Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;


class QuizController extends Controller
{
    protected $levelService;
    protected $soalService;
    protected $konversiService;
    protected $arsReportService;
    protected $soalModel;
    protected $mahasiswaModel;
    protected $ujianModel;
    protected $labelSkorModel;
    protected $ujianKodeModel;
    protected $levelModel;
    protected $bankSoalKonversiModel;
    protected $visibleLimit = 5;

    public function __construct()
    {
        $this->levelService = new LevelService();
        $this->soalService = new SoalService();
        $this->konversiService = new KonversiService();
        $this->arsReportService = new ArsReportService();
        $this->soalModel = new Soal();
        $this->mahasiswaModel = new Mahasiswa();
        $this->ujianModel = new Ujian();
        $this->labelSkorModel = new LabelSkor();
        $this->ujianKodeModel = new UjianKode();
        $this->levelModel = new Level();
        $this->bankSoalKonversiModel = new BankSoalKonversi();
    }


    // Filter ujian_kode by mahasiswa id,
    private function scopeUjianKodeMahasiswa($query, string $idMahasiswa, $idUser)
    {
        return $query->where(function ($q) use ($idMahasiswa, $idUser) {
            $q->where('id_mahasiswa', $idMahasiswa)
                ->orWhere('id_mahasiswa', $idUser);
        });
    }

    public function index()
    {
        $dataLevelResponse = $this->levelService->getData();
        $dataLevel = $dataLevelResponse instanceof JsonResponse ? $dataLevelResponse->getData(true) : $dataLevelResponse;

        $userId = Auth::id();
        $mahasiswa = $this->mahasiswaModel->where('id_user', $userId)->first();
        $levelCompletion = [];

        foreach ($dataLevel as $i => $level) {
            $levelId = $level['id'];

            // Total aktif
            $totalSoal = min(
                $this->soalModel->where('id_level', $levelId)->where('status', 1)->count(),
                $this->visibleLimit
            );
            $totalKonversi = min(
                 DB::table('bank_soal_konversi')
                    ->where('id_level', $levelId)
                    ->count(),
                $this->visibleLimit
            );

            // Distinct
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

            // Pseudo & konversi aktif blm dikerjakan
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

            $remainingSoal = max(0, $totalSoal - $completedSoal);
            $remainingKonversi = max(0, $totalKonversi - $completedKonversi);

            $allSoalDone     = ($totalSoal == 0) || ($completedSoal >= $totalSoal);
            $allKonversiDone = ($totalKonversi == 0) || ($completedKonversi >= $totalKonversi);
            
            $isLevelCompleted = $allSoalDone && $allKonversiDone && ($algopoinPerLevel > 0);
            $levelCompletion[$i] = $isLevelCompleted;

            $dataLevel[$i]['jumlahSoalPseudocode'] = $totalSoal;
            $dataLevel[$i]['jumlahSoalKonversi'] = $totalKonversi;
            $dataLevel[$i]['jumlahSoalPseudocodeSelesai'] = $completedSoal;
            $dataLevel[$i]['jumlahSoalKonversiSelesai'] = $completedKonversi;
            $dataLevel[$i]['algopoin'] = $algopoinPerLevel;
            $dataLevel[$i]['isLevelCompleted'] = $isLevelCompleted;
            $dataLevel[$i]['jumlahSoalPseudocodeAktif'] = max(0, $totalSoal - $completedSoal);
            $dataLevel[$i]['jumlahSoalKonversiAktif'] = max(0, $totalKonversi - $completedKonversi);
        }

        // 🔥 LOGIKA KUNCIAN LEVEL: BUKA PAKSA SESUAI STATUS DOSEN
        foreach ($dataLevel as $i => $level) {
            $isActive = intval($level['manual_active']) === 1;

            if ($isActive) {
                // Jika AKTIF di Admin -> Buka Gembok (Mahasiswa bebas loncat ke level ini)
                $dataLevel[$i]['isLocked'] = false;
            } else {
                // Jika TIDAK AKTIF di Admin -> Kunci Mutlak
                $dataLevel[$i]['isLocked'] = true;
            }
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
                $q->select('id')->from((new Soal)->getTable())->where('status', 1);
            })->count();

        $nyawa = Nyawa::where('id_user', $userId)->first();
        if ($nyawa) $nyawa->checkAndRegenerate();

        return view('pages.quiz.index', [
            'title' => 'Quiz',
            'dataLevel' => $dataLevel,
            'algopoin' => $algopoin,
            'algobadge' => $algobadge,
            'lives' => $nyawa->nyawa ?? 0,
            'max_lives' => $nyawa->max_nyawa ?? 0,
            'next_regen_at' => $nyawa->next_regen_at ?? null,
        ]);
    }


    public function questionList(Request $request)
    {
        $levelId = $request->query('level');

        $idUser = Auth::id();
        $idMahasiswa = $this->mahasiswaModel->where('id_user', $idUser)->value('id');
        $soalListRaw = $this->soalModel
            ->where('id_level', $levelId)
            ->where('status', 1)
            ->get();

        // Filter hanya soal yang memiliki pasangan konversi (1 pseudo + 1 konversi per paket)
        $validSoal = $soalListRaw->filter(function($s) use ($levelId) {
            return DB::table('bank_soal_konversi')
                ->where('id_soal', $s->id)
                ->where('id_level', $levelId)
                ->whereNull('deleted_at')
                ->exists();
        });

        // Acak urutan paket soal deterministik per siswa & per level (persisten selama sesi/refresh)
        $seed = crc32(($idMahasiswa ?? $idUser) . '_' . $levelId);
        mt_srand($seed);
        $soalArray = $validSoal->values()->all();
        for ($i = count($soalArray) - 1; $i > 0; $i--) {
            $j = mt_rand(0, $i);
            $tmp = $soalArray[$i];
            $soalArray[$i] = $soalArray[$j];
            $soalArray[$j] = $tmp;
        }
        mt_srand();

        // Pisahkan paket yang sudah selesai dan yang belum selesai agar progress tetap teratur
        $completedPairs = [];
        $uncompletedPairs = [];
        foreach ($soalArray as $soal) {
            $konversi = DB::table('bank_soal_konversi')
                ->where('id_soal', $soal->id)
                ->where('id_level', $levelId)
                ->whereNull('deleted_at')
                ->first();

            $isPseudoDone = $this->ujianModel
                ->where('id_mahasiswa', $idMahasiswa)
                ->where('id_soal', $soal->id)
                ->where('status', 1)
                ->exists();

            $isKonversiDone = false;
            if ($konversi) {
                $isKonversiDone = DB::table('ujian_kode')
                    ->where('id_mahasiswa', $idMahasiswa)
                    ->where('id_bank_soal_konversi', $konversi->id)
                    ->exists();
            }

            if ($isPseudoDone && $isKonversiDone) {
                $completedPairs[] = $soal;
            } else {
                $uncompletedPairs[] = $soal;
            }
        }

        $soalList = collect(array_merge($completedPairs, $uncompletedPairs));

        $nilaiKonversiList = DB::table('ujian_kode as uk')
            ->join('bank_soal_konversi as bsk', 'bsk.id', '=', 'uk.id_bank_soal_konversi')
            ->leftJoin('soal as s', 's.id', '=', 'bsk.id_soal')
            ->where('uk.id_mahasiswa', $idMahasiswa)
            ->where('uk.id_level', $levelId)
            ->whereNull('uk.deleted_at')
            ->orderBy('uk.created_at', 'desc')
            ->get(['s.judul', 'uk.nilai'])
            ->unique('judul')
            ->mapWithKeys(fn($item) => [$item->judul ?? 'Soal Konversi' => (float) $item->nilai])
            ->all();

        $dataUjian = $this->ujianModel->where('id_mahasiswa', $idMahasiswa)
            ->where('id_level', $levelId)
            ->where('status', 1)
            ->get()
            ->toArray();

        $result = [];
        $visibleLimit = $this->visibleLimit;
        $pairCount = 0;
        $previousPackageComplete = true;

        foreach ($soalList as $soal) {
            if ($pairCount >= $visibleLimit) break;

            $konversi = DB::table('bank_soal_konversi')
                ->where('id_soal', $soal->id)
                ->where('id_level', $levelId)
                ->whereNull('deleted_at')
                ->first();

            // Satu paket selalu terdiri dari pseudo dan konversi.
            if (!$konversi) {
                continue;
            }

            $isPseudoDone = $this->ujianModel
                ->where('id_mahasiswa', $idMahasiswa)
                ->where('id_soal', $soal->id)
                ->where('status', 1)
                ->exists();

            $isKonversiDone = false;
            if ($konversi) {
                $isKonversiDone = DB::table('ujian_kode')
                    ->where('id_mahasiswa', $idMahasiswa)
                    ->where('id_bank_soal_konversi', $konversi->id)
                    ->exists(); 
            }

            if ($isPseudoDone) {
                $pseudoStatus = 'done';
            } elseif ($previousPackageComplete) {
                $pseudoStatus = 'active';
            } else {
                $pseudoStatus = 'locked';
            }

            if ($isKonversiDone) {
                $konversiStatus = 'done';
            } elseif ($previousPackageComplete && $isPseudoDone) {
                $konversiStatus = 'active';
            } else {
                $konversiStatus = 'locked';
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
                'badge'      => $badge
            ];

            $result[] = [
                'type'       => 'konversi',
                'id'         => $konversi->id,
                'judul'      => $soal->judul,
                'difficulty' => $soal->difficulty,
                'status'     => $konversiStatus
            ];

            $packageComplete = $isPseudoDone && $isKonversiDone;
            $previousPackageComplete = $packageComplete;

            $pairCount++;

            // Render paket selesai dan satu paket aktif berikutnya saja.
            if (!$packageComplete) {
                break;
            }
        }

        // Progress ARS
        $allMainDone    = collect($result)->every(fn($r) => $r['status'] === 'done');
        $totalMainPairs = collect($result)->where('type', 'soal')->count();

        if (Schema::hasTable('ars_result') && $allMainDone && $totalMainPairs >= $visibleLimit) {

            $arsService = new \App\Services\ArsReportService();
            $arsData    = $arsService->processArs($idMahasiswa, $levelId);

            Log::info('ARS DEBUG', [
                'total_pair'  => $arsData['total_pair'],
                'total_ars'   => $arsData['total_ars'],
                'lastDiff'    => collect($arsData['data'])->last()['difficulty'] ?? null,
                'pseudoLabel' => collect($arsData['data'])->last()['pseudo']['label'] ?? null,
            ]);

            $lastPair       = collect($arsData['data'])->last();
            $lastDifficulty = $lastPair['difficulty'] ?? 'easy';
            $pseudoLabel    = $lastPair['pseudo']['label'] ?? 'Struggling';
            $konversiLabel  = $lastPair['konversi']['label'] ?? 'Struggling';

            $isStable = in_array($pseudoLabel, ['Ideal', 'Normal']) &&
                        in_array($konversiLabel, ['Ideal', 'Normal']);

            $mainSoalIds = collect($result)->where('type', 'soal')->pluck('id')->toArray();

            $result = array_values(collect($result)
                ->filter(fn($r) => !isset($r['is_tambahan']) || $r['is_tambahan'] === false)
                ->toArray());

            // Soal ARS finish (Hanya soal tambahan yang bukan 5 soal utama)
            $arsResultDone = ArsResult::where('id_mahasiswa', $idMahasiswa)
                ->where('id_level', $levelId)
                ->whereNotIn('id_soal', $mainSoalIds)
                ->whereNotNull('pseudo_label')
                ->whereNotNull('konversi_label')
                ->orderBy('created_at', 'asc')
                ->get();

            foreach ($arsResultDone as $arsItem) {
                $soalArs = $this->soalModel->find($arsItem->id_soal);
                if (!$soalArs) continue;

                $konversiArs = DB::table('bank_soal_konversi')
                    ->where('id_soal', $soalArs->id)
                    ->where('id_level', $levelId)
                    ->first();

                $result[] = [
                    'type'        => 'soal',
                    'id'          => $soalArs->id,
                    'judul'       => $soalArs->judul,
                    'difficulty'  => $soalArs->difficulty,
                    'status'      => 'done',
                    'badge'       => null,
                    'is_tambahan' => true,
                    'batch'       => $arsItem->ars_batch,
                ];

                if ($konversiArs) {
                    $result[] = [
                        'type'        => 'konversi',
                        'id'          => $konversiArs->id,
                        'judul'       => $konversiArs->judul_soal ?? $konversiArs->judul ?? $soalArs->judul,
                        'difficulty'  => $soalArs->difficulty,
                        'status'      => 'done',
                        'is_tambahan' => true,
                        'batch'       => $arsItem->ars_batch,
                    ];
                }
            }

            // Soal ARS belum selesai (Hanya soal tambahan yang bukan 5 soal utama)
            $arsResultAktif = ArsResult::where('id_mahasiswa', $idMahasiswa)
                ->where('id_level', $levelId)
                ->whereNotIn('id_soal', $mainSoalIds)
                ->where(function($q) {
                    $q->whereNull('pseudo_label')->orWhereNull('konversi_label');
                })
                ->orderBy('created_at', 'asc')
                ->get();

            foreach ($arsResultAktif as $arsItem) {
                $soalArs = $this->soalModel->find($arsItem->id_soal);
                if (!$soalArs) continue;

                $konversiArs = DB::table('bank_soal_konversi')
                    ->where('id_soal', $soalArs->id)
                    ->where('id_level', $levelId)
                    ->first();

                $isPseudoDone = $this->ujianModel
                    ->where('id_mahasiswa', $idMahasiswa)
                    ->where('id_soal', $soalArs->id)
                    ->where('status', 1)
                    ->exists();

                $isKonversiDone = false;
                if ($konversiArs) {
                    $isKonversiDone = DB::table('ujian_kode')
                        ->where('id_mahasiswa', $idMahasiswa)
                        ->where('id_bank_soal_konversi', $konversiArs->id)
                        ->exists();
                }

                $result[] = [
                    'type'        => 'soal',
                    'id'          => $soalArs->id,
                    'judul'       => $soalArs->judul,
                    'difficulty'  => $soalArs->difficulty,
                    'status'      => $isPseudoDone ? 'done' : 'active',
                    'badge'       => null,
                    'is_tambahan' => true,
                    'batch'       => $arsItem->ars_batch,
                ];

                if ($konversiArs) {
                    $result[] = [
                        'type'        => 'konversi',
                        'id'          => $konversiArs->id,
                        'judul'       => $konversiArs->judul_soal ?? $konversiArs->judul ?? $soalArs->judul,
                        'difficulty'  => $soalArs->difficulty,
                        'status'      => !$isPseudoDone ? 'locked' : ($isKonversiDone ? 'done' : 'active'),
                        'is_tambahan' => true,
                        'batch'       => $arsItem->ars_batch,
                    ];
                }
            }

            // Tahan soal baru jika ada ARS yang belum selesai
            $adaYangBelumSelesai = ArsResult::where('id_mahasiswa', $idMahasiswa)
                ->where('id_level', $levelId)
                ->whereNotIn('id_soal', $mainSoalIds)
                ->where(function($q) {
                    $q->whereNull('pseudo_label')->orWhereNull('konversi_label');
                })
                ->exists();

           if ($isStable && $lastDifficulty === 'hard') {

            } elseif ($isStable && $lastDifficulty !== 'hard' && !$adaYangBelumSelesai) {
                $nextDifficulty = $this->getProgressDifficulty($lastDifficulty);
                $this->appendSoalTambahan($result, $idMahasiswa, $levelId, $nextDifficulty, false, $arsData['batch_count']);

            } elseif (!$isStable && !$adaYangBelumSelesai && $arsData['total_ars'] > 0) {
                $nextDifficulty = $this->getNextDifficulty($lastDifficulty);
                $soalTambahan   = $this->appendSoalTambahan($result, $idMahasiswa, $levelId, $nextDifficulty, true, $arsData['batch_count']);

                if ($soalTambahan) {
                    $exists = ArsResult::where('id_mahasiswa', $idMahasiswa)
                        ->where('id_level', $levelId)
                        ->where('id_soal', $soalTambahan['id'])
                        ->exists();

                    if (!$exists) {
                        $jumlahSoalTambahan = ArsResult::where('id_mahasiswa', $idMahasiswa)
                            ->where('id_level', $levelId)
                            ->whereNotIn('id_soal', $mainSoalIds)
                            ->count();

                        ArsResult::create([
                            'id'           => Str::uuid(),
                            'id_mahasiswa' => $idMahasiswa,
                            'id_level'     => $levelId,
                            'id_soal'      => $soalTambahan['id'],
                            'ars_batch'    => floor($jumlahSoalTambahan / 5) + 1,
                            'difficulty'   => $soalTambahan['difficulty'],
                        ]);
                    }
                }
            }
        }

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

        // 11) Kirim data akhir ke halaman daftar soal.

        // dd($result);

        return view('pages.quiz.question-list', [
            'title' => 'List Soal',
            'dataSoal' => $result,
            'algopoin' => $algopoin,
            'levelId' => $levelId,
            'nilaiKonversiList' => $nilaiKonversiList,
            'dataLevel' => $dataLevel,
            'jumlahSoalKonversi' => $jumlahSoalKonversi,
            'lives' => $nyawa->nyawa,
            'max_lives' => $nyawa->max_nyawa,
            'next_regen_at' => $nyawa->next_regen_at
        ]);
    }

    public function calculateAvgSkor(Request $request)
    {
        $levelId = $request->input('level_id');
        $idUser = Auth::id();
        $idMahasiswa = $this->mahasiswaModel->where('id_user', $idUser)->value('id');

        // Ambil level untuk mengetahui limit_soal
        $level = $this->levelModel->find($levelId);
        $effectiveLimit = max(1, (int) ($level->limit_soal ?? $this->visibleLimit));

        // Ambil semua soal pada level ini (urut berdasarkan order)
        $allSoal = $this->soalModel->where('id_level', $levelId)->where('status', 1)->inRandomOrder()->get();

        // Tentukan soal mana yang masuk hitungan:
        // 1. Soal yang sudah dikerjakan (ada di ujian), diurutkan berdasarkan first attempt
        // 2. Jika jumlah soal yang sudah dikerjakan < limit, tambahkan soal baru dari urutan order
        $ujianBySoal = $this->ujianModel
            ->where('id_mahasiswa', $idMahasiswa)
            ->where('id_level', $levelId)
            ->whereNotNull('id_soal')
            ->orderBy('created_at', 'asc')
            ->get()
            ->groupBy('id_soal');

        $firstAttemptBySoal = $ujianBySoal->map(fn($items) => $items->first()->created_at);

        $historySoalIdsOrdered = $firstAttemptBySoal
            ->sortBy(fn($createdAt) => $createdAt ? $createdAt->getTimestamp() : 0)
            ->keys()
            ->values();

        if ($historySoalIdsOrdered->count() > $effectiveLimit) {
            $historySoalIdsOrdered = $historySoalIdsOrdered->take($effectiveLimit)->values();
        }

        $historyCount = $historySoalIdsOrdered->count();
        $soalIds = $historySoalIdsOrdered->toArray();

        // Jika masih kurang dari limit, tambahkan soal dari urutan order yang belum ada di history
        if ($historyCount < $effectiveLimit) {
            $existingIds = $historySoalIdsOrdered->flip();
            $candidates = $allSoal->reject(fn($s) => $existingIds->has($s->id))->pluck('id')->toArray();
            $needed = $effectiveLimit - $historyCount;
            $soalIds = array_merge($soalIds, array_slice($candidates, 0, $needed));
        }

        // Ambil labelSkor untuk soal-soal tersebut
        $labelSkorSoal = $this->labelSkorModel
            ->where('id_mahasiswa', $idMahasiswa)
            ->where('id_level', $levelId)
            ->whereIn('id_soal', $soalIds)
            ->pluck('skor', 'id_soal')
            ->toArray();

        // Cek apakah semua soal dalam batas limit sudah dikerjakan
        if (count($soalIds) === 0 || count($labelSkorSoal) < count($soalIds)) {
            return response()->json(['message' => 'Belum memenuhi kriteria perhitungan rata-rata skor.']);
        }

        // Hitung rata-rata skor
        $totalSkor = array_sum($labelSkorSoal);
        $jumlahSoal = count($soalIds);
        $averageSkor = $jumlahSoal > 0 ? $totalSkor / $jumlahSoal : 0;

        // Cek apakah sudah ada data labelSkor untuk level ini (id_soal = null, label = null)
        $existing = $this->labelSkorModel
            ->where('id_mahasiswa', $idMahasiswa)
            ->where('id_level', $levelId)
            ->whereNull('id_soal')
            ->whereNull('label')
            ->first();

        if ($existing) {
            if ($existing->skor == $averageSkor) {
                return response()->json(['message' => 'Tidak ada update, skor sama.', 'avgSkor' => $averageSkor]);
            } else {
                $existing->skor = $averageSkor;
                $existing->updated_at = now();
                $existing->save();
                return response()->json(['message' => 'Skor diperbarui.', 'avgSkor' => $averageSkor]);
            }
        } else {
            $insertData = [
                'id' => (string) \Illuminate\Support\Str::uuid(),
                'id_level' => $levelId,
                'id_soal' => null,
                'id_mahasiswa' => $idMahasiswa,
                'label' => null,
                'skor' => $averageSkor,
                'created_at' => now(),
                'updated_at' => now(),
            ];
            $this->labelSkorModel->insert($insertData);
            return response()->json(['message' => 'Skor berhasil disimpan.', 'avgSkor' => $averageSkor]);
        }
    }

    public function listQuestion(Request $request): View
    {
        $levelId = $request->query('level');
        if ($levelId !== null && $request->query('level') !== $levelId) {
            $request->query->set('level', $levelId);
        }

        return $this->questionList($request);
    }


    /**
     * Get the next difficulty in progression (easy → medium → hard).
     */
    private function getProgressDifficulty($currentDifficulty)
    {
        return match(strtolower($currentDifficulty)) {
            'easy'   => 'medium',
            'medium' => 'hard',
            default  => null
        };
    }

    /**
     * Get the same difficulty for ARS additional questions.
     */
    private function getNextDifficulty($lastDifficulty)
    {
        return match(strtolower($lastDifficulty)) {
            'easy'   => 'easy',
            'medium' => 'medium',
            'hard'   => 'hard',
            default  => 'easy'
        };
    }

    /**
     * Append an additional soal (and its konversi) to the result array.
     */
    private function appendSoalTambahan(&$result, $idMahasiswa, $levelId, $difficulty, $isArs, $batch)
    {
        if (!$difficulty) return null;

        $konversiTambahan = null;
        // Id soal utama 1-10
        $excludeIds = collect($result)
            ->where('type', 'soal')
            ->pluck('id')
            ->toArray();

        // Check if there's an unfinished ARS result
        $arsResultBelumSelesai = ArsResult::where('id_mahasiswa', $idMahasiswa)
            ->where('id_level', $levelId)
            ->whereNull('konversi_label')
            ->first();

        if ($arsResultBelumSelesai) {
            $soalTambahan = $this->soalModel->find($arsResultBelumSelesai->id_soal);
        } else {
            $soalTambahan = $this->soalModel
                ->where('id_level', $levelId)
                ->where('difficulty', $difficulty)
                ->where('status', 1)
                ->whereNotIn('id', function ($q) use ($idMahasiswa, $levelId) {
                    $q->select('id_soal')
                        ->from('ars_result')
                        ->where('id_mahasiswa', $idMahasiswa)
                        ->where('id_level', $levelId);
                })
                ->whereNotIn('id', $excludeIds)
                ->orderBy('order', 'asc')
                ->first();
        }

        Log::info('APPEND SOAL TAMBAHAN', [
            'difficulty'  => $difficulty,
            'found'       => $soalTambahan?->id,
            'judul'       => $soalTambahan?->judul,
            'excludeIds'  => $excludeIds,
        ]);

        if (!$soalTambahan) return null;

        $konversiTambahan = DB::table('bank_soal_konversi')
            ->where('id_soal', $soalTambahan->id)
            ->where('id_level', $levelId)
            ->first();

        $isPseudoDone = $this->ujianModel
            ->where('id_mahasiswa', $idMahasiswa)
            ->where('id_soal', $soalTambahan->id)
            ->where('status', 1)
            ->exists();

        $isKonversiDone = false;
        if ($konversiTambahan) {
            $isKonversiDone = DB::table('ujian_kode')
                ->where('id_mahasiswa', $idMahasiswa)
                ->where('id_bank_soal_konversi', $konversiTambahan->id ?? null)
                ->exists();
        }

        $result[] = [
            'type'        => 'soal',
            'id'          => $soalTambahan->id,
            'judul'       => $soalTambahan->judul,
            'difficulty'  => $soalTambahan->difficulty,
            'status'      => $isPseudoDone ? 'done' : 'active',
            'badge'       => null,
            'is_tambahan' => $isArs,
            'batch'       => $batch,
        ];

        if ($konversiTambahan) {
            $result[] = [
                'type'        => 'konversi',
                'id'          => $konversiTambahan->id,
                'judul'       => $konversiTambahan->judul_soal ?? $konversiTambahan->judul ?? null,
                'difficulty'  => $soalTambahan->difficulty,
                'status'      => !$isPseudoDone ? 'locked' : ($isKonversiDone ? 'done' : 'active'),
                'is_tambahan' => $isArs,
                'batch'       => $batch,
            ];
        }

        return [
            'id'         => $soalTambahan->id,
            'difficulty' => $soalTambahan->difficulty,
        ];
    }
}
