<?php

namespace App\Services;

use App\Core\BaseResponse;
use App\Repositories\KonversiRepository;
use App\Models\Konversi as KonversiModel;

class KonversiService
{
    protected $konversiRepository;
    public function __construct()
    {
        $this->konversiRepository = new KonversiRepository();
    }

    public function table($request)
    {
        $data = $this->konversiRepository->table($request);
        return $data;
    }

    public function store($request)
    {
        $data = $this->konversiRepository->store($request);
        return $data;
    }

    public function getSoalByLevel($request){
        $opr = $this->konversiRepository->getSoalByLevel($request);
        return $opr;
    }

    public function destroy($id)
    {
        $data = $this->konversiRepository->destroy($id);
        return $data;
    }

    public function runKonversi($request)
    {
        // Jalankan kompilasi/eksekusi Java terlebih dahulu
        $runResponse = $this->konversiRepository->runJavaCode($request);

        // Ambil data dari JsonResponse/Response object
        $runData = $runResponse instanceof \Illuminate\Http\JsonResponse ? $runResponse->getData(true) : (is_array($runResponse) ? $runResponse : []);

        // Normalisasi output
        $javaOutput = '';
        if (is_array($runData)) {
            $javaOutput = $runData['data']['output'] ?? ($runData['output'] ?? '');
        } elseif (is_object($runData)) {
            $javaOutput = $runData->data->output ?? ($runData->output ?? '');
        }

        // Jika kompilasi/eksekusi berhasil, simpan record konversi agar tampil pada halaman admin/siswa
        try {
            $runSuccess = is_array($runData) && (($runData['status'] ?? false) === true);
            if ($runSuccess || $javaOutput !== '') {
                $soalId = $request->input('soal_id');
                $levelId = $request->input('level_id');
                $bobot = (int)$request->input('bobot', 0);

                // Normalisasi codes => jawaban structured
                $codes = $request->input('codes', []);
                $jawabanStructured = [];
                $inc = 1;
                foreach ($codes as $c) {
                    $val = is_array($c) ? ($c['value'] ?? '') : $c;
                    if (trim((string)$val) === '') { $inc++; continue; }
                    $jawabanStructured[] = [ $inc => $val ];
                    $inc++;
                }

                $payload = [
                    'id_level' => $levelId,
                    'id_soal' => $soalId,
                    'jawaban' => $jawabanStructured,
                    'output' => $javaOutput,
                    'bobot' => $bobot,
                ];

                // Upsert berdasarkan id_soal agar tidak berganda
                $konvModel = new KonversiModel();
                $konv = $konvModel->updateOrCreate([
                    'id_soal' => $soalId
                ], $payload);

                return BaseResponse::json([
                    'status' => true,
                    'message' => 'Konversi dijalankan dan disimpan.',
                    'konversi' => $konv,
                    'output' => $javaOutput,
                    'java_output' => $javaOutput
                ]);
            }
        } catch (\Exception $e) {
            // Jika penyimpanan gagal, kembalikan error tetapi sertakan keluaran java jika ada
            return BaseResponse::errorMessage(['message' => 'Gagal menyimpan hasil konversi', 'error' => $e->getMessage()]);
        }

        // Jika tidak ada output dan tidak berhasil, kembalikan response asli
        return $runResponse;
    }

    public function update($request)
    {
        $data = $this->konversiRepository->updateKonversi($request);
        return $data;
    }

    public function submitKonversi($request)
    {
        $opr = $this->konversiRepository->submitKonversi($request);

        return $opr;
    }

    public function tableUjianKonversi($request)
    {
        $data = $this->konversiRepository->tableUjianKonversi($request);
        return $data;
    }

    public function tableDetail($request)
    {
        $data = $this->konversiRepository->tableDetail($request);
        return $data;
    }
}
