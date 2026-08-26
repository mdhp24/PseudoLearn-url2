<?php

namespace App\Models;

use App\Core\BaseModel;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Concerns\HasUuids;

class LogUjianKode extends BaseModel
{
    use HasFactory, HasUuids, SoftDeletes;

    protected $table = 'log_ujian_kode';
    protected $primaryKey = 'id';

    protected $fillable = [
        'id',
        'id_mahasiswa',
        'id_bank_soal_konversi',
        'id_soal',
        'id_level',
        'index',
        'block_id',
        'item_text',
        'is_correct',
        'waktu',
    ];

    protected $casts = [
        'is_correct' => 'boolean',
        'waktu'      => 'integer',
        'index'      => 'integer',
    ];

    protected static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            if(empty($model->id)) {
                $model->id = (string) Str::uuid();
            }
        });
    }
}
