<?php

namespace App\Http\Controllers\Chatbot;

use App\Http\Controllers\Controller;
use App\Models\ChatbotAccessLog;
use App\Models\Mahasiswa;
use App\Services\ChatbotService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

class ChatbotController extends Controller
{
    protected ChatbotService $chatbotService;

    public function __construct(ChatbotService $chatbotService)
    {
        $this->chatbotService = $chatbotService;
    }

    /**
     * Kirim pesan chatbot biasa
     */
    public function send(Request $request): JsonResponse
    {
        try {
            $request->validate([
                'message'   => 'required|string|max:1000',
                'id_soal'   => 'nullable|string',
                'id_level'  => 'nullable|string',
                'access_id' => 'nullable|string',
            ]);

            $user = Auth::user();

            if (!$user) {
                return response()->json([
                    'success' => false,
                    'message' => 'User tidak ditemukan. Silakan login kembali.',
                ], 401);
            }

            $mahasiswa = Mahasiswa::where('id_user', $user->id)->first();

            if (!$mahasiswa) {
                return response()->json([
                    'success' => false,
                    'message' => 'Data mahasiswa tidak ditemukan.',
                ], 404);
            }

            $respons = $this->chatbotService->chat(
                idMahasiswa: $mahasiswa->id,
                pesan:       $request->input('message'),
                idSoal:      $request->input('id_soal'),
                idLevel:     $request->input('id_level'),
            );

            return response()->json([
                'success' => true,
                'respons' => $respons,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Terjadi kesalahan: ' . $e->getMessage(),
            ], 500);
        }
    }

    /**
     * Log ketika mahasiswa membuka chatbot
     */
    public function open(Request $request): JsonResponse
    {
        try {
            $user = Auth::user();

            if (!$user) {
                return response()->json([
                    'success' => false,
                    'message' => 'User tidak ditemukan. Silakan login kembali.'
                ], 401);
            }

            $mahasiswa = Mahasiswa::where('id_user', $user->id)->first();

            if (!$mahasiswa) {
                return response()->json([
                    'success' => false,
                    'message' => 'Data mahasiswa tidak ditemukan.'
                ], 404);
            }

            $log = ChatbotAccessLog::create([
                'id_mahasiswa' => $mahasiswa->id,
                'type'         => 'biasa',
                'opened_at'    => Carbon::now(),
            ]);

            return response()->json([
                'success'   => true,
                'access_id' => $log->id,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Terjadi kesalahan: ' . $e->getMessage(),
            ], 500);
        }
    }

    /**
     * Log ketika mahasiswa menutup chatbot
     */
    public function close(Request $request): JsonResponse
    {
        try {
            $request->validate([
                'access_id' => 'required|string',
            ]);

            $user = Auth::user();

            if (!$user) {
                return response()->json([
                    'success' => false,
                    'message' => 'User tidak ditemukan. Silakan login kembali.'
                ], 401);
            }

            $mahasiswa = Mahasiswa::where('id_user', $user->id)->first();

            if (!$mahasiswa) {
                return response()->json([
                    'success' => false,
                    'message' => 'Data mahasiswa tidak ditemukan.'
                ], 404);
            }

            $log = ChatbotAccessLog::where('id', $request->input('access_id'))
                ->where('id_mahasiswa', $mahasiswa->id)
                ->whereNull('closed_at')
                ->first();

            if (!$log) {
                return response()->json([
                    'success' => false,
                    'message' => 'Log akses tidak ditemukan.'
                ], 404);
            }

            $closedAt = Carbon::now();

            $durasiDetik = abs(
                $log->opened_at->diffInSeconds($closedAt)
            );

            $durasiMenit = (int) floor($durasiDetik / 60);

            $log->update([
                'closed_at'    => $closedAt,
                'durasi_menit' => $durasiMenit,
            ]);

            return response()->json([
                'success' => true
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Terjadi kesalahan: ' . $e->getMessage(),
            ], 500);
        }
    }

    /**
     * Cek performa mahasiswa
     */
    public function checkPerformance(Request $request): JsonResponse
    {
        $request->validate([
            'id_soal'      => 'required|string',
            'id_level'     => 'required|string',
            'elapsed_time' => 'required|integer|min:0',
        ]);

        $user = Auth::user();

        $mahasiswa = Mahasiswa::where('id_user', $user->id)->first();

        if (!$mahasiswa) {

            return response()->json([
                'success' => false,
                'message' => 'Data mahasiswa tidak ditemukan.'
            ], 404);
        }

        $result = $this->chatbotService->checkPerformance(
            idMahasiswa: $mahasiswa->id,
            idSoal:      $request->input('id_soal'),
            idLevel:     $request->input('id_level'),
            elapsedTime: (int) $request->input('elapsed_time'),
        );

        return response()->json([
            'success' => true,
            ...$result,
        ]);
    }
}