<?php

namespace App\Repositories;

use App\Models\Soal;
use App\Models\Level;
use App\Models\Nyawa;
use App\Models\Ujian;
use App\Models\LogData;
use App\Models\LabelSkor;
use App\Models\Mahasiswa;
use App\Core\BaseResponse;
use App\Models\Pencapaian;
use Illuminate\Support\Str;
use App\Services\DecoyAnswerService;
use App\Models\HistoryJawaban;
use App\Models\HistoryConfidence;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Schema;
use Prettus\Repository\Eloquent\BaseRepository;
use App\Models\ArsResult;

/**
 * Class KelasRepository.
 * 
 * @package namespace App\Repositories;
 */
class UjianRepository extends BaseRepository
{

    protected $model;
    protected $mahasiswaModel;
    protected $logDataModel;
    protected $ujianModel;
    protected $levelModel;
    protected $historyJawabanModel;
    protected $historyConfidenceModel;
    protected $labelSkorModel;

    public function __construct()
    {
        $this->model = new Soal();
        $this->mahasiswaModel = new Mahasiswa();
        $this->logDataModel = new LogData();
        $this->ujianModel = new Ujian();
        $this->levelModel = new Level();
        $this->historyJawabanModel = new HistoryJawaban();
        $this->historyConfidenceModel = new HistoryConfidence();
        $this->labelSkorModel = new LabelSkor();
    }

    /**
     * Specify the model class name.
     *
     * @return string
     */
    public function model()
    {
        return $this->model;
    }

    /**
     * Boot up the repository, pushing criteria.
     *
     * @throws \Prettus\Repository\Exceptions\RepositoryException
     */
    public function boot()
    {
        // Add your boot logic here
    }

