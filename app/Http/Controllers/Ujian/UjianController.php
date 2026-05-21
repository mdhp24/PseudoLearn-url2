<?php

namespace App\Http\Controllers\Ujian;

use App\Models\Soal;
use App\Models\Nyawa;
use Illuminate\Http\Request;
use App\Services\UjianService;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;

class UjianController extends Controller
{
    protected $soalModel;
    protected $ujianService;

    public function __construct()
    {
        $this->soalModel = new Soal();
        $this->ujianService = new UjianService();
    }

    public function index(Request $request)
    {
        $id = $request->query('id');
        $soal = $this->soalModel->find($id);

        $idUser = Auth::id();
        $nyawa = Nyawa::where('id_user', $idUser)->first();

        // Check and regenerate lives (10 nyawa per menit)
        $nyawa->checkAndRegenerate();

        return view('pages.Ujian.index', [
            'title' => 'Ujian Pseudocode',
            'soal' => $soal,
            'id_level' => $soal->id_level,
            'lives' => $nyawa->nyawa,
            'max_lives' => $nyawa->max_nyawa,
            'next_regen_at' => $nyawa->next_regen_at
        ]);
    }

    public function submit(Request $request)
    {
        $opr = $this->ujianService->submit($request);

        return $opr;
    }

    public function sendLog(Request $request)
    {
        $opr = $this->ujianService->sendLog($request);

        return $opr;
    }

    /**
     * Endpoint untuk menyimpan waktu pengerjaan saat tab ditutup / reload.
     * Dipanggil via navigator.sendBeacon (application/json body).
     * Selalu kembalikan HTTP 204 (No Content) — browser tidak menunggu response.
     */
    public function saveTimer(Request $request)
    {
        try {
            // sendBeacon mengirim payload sebagai raw JSON body
            $payload = $request->all();

            // Fallback: baca dari raw body jika request->all() kosong
            if (empty($payload)) {
                $raw = $request->getContent();
                if ($raw) {
                    $decoded = json_decode($raw, true);
                    if (is_array($decoded)) {
                        $payload = $decoded;
                    }
                }
            }

            $soalId = $payload['soal_id'] ?? null;
            $waktu  = isset($payload['waktu']) ? (int) $payload['waktu'] : null;

            if ($soalId && $waktu !== null && $waktu > 0) {
                $this->ujianService->saveTimer($soalId, $waktu);
            }
        } catch (\Throwable $e) {
            Log::warning('saveTimer error: ' . $e->getMessage());
        }

        // 204 — tidak ada body, browser tidak butuh response
        return response()->noContent();
    }
}
