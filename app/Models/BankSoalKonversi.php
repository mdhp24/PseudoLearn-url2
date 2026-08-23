<?php

namespace App\Models;

use App\Core\BaseModel;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Support\Str;

class BankSoalKonversi extends BaseModel
{
    use HasFactory, HasUuids, SoftDeletes;

    protected $table = 'bank_soal_konversi';
    protected $primaryKey = 'id';
    protected $fillable = [
        'id',
        'id_level',
        'id_soal',
        'difficulty',
        'jawaban',
        'output',
        'difficulty',
    ];

    protected static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            if (empty($model->id)) {
                $model->id = (string) Str::uuid();
            }
        });
    }

    // ─────────────────────────────────────────────────────────────
    //  FORMAT JAWABAN (dua format didukung, backward-compatible)
    //
    //  Format LAMA  → plain text per baris, atau JSON array of strings
    //                 ["int x = 0;", "x++;", "System.out.println(x);"]
    //
    //  Format BARU  → JSON array of objects dengan flag clue
    //                 [{"kode":"int x = 0;","clue":0},{"kode":"x++;","clue":1},...]
    //
    //  clue = 1  → baris ini ditampilkan sebagai petunjuk (hint) di quiz
    //  clue = 0  → baris ini harus diurutkan oleh mahasiswa
    // ─────────────────────────────────────────────────────────────

    /**
     * Parse kolom jawaban → array string kode (urut, tanpa clue info).
     * Dipakai untuk mengacak pilihan drag-and-drop di quiz.
     */
    public static function parseJawabanLines(?string $raw): array
    {
        $raw = trim((string) $raw);
        if ($raw === '') {
            return [];
        }

        if (str_starts_with($raw, '[')) {
            $decoded = json_decode($raw, true);
            if (is_array($decoded)) {
                $lines = [];
                foreach ($decoded as $item) {
                    // Format baru: {"kode": "...", "clue": 0|1}
                    if (is_array($item) && isset($item['kode'])) {
                        $line = trim((string) $item['kode']);
                        if ($line !== '') {
                            $lines[] = $line;
                        }
                        continue;
                    }
                    // Format lama: string biasa
                    if (is_string($item)) {
                        $line = trim($item);
                        if ($line !== '') {
                            $lines[] = $line;
                        }
                    }
                }
                return array_values($lines);
            }
        }

        // Fallback: plain text per baris
        $lines = preg_split('/\R/', $raw) ?: [];
        return array_values(array_filter(array_map('trim', $lines), fn($l) => $l !== ''));
    }

    /**
     * Parse kolom jawaban → array objects lengkap dengan flag clue.
     * Dipakai untuk menampilkan clue di quiz dan form.
     *
     * Return: [['kode' => '...', 'clue' => 0], ...]
     */
    public static function parseJawabanWithClue(?string $raw): array
    {
        $raw = trim((string) $raw);
        if ($raw === '') {
            return [];
        }

        if (str_starts_with($raw, '[')) {
            $decoded = json_decode($raw, true);
            if (is_array($decoded)) {
                $result = [];
                foreach ($decoded as $item) {
                    // Format baru
                    if (is_array($item) && isset($item['kode'])) {
                        $line = trim((string) $item['kode']);
                        if ($line !== '') {
                            $result[] = [
                                'kode' => $line,
                                'clue' => isset($item['clue']) ? (int) $item['clue'] : 0,
                            ];
                        }
                        continue;
                    }
                    // Format lama: string biasa → clue default 0
                    if (is_string($item)) {
                        $line = trim($item);
                        if ($line !== '') {
                            $result[] = ['kode' => $line, 'clue' => 0];
                        }
                    }
                }
                return $result;
            }
        }

        // Fallback: plain text → clue default 0
        $lines = preg_split('/\R/', $raw) ?: [];
        $result = [];
        foreach ($lines as $line) {
            $line = trim($line);
            if ($line !== '') {
                $result[] = ['kode' => $line, 'clue' => 0];
            }
        }
        return $result;
    }

    /**
     * Encode array of objects [{kode, clue}] → JSON string untuk disimpan ke DB.
     */
    public static function encodeJawabanWithClue(array $items): string
    {
        return json_encode(array_values($items), JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
    }

    /**
     * Ambil hanya baris yang ditandai clue = 1.
     * Return: array string kode
     */
    public static function getClueLines(?string $raw): array
    {
        $items = static::parseJawabanWithClue($raw);
        return array_values(
            array_map(
                fn($item) => $item['kode'],
                array_filter($items, fn($item) => (int) $item['clue'] === 1)
            )
        );
    }

    /**
     * Bandingkan dua baris kode Java, abaikan perbedaan spasi.
     */
    public static function linesMatch(string $kunci, string $jawaban): bool
    {
        return static::normalizeCodeLine($kunci) === static::normalizeCodeLine($jawaban);
    }

    /**
     * Normalize one code line for position-based answer comparison.
     */
    public static function normalizeCodeLine(?string $line): string
    {
        $line = html_entity_decode((string) $line, ENT_QUOTES | ENT_HTML5, 'UTF-8');
        $line = preg_replace('/[\x{200B}-\x{200D}\x{FEFF}]/u', '', $line) ?? $line;
        $line = str_replace("\xC2\xA0", ' ', $line);

            return preg_replace('/\s+/u', ' ', trim($line)) ?? '';
    }
}