    public function submit($request)
    {
        try {
            DB::beginTransaction();

            $idMahasiswa = $this->mahasiswaModel->where('id_user', Auth::id())->value('id');
            $soal = $this->model->where('id', $request->input('soal_id'))->first();
            if (!$soal) {
                DB::rollBack();
                return BaseResponse::errorMessage('Soal tidak ditemukan');
            }

            $dataLevel = $this->levelModel->find($soal->id_level);

            $jawaban = $request->input('jawaban', []);
            $jawabanTipe = $jawaban['tipe_data'] ?? [];
            $jawabanAlgo = $jawaban['algoritma'] ?? [];
            $historyJawabanTipe = [];
            $historyJawabanAlgo = [];

            $decodeJson = function ($raw) {
                if (is_array($raw))
                    return $raw;

                $clean = trim($raw);

                if (
                    (Str::startsWith($clean, '"') && Str::endsWith($clean, '"')) ||
                    (Str::startsWith($clean, "'") && Str::endsWith($clean, "'"))
                ) {
                    $clean = substr($clean, 1, -1);
                }

                $decoded = json_decode($clean, true);

                if (json_last_error() !== JSON_ERROR_NONE) {
                    $decoded = json_decode(stripslashes($clean), true);
                }

                return is_array($decoded) ? $decoded : [];
            };

            $kunciTipe = collect($decodeJson($soal->kunci_tipe_data))
                ->filter(fn($r) => ($r['variabel'] ?? null) !== null)
                ->values()
                ->toArray();

            $kunciAlgo = collect($decodeJson($soal->kunci_algoritma))
                ->values()
                ->toArray();

            $tipeMismatch = [];
            $isCorrectTipe = true;
            $tipeMismatchIndexes = [];

            $maxTipeCount = max(count($kunciTipe), count($jawabanTipe));
            for ($i = 0; $i < $maxTipeCount; $i++) {
                $expectedRow = $kunciTipe[$i] ?? [];
                $givenRow = $jawabanTipe[$i] ?? [];
                $normExpVar = $this->normalizeAnswerText($expectedRow['variabel'] ?? '');
                $normExpTipe = $this->normalizeAnswerText($expectedRow['tipe_data'] ?? '');
                $normGivVar = $this->normalizeAnswerText($givenRow['variabel'] ?? '');
                $normGivTipe = $this->normalizeAnswerText($givenRow['jawaban'] ?? '');

                if ($normExpVar !== $normGivVar || $normExpTipe !== $normGivTipe) {
                    $tipeMismatchIndexes[] = $i;
                }
            }

            if (count($jawabanTipe) !== count($kunciTipe) || count($tipeMismatchIndexes) > 0) {
                $isCorrectTipe = false;
                if (count($jawabanTipe) !== count($kunciTipe)) {
                    $tipeMismatch[] = ['reason' => 'length_not_match', 'expected_count' => count($kunciTipe), 'given_count' => count($jawabanTipe)];
                }
            }

            foreach ($kunciTipe as $i => $row) {
                $jawabRow = $jawabanTipe[$i] ?? [];
                $expectedVariabel = $row['variabel'] ?? '';
                $expectedTipe = $row['tipe_data'] ?? '';
                $givenVariabel = $jawabRow['variabel'] ?? '';
                $givenTipe = $jawabRow['jawaban'] ?? '';

                $normExpVar = $this->normalizeAnswerText($expectedVariabel);
                $normGivVar = $this->normalizeAnswerText($givenVariabel);
                $normExpTipe = $this->normalizeAnswerText($expectedTipe);
                $normGivTipe = $this->normalizeAnswerText($givenTipe);

                $rowIsCorrect = ($normExpVar === $normGivVar && $normExpTipe === $normGivTipe);
                if (!$rowIsCorrect) {
                    $tipeMismatch[] = [
                        'index' => $i,
                        'expected' => ['variabel' => $expectedVariabel, 'tipe_data' => $expectedTipe],
                        'given' => ['variabel' => $givenVariabel, 'tipe_data' => $givenTipe]
                    ];
                }

                $historyJawabanTipe[] = [
                    'id' => (string) Str::uuid(),
                    'id_level' => $soal->id_level,
                    'id_soal' => $soal->id,
                    'id_mahasiswa' => $idMahasiswa,
                    'index_tipe_data' => $i,
                    'tipe_data' => $givenTipe,
                    'index_algoritma' => null,
                    'algoritma' => null,
                    'status' => $rowIsCorrect ? 'benar' : 'salah',
                    'created_at' => now(),
                    'updated_at' => now(),
                    'deleted_at' => null,
                ];
            }

            $algoMismatch = [];
            $isCorrectAlgo = true;
            $algoritmaMismatchIndexes = [];

            $kunciLangkah = array_map(fn($r) => trim($r['langkah'] ?? ''), $kunciAlgo);
            $jawabLangkah = array_map(fn($r) => trim($r['langkah'] ?? ''), $jawabanAlgo);
            $maxAlgoCount = max(count($kunciLangkah), count($jawabLangkah));

            for ($i = 0; $i < $maxAlgoCount; $i++) {
                $exp = $kunciLangkah[$i] ?? '';
                $given = $jawabLangkah[$i] ?? '';

                $normExpAlgo = $this->normalizeAnswerText($exp);
                $normGivAlgo = $this->normalizeAnswerText($given);

                if ($normExpAlgo !== $normGivAlgo) {
                    $algoritmaMismatchIndexes[] = $i;
                }
            }

            if (count($jawabLangkah) !== count($kunciLangkah) || count($algoritmaMismatchIndexes) > 0) {
                $isCorrectAlgo = false;
                if (count($jawabLangkah) !== count($kunciLangkah)) {
                    $algoMismatch[] = ['reason' => 'length_not_match', 'expected_count' => count($kunciLangkah), 'given_count' => count($jawabLangkah)];
                }
            }

            foreach ($kunciLangkah as $i => $exp) {
                $given = $jawabLangkah[$i] ?? '';

                $normExpAlgo = $this->normalizeAnswerText($exp);
                $normGivAlgo = $this->normalizeAnswerText($given);

                $rowIsCorrect = ($normExpAlgo === $normGivAlgo);
                if (!$rowIsCorrect) {
                    $algoMismatch[] = [
                        'index' => $i,
                        'expected' => $exp,
                        'given' => $given
                    ];
                }

                $historyJawabanAlgo[] = [
                    'id' => (string) Str::uuid(),
                    'id_level' => $soal->id_level,
                    'id_soal' => $soal->id,
                    'id_mahasiswa' => $idMahasiswa,
                    'index_tipe_data' => null,
                    'tipe_data' => null,
                    'index_algoritma' => $i,
                    'algoritma' => $given,
                    'status' => $rowIsCorrect ? 'benar' : 'salah',
                    'created_at' => now(),
                    'updated_at' => now(),
                    'deleted_at' => null,
                ];
            }

            $isCorrectAll = $isCorrectTipe && $isCorrectAlgo;

            $dataUjian = [
                'id' => (string) Str::uuid(),
                'id_level' => $dataLevel->id,
                'id_soal' => $soal->id,
                'id_mahasiswa' => $idMahasiswa,
                'waktu' => $request->waktu,
                'status' => $isCorrectAll ? 1 : 0,
                'created_at' => now(),
                'updated_at' => now(),
                'deleted_at' => null,
            ];

            $dataHistoryConfidence = [
                'id_level' => $soal->id_level,
                'id_soal' => $soal->id,
                'id_mahasiswa' => $idMahasiswa,
                'id_ujian' => $dataUjian['id'],
                'status_jawaban' => $isCorrectAll ? 1 : 0,
                'status_confidence' => $request->confidence,
            ];

            $this->historyJawabanModel->insert(array_merge($historyJawabanTipe, $historyJawabanAlgo));
            $this->ujianModel->insert($dataUjian);
            $this->historyConfidenceModel->create($dataHistoryConfidence);

            $dataPencapaian = Pencapaian::where('id_mahasiswa', $idMahasiswa)
                ->where('id_level', $soal->id_level)
                ->where('id_soal', $soal->id)
                ->where('category', 'soal')
                ->first();

            $returnPencapaian = null;
            $returnPencapaianBadge = null;

            if ($dataPencapaian && $dataPencapaian->status == 0 && $isCorrectAll) {
                $dataPencapaian->update([
                    'status' => 1,
                    'updated_at' => now(),
                ]);

                $returnPencapaian = [
                    'id' => $dataPencapaian->id,
                ];
            }

            DB::commit();

            if ($isCorrectAll) {
                $ujianQuery = $this->ujianModel->setView('v_ujian')
                    ->where('id_mahasiswa', $idMahasiswa)
                    ->where('id_level', $soal->id_level)
                    ->where('id_soal', $soal->id);
                $totalWaktuDetik = $ujianQuery->sum('waktu');

                $logDataQuery = $this->logDataModel->setView('v_log_data')
                    ->where('id_mahasiswa', $idMahasiswa)
                    ->where('id_level', $soal->id_level)
                    ->where('id_soal', $soal->id);
                $totalDrag = $logDataQuery->count();

                [$label, $skor] = $this->determineLabelAndScore($totalDrag, $totalWaktuDetik);

                $existing = $this->labelSkorModel
                    ->where('id_level', $soal->id_level)
                    ->where('id_soal', $soal->id)
                    ->where('id_mahasiswa', $idMahasiswa)
                    ->first();

                if ($existing) {
                    $existing->update([
                        'label' => $label,
                        'skor' => $skor,
                        'updated_at' => now(),
                    ]);
                } else {
                    $this->labelSkorModel->create([
                        'id' => (string) Str::uuid(),
                        'id_level' => $soal->id_level,
                        'id_soal' => $soal->id,
                        'id_mahasiswa' => $idMahasiswa,
                        'label' => $label,
                        'skor' => $skor,
                        'created_at' => now(),
                        'updated_at' => now(),
                    ]);
                }

                if (Schema::hasTable('ars_result')) {
                    $arsResult = ArsResult::where('id_mahasiswa', $idMahasiswa)
                        ->where('id_level', $soal->id_level)
                        ->where('id_soal', $soal->id)
                        ->first();

                    if ($arsResult) {
                        $arsResult->update([
                            'pseudo_label' => $label,
                            'pseudo_score' => $skor,
                            'pseudo_langkah' => $totalDrag,
                            'pseudo_durasi' => $totalWaktuDetik,
                        ]);
                    }
                }
                if ($label === 'Ideal' || $label === 'Normal') {
                    $dataPencapaianBadge = Pencapaian::where('id_mahasiswa', $idMahasiswa)
                        ->where('id_level', $soal->id_level)
                        ->where('id_soal', $soal->id)
                        ->where('category', 'badge')
                        ->first();

                    if ($dataPencapaianBadge && $dataPencapaianBadge->status == 0 && $isCorrectAll) {
                        $dataPencapaianBadge->update([
                            'status' => 1,
                            'updated_at' => now(),
                        ]);

                        $returnPencapaianBadge = [
                            'id' => $dataPencapaianBadge->id,
                        ];
                    }
                }

                $returnData = [
                    'correct' => true,
                    'pencapaian' => $returnPencapaian,
                    'badge' => $returnPencapaianBadge,
                ];

                return response()->json($returnData);
            } else {
                $nyawa = Nyawa::where('id_user', Auth::id())->first();

                if ($nyawa->nyawa > 0) {
                    $nyawa->applyWrongAnswerPenalty(1);
                }

                $decoy = $this->buildDecoyForGaming($idMahasiswa, $soal, $kunciTipe, $kunciAlgo);

                return BaseResponse::json([
                    'correct' => $isCorrectAll,
                    'correct_tipe_data' => $isCorrectTipe,
                    'correct_algoritma' => $isCorrectAlgo,
                    'tipe_mismatch' => $dataLevel->feedback_data_type ?? null,
                    'algoritma_mismatch' => $dataLevel->feedback_algorithm ?? null,
                    'tipe_mismatch_index' => array_values(array_unique($tipeMismatchIndexes)),
                    'algoritma_mismatch_index' => array_values(array_unique($algoritmaMismatchIndexes)),
                    'incorrect_slots' => [
                        'tipe_data' => array_values(array_unique($tipeMismatchIndexes)),
                        'algoritma' => array_values(array_unique($algoritmaMismatchIndexes)),
                    ],
                    'id_level' => $soal->id_level,
                    'decoy' => $decoy,
                ]);
            }

        } catch (\Exception $e) {
            DB::rollBack();
            return BaseResponse::errorMessage($e->getMessage());
        }
    }

