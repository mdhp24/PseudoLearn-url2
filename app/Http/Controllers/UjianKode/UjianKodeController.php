<?php

namespace App\Http\Controllers\UjianKode;

use App\Models\Soal;
use App\Models\Nyawa;
use App\Models\Mahasiswa;
use App\Models\BankSoalKonversi;
use App\Models\LogUjianKode;
use Illuminate\Http\Request;
use App\Services\UjianKodeService;
use App\Http\Controllers\Controller;
use App\Models\UjianKode;
use Illuminate\Support\Facades\Auth;

class UjianKodeController extends Controller
{
    protected $soalModel;
    protected $konversiModel;
    protected $ujianKodeService;

    public function __construct()
    {
        $this->soalModel = new Soal();
        $this->konversiModel = new UjianKode();
        $this->ujianKodeService = new UjianKodeService();
    }

    public function index(Request $request)
    {
        $id = $request->query('id');
        $bankSoalKonversi = $this->konversiModel->setView('v_bank_soal_konversi')->where('id', $id)->first();

        if (!$bankSoalKonversi) {
            abort(404, 'Soal tidak ditemukan.');
        }

        $soal = $this->soalModel->where('id', $bankSoalKonversi->id_soal)->first();

        if (!$soal) {
            abort(404, 'Data soal tidak ditemukan.');
        }

        $idUser = Auth::id();
        $nyawa  = Nyawa::where('id_user', $idUser)->first();

        if (!$nyawa) {
            abort(404, 'Data nyawa pengguna tidak ditemukan.');
        }

        // Check dan regenerate lives (10 lives per minute)
        $nyawa->checkAndRegenerate();

        return view('pages.ujian.ujianKode', [
            'title' => 'Ujian Code Program',
            'soal' => $soal,
            'konversi' => $bankSoalKonversi,
            'lives' => $nyawa->nyawa,
            'max_lives' => $nyawa->max_nyawa,
            'next_regen_at' => $nyawa->next_regen_at
        ]);
    }

    public function runScanner(Request $request)
    {
        $request->validate([
            'id_soal_konversi' => 'required|string',
            'scanner_input'    => 'nullable|string|max:2000',
        ]);

        $soalKonversi = BankSoalKonversi::find($request->id_soal_konversi);

        if (!$soalKonversi) {
            return response()->json(['message' => 'Soal tidak ditemukan.'], 404);
        }

        return response()->json([
            'output' => $soalKonversi->output ?? ''
        ]);
    }

    public function submitKonversi(Request $request)
    {
        $opr = $this->ujianKodeService->submitKonversi($request);

        return $opr;
    }

    public function logDrag(Request $request)
    {
        $data = $request->isJson() ? $request->json()->all() : $request->all();

        $idUser = Auth::id() ?? $request->input('id_user') ?? ($data['id_user'] ?? null);
        $mhs = $idUser ? Mahasiswa::where('id_user', $idUser)->orWhere('id', $idUser)->first() : null;
        $idMahasiswa = $mhs ? $mhs->id_user : ($idUser ?? 'system-test');

        $idBankSoalKonversi = $data['id_bank_soal_konversi'] ?? null;
        $idSoalInput = $data['id_soal'] ?? null;
        $idLevel = $data['id_level'] ?? null;
        $index = isset($data['index']) ? (int) $data['index'] : null;
        $itemText = trim((string) ($data['item_text'] ?? ''));
        $blockId = isset($data['block_id']) ? (string) $data['block_id'] : null;
        $waktu = isset($data['waktu']) ? (int) $data['waktu'] : (isset($data['duration']) ? (int) $data['duration'] : 0);

        $soalKonversi = null;
        if (!empty($idBankSoalKonversi)) {
            $soalKonversi = BankSoalKonversi::find($idBankSoalKonversi);
        }
        if (!$soalKonversi && !empty($idSoalInput)) {
            $soalKonversi = BankSoalKonversi::where('id_soal', $idSoalInput)->first();
            if ($soalKonversi) {
                $idBankSoalKonversi = $soalKonversi->id;
            }
        }

        $idSoal = $soalKonversi ? $soalKonversi->id_soal : $idSoalInput;
        if (!$idLevel && $soalKonversi) {
            $idLevel = $soalKonversi->id_level;
        }

        $isCorrect = false;
        if ($soalKonversi && $index !== null) {
            $kunciDenganClue = BankSoalKonversi::parseJawabanWithClue($soalKonversi->jawaban);
            $targetIdx = $index - 1;
            if (isset($kunciDenganClue[$targetIdx])) {
                $expectedCode = BankSoalKonversi::normalizeCodeLine($kunciDenganClue[$targetIdx]['kode'] ?? '');
                $givenCode = BankSoalKonversi::normalizeCodeLine($itemText);
                $isCorrect = ($expectedCode !== '' && $givenCode === $expectedCode);
            }
        }

        if (isset($data['is_correct'])) {
            $isCorrect = filter_var($data['is_correct'], FILTER_VALIDATE_BOOLEAN);
        }

        $log = LogUjianKode::create([
            'id_mahasiswa'          => $idMahasiswa,
            'id_bank_soal_konversi' => $idBankSoalKonversi,
            'id_soal'               => $idSoal,
            'id_level'              => $idLevel,
            'index'                 => $index,
            'block_id'              => $blockId,
            'item_text'             => $itemText,
            'is_correct'            => $isCorrect,
            'waktu'                 => $waktu,
        ]);

        return response()->json([
            'success'    => true,
            'log_id'     => $log->id,
            'is_correct' => $isCorrect,
        ]);
    }
}
