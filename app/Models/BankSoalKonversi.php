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

    public static function parseJawabanLines($rawJawaban): array
    {
        if ($rawJawaban === null) {
            return [];
        }

        if (is_array($rawJawaban)) {
            $rawLines = $rawJawaban;
        } else {
            $text = trim((string) $rawJawaban);

            if ($text === '') {
                return [];
            }

            $decoded = json_decode($text, true);
            if (json_last_error() === JSON_ERROR_NONE && is_array($decoded)) {
                $rawLines = $decoded;
            } else {
                $normalized = str_replace(["\r\n", "\r"], "\n", $text);
                $rawLines = preg_split('/\n/', $normalized) ?: [];
            }
        }

        $lines = [];

        foreach ($rawLines as $line) {
            $normalizedLine = static::extractJawabanLineValue($line);

            if ($normalizedLine !== '') {
                $lines[] = $normalizedLine;
            }
        }

        return array_values($lines);
    }

    public static function linesMatch($expected, $actual): bool
    {
        return static::normalizeJawabanLine($expected) === static::normalizeJawabanLine($actual);
    }

    protected static function extractJawabanLineValue($line): string
    {
        if (is_array($line)) {
            foreach ($line as $value) {
                $normalized = static::extractJawabanLineValue($value);
                if ($normalized !== '') {
                    return $normalized;
                }
            }

            return '';
        }

        if (is_object($line)) {
            return static::extractJawabanLineValue((array) $line);
        }

        return static::normalizeJawabanLine($line);
    }

    protected static function normalizeJawabanLine($line): string
    {
        $line = str_replace("\xC2\xA0", ' ', (string) $line);
        $line = trim($line);
        $line = preg_replace('/\s+/u', ' ', $line);

        return $line ?? '';
    }
}