    private function buildDecoyForGaming($idMahasiswa, $soal, array $kunciTipe, array $kunciAlgo): ?array
    {
        $label = $this->labelSkorModel
            ->where('id_level', $soal->id_level)
            ->where('id_soal', $soal->id)
            ->where('id_mahasiswa', $idMahasiswa)
            ->orderByDesc('created_at')
            ->value('label');

        if ($label !== 'Gaming the System') {
            return null;
        }

        $decoyService = new DecoyAnswerService();

        $tipeLines = array_map(function ($row) {
            $variabel = trim((string) ($row['variabel'] ?? ''));
            $tipe = trim((string) ($row['tipe_data'] ?? ''));

            if ($variabel === '' && $tipe === '') {
                return '';
            }

            if ($variabel === '') {
                return $tipe;
            }

            if ($tipe === '') {
                return $variabel;
            }

            return $variabel . ' : ' . $tipe;
        }, $kunciTipe);

        $algoLines = array_map(function ($row) {
            return trim((string) ($row['langkah'] ?? ''));
        }, $kunciAlgo);

        $tipeDecoy = $decoyService->makeDecoyLines($tipeLines);
        $algoDecoy = $decoyService->makeDecoyLines($algoLines);

        if (empty(array_filter($tipeDecoy)) && empty(array_filter($algoDecoy))) {
            return null;
        }

        return [
            'tipe_data' => $tipeDecoy,
            'algoritma' => $algoDecoy,
        ];
    }

