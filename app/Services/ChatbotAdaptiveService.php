<?php

namespace App\Services;

use App\Models\ChatbotLog;
use App\Models\Soal;
use App\Models\Level;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class ChatbotAdaptiveService
{
    /**
     * Kirim pesan ke Gemini API
     */
    private function sendToGemini(string $systemPrompt, string $userMessage, int $maxTokens = 1024): string
    {
        $apiKey = config('services.gemini.api_key');
        $model  = config('services.gemini.model', 'gemini-2.5-flash');
        $url    = config('services.gemini.url') . $model . ':generateContent?key=' . $apiKey;

        $payload = [
            'system_instruction' => [
                'parts' => [
                    ['text' => $systemPrompt]
                ]
            ],
            'contents' => [
                [
                    'role'  => 'user',
                    'parts' => [
                        ['text' => $userMessage]
                    ]
                ]
            ],
            'generationConfig' => [
                'temperature'     => 0.7,
                'maxOutputTokens' => $maxTokens,
            ]
        ];

        /** @var \Illuminate\Http\Client\Response $response */
        $response = Http::timeout(30)->post($url, $payload);

        if ($response->failed()) {
            Log::error('Gemini API error', [
                'status' => $response->status(),
                'body'   => $response->body(),
            ]);
            return 'Maaf, saya sedang tidak dapat merespons saat ini. Silakan coba lagi.';
        }

        $data = $response->json();

        return $data['candidates'][0]['content']['parts'][0]['text']
            ?? 'Maaf, saya tidak dapat memproses pertanyaan kamu saat ini.';
    }

    /**
     * Adaptive chat: Beri bimbingan materi otomatis untuk mahasiswa low performance.
     */
    public function adaptiveChat(string $idMahasiswa, ?string $idSoal, ?string $idLevel, string $label): string
    {
        $soalInfo  = '';
        $levelInfo = '';
        $soalContent = '';

        if ($idLevel) {
            $level = Level::find($idLevel);
            if ($level) {
                $levelInfo = "Level saat ini: {$level->name}.";
            }
        }

        $tipeDataInfo = '';
        $algoritmaInfo = '';

        if ($idSoal) {
            $soal = Soal::find($idSoal);
            if ($soal) {
                $soalInfo = "Judul soal: {$soal->judul}.";
                $soalContent = strip_tags($soal->soal ?? '');

                // Ambil konsep tipe data yang ada di soal
                $kunciTipeData = is_array($soal->kunci_tipe_data)
                    ? $soal->kunci_tipe_data
                    : json_decode($soal->kunci_tipe_data ?? '[]', true);
                if (!empty($kunciTipeData)) {
                    $tipeDataList = collect($kunciTipeData)->pluck('tipe_data')->unique()->implode(', ');
                    $tipeDataInfo = "Tipe data yang terlibat dalam soal ini: {$tipeDataList}.";
                }

                // Ambil konsep algoritma yang ada di soal
                $kunciAlgoritma = is_array($soal->kunci_algoritma)
                    ? $soal->kunci_algoritma
                    : json_decode($soal->kunci_algoritma ?? '[]', true);
                if (!empty($kunciAlgoritma)) {
                    $langkahCount = count($kunciAlgoritma);
                    $algoritmaInfo = "Soal ini memiliki {$langkahCount} langkah algoritma yang harus disusun.";
                }
            }
        }

        // Validasi label: hanya Struggling atau Gaming the System yang diterima (sudah divalidasi di controller)
        $isStruggling = false; // flag untuk membedakan logika prompt
        if ($label === 'Struggling') {
            $kondisi = 'Mahasiswa ini terdeteksi STRUGGLING (kesulitan): banyak melakukan percobaan drag-drop DAN menghabiskan waktu lama. Ia membutuhkan bimbingan dasar step-by-step untuk memahami konsep dengan lebih baik.';
            $isStruggling = true;
        } elseif ($label === 'Gaming the System') {
            $kondisi = 'Mahasiswa ini terdeteksi GAMING THE SYSTEM (menebak-nebak): banyak melakukan percobaan drag-drop TETAPI menyelesaikan dengan cepat menunjukkan menebak-nebak. Ia perlu diarahkan untuk lebih teliti memahami konsep, bukan asal menebak jawaban.';
            $isStruggling = false;
        } else {
            $kondisi = 'Kondisi performa yang tidak terdefinisi. Silakan hubungi administrator.';
            $isStruggling = true;
        }

        // Customized system prompt berdasarkan kondisi performa
        $aturanTambahan = $isStruggling
            ? "FOKUS: Jelaskan konsep secara langkah demi langkah (step-by-step). Gunakan analogi sederhana untuk memudahkan pemahaman."
            : "FOKUS: Dorong mahasiswa untuk berpikir lebih teliti. Highlight perbedaan tipe data, kondisi, loop yang mungkin terlewatkan saat menebak.";

        $systemPrompt = "Kamu adalah PseudoLearn Chatbot Adaptif untuk membantu mahasiswa memahami soal pseudocode.

    {$levelInfo}
    {$soalInfo}
    Deskripsi soal: {$soalContent}
    {$tipeDataInfo}
    {$algoritmaInfo}

    {$kondisi}

    ATURAN RESPON (WAJIB):
    - Singkat, jelas, maksimal 120 kata.
    - Format poin-poin, tanpa paragraf panjang.
    - Jangan memberi jawaban langsung.
    - Gunakan Markdown; judul bagian tebal (**Judul**).
    - Tebalkan istilah penting saat pertama kali disebut.
    - {$aturanTambahan}

    FORMAT JAWABAN (gunakan bagian yang relevan):
    **Penjelasan Soal** (1-2 kalimat)
    **Tipe Data** (maks 2 kalimat per tipe)
    **Kondisi** (maks 2 kalimat per tipe)
    **Perulangan** (maks 2 kalimat per tipe)
    **Fungsi** (maks 2 kalimat per tipe)
    **Array 1/Array 2** (opsional, maks 2 kalimat per tipe)
    **Stack/Queue** (maks 2 kalimat per tipe)
    **Sorting/Searching** (maks 2 kalimat per tipe)
    **Algoritma** (2-3 poin)
    **Petunjuk Memahami Soal** (3-4 poin)

    Gunakan bahasa Indonesia sederhana dan langsung ke inti.";
        $userMessage = "Tolong berikan penjelasan pada soal ini: jelaskan tipe data dan algoritma yang terlibat, lalu berikan poin-poin bimbingan untuk membantu saya memahami soal.";

        $respons = $this->sendToGemini($systemPrompt, $userMessage, 2048);

        ChatbotLog::create([
            'id_mahasiswa' => $idMahasiswa,
            'id_level'     => $idLevel ?: null,
            'id_soal'      => $idSoal ?: null,
            'type'         => 'adaptive',
            'pesan'        => "[ADAPTIVE - {$label}] Bimbingan materi otomatis",
            'respons'      => $respons,
        ]);

        return $respons;
    }
}
