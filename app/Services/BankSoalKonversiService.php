<?php

namespace App\Services;

use App\Core\BaseResponse;
use Illuminate\Support\Facades\DB;
use App\Models\BankSoalKonversi;
use App\Repositories\BankSoalKonversiRepository;

class BankSoalKonversiService
{
    protected $bankSoalKonversiRepository;

    public function __construct()
    {
        $this->bankSoalKonversiRepository = new BankSoalKonversiRepository();
    }

    public function table($request)
    {
        return $this->bankSoalKonversiRepository->table($request);
    }

    public function getSoalByLevel($levelId)
    {
        return $this->bankSoalKonversiRepository->getSoalByLevel($levelId);
    }

    /**
     * Bangun payload jawaban dalam format JSON [{kode, clue}].
     *
     * $request harus mengandung:
     *   - jawaban  : plain text, setiap baris = satu kode Java
     *   - clue[]   : array index baris (0-based) yang ditandai sebagai clue
     */
    private function buildJawabanPayload($request): string
    {
        $rawJawaban = trim($request->input('jawaban', ''));

        // Pecah per baris, buang baris kosong
        $lines = array_values(array_filter(
            array_map('trim', preg_split('/\R/', $rawJawaban) ?: []),
            fn($l) => $l !== ''
        ));

        // Index baris yang ditandai clue (dikirim sebagai array integer)
        $clueIndexes = array_map('intval', (array) $request->input('clue', []));

        $items = [];
        foreach ($lines as $i => $line) {
            $items[] = [
                'kode' => $line,
                'clue' => in_array($i, $clueIndexes, true) ? 1 : 0,
            ];
        }

        return BankSoalKonversi::encodeJawabanWithClue($items);
    }

    public function store($request)
    {
        $payload = [
            'id_level' => $request->input('level_id'),
            'id_soal'  => $request->input('soal_id'),
            'jawaban'  => $this->buildJawabanPayload($request),
            'output'   => $request->input('output'),
        ];

        return $this->bankSoalKonversiRepository->store($payload);
    }

    public function update($request, $id)
    {
        $payload = [
            'id_level' => $request->input('level_id'),
            'id_soal'  => $request->input('soal_id'),
            'jawaban'  => $this->buildJawabanPayload($request),
            'output'   => $request->input('output'),
        ];

        return $this->bankSoalKonversiRepository->update($payload, $id);
    }

    public function destroy($id)
    {
        return $this->bankSoalKonversiRepository->destroy($id);
    }

    public function detail($id)
    {
        return $this->bankSoalKonversiRepository->detail($id);
    }

    public function runKonversi($request)
    {
        return $this->bankSoalKonversiRepository->runJavaCode($request);
    }

    public function getOrderListByLevel(string $levelId)
    {
        return $this->bankSoalKonversiRepository->getOrderListByLevel($levelId);
    }
}