    /**
     * Tentukan label dan skor berdasarkan totalDrag dan totalWaktuDetik.
     *
     * @param int $totalDrag
     * @param int $totalWaktuDetik
     * @return array [label, skor]
     */
    private function determineLabelAndScore($totalDrag, $totalWaktuDetik)
    {
        if ($totalDrag <= 18 && $totalWaktuDetik < 53) {
            return ['Ideal', 90];
        } elseif ($totalDrag > 18 && $totalWaktuDetik >= 53) {
            return ['Struggling', 30];
        } elseif ($totalDrag <= 18 && $totalWaktuDetik >= 53) {
            return ['Normal', 70];
        } elseif ($totalDrag >= 18 && $totalWaktuDetik < 53) {
            return ['Gaming the System', 50];
        } else {
            return [null, null];
        }
    }

    private function normalizeAnswerText($value): string
    {
        if ($value === null) {
            return '';
        }

        $text = trim((string) $value);
        if ($text === '') {
            return '';
        }

        // Normalize non-breaking spaces, zero-width spaces, HTML entities, quotes, and whitespace.
        $text = str_replace("\xc2\xa0", ' ', $text);
        $text = preg_replace('/[\x{200B}-\x{200D}\x{FEFF}]/u', '', $text);
        $text = preg_replace('/&quot;/i', '"', $text);
        $text = preg_replace('/&#039;/i', "'", $text);
        $text = preg_replace('/&amp;/i', '&', $text);
        $text = preg_replace('/["\'“”`’‘]/u', '"', $text);
        $text = preg_replace('/\s+/', '', strtolower($text));

        return $text ?? '';
    }

    // Chatbot adaptive sync removed

    public function sendLog($request)
    {
        try {
            DB::beginTransaction();

            $idUser = Auth::id();
            $idMahasiswa = $this->mahasiswaModel->where('id_user', $idUser)->value('id');

            $data = [
                'id_soal' => $request['soal_id'],
                'id_mahasiswa' => $idMahasiswa,
                'index' => $request['index'],
                'itemText' => $request['item'],
                'timer_second' => $request['timer_second'],
                'type' => $request['jenis'],
                'variabel' => $request['variabel']
            ];

            $opr = $this->logDataModel->create($data);

            DB::commit();
            return BaseResponse::created($opr);
        } catch (\Exception $e) {
            DB::rollBack();
            return BaseResponse::errorTransaction($e);
        }
    }

    // Chatbot adaptive timer save removed

    //         // Hanya update jika waktu yang disimpan lebih besar dari sebelumnya
    //         // (hindari menimpa data submit yang sudah benar)
    //         $existing = (int) ($detail['waktu_detik_submit'] ?? $detail['waktu_detik'] ?? 0);
    //         if ($safeWaktu <= $existing) {
    //             return;
    //         }

    //         $detail['waktu_detik_submit'] = $safeWaktu;
    //         $detail['waktu_detik']        = $safeWaktu;

    //         if (empty($detail['waktu_akses_detik'])) {
    //             $detail['waktu_akses_detik'] = $safeWaktu;
    //         }

    //         // Sync columns for consistency
    //         $updateData = ['detail' => $detail];
    //         if ($adaptiveLog->waktu_mulai) {
    //             $updateData['waktu_selesai'] = $adaptiveLog->waktu_mulai->copy()->addSeconds($safeWaktu);
    //         }

    //         $adaptiveLog->update($updateData);
    //     } catch (\Throwable $e) {
    //         // Fire-and-forget — jangan lempar exception
    //     }
    // }
}
