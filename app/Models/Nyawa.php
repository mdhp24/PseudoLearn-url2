<?php

namespace App\Models;

use Carbon\Carbon;
use App\Core\BaseModel;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Support\Str;

class Nyawa extends BaseModel
{
    use HasFactory, HasUuids, SoftDeletes;

    protected $table = 'nyawa';
    protected $primaryKey = 'id';
    public $incrementing = false;
    protected $keyType = 'string';

    protected $fillable = [
        'id',
        'id_user',
        'id_mahasiswa',
        'nyawa',
        'max_nyawa',
        'next_regen_at',
    ];

    protected $casts = [
        'nyawa' => 'integer',
        'max_nyawa' => 'integer',
        'next_regen_at' => 'datetime',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
        'deleted_at' => 'datetime',
    ];

    protected static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            if (empty($model->id)) {
                $model->id = (string) Str::uuid();
            }
            // Ensure new records have the correct max lives
            if (empty($model->max_nyawa)) {
                $model->max_nyawa = 100;
            }
        });
    }

    /**
     * Check and regenerate nyawa based on time.
     * One nyawa regenerates every 10 minutes when below max.
     */
    public function checkAndRegenerate(): self
    {
        $now = Carbon::now();

        // Normalize legacy data that still uses the old 25-life configuration.
        // This keeps the UI and gameplay on the new 100-life standard without a migration.
        if ((int) $this->max_nyawa === 25) {
            $this->max_nyawa = 100;

            if ((int) $this->nyawa <= 25) {
                $this->nyawa = 100;
                $this->next_regen_at = null;
            }

            $this->save();
        }

        // If already at max, ensure timer is cleared
        if ($this->nyawa >= $this->max_nyawa) {
            if ($this->next_regen_at !== null) {
                $this->next_regen_at = null;
                $this->save();
            }
            return $this;
        }

        // Below max - handle regeneration
        if ($this->next_regen_at === null) {
            // Start regeneration timer (first time below max)
            // regenerate every 1 minute, adding 10 lives per minute
            $this->next_regen_at = $now->copy()->addMinute();
            $this->save();
            return $this;
        }

        $nextRegen = Carbon::parse($this->next_regen_at);

        // Check if regeneration time has passed
        if ($now->gte($nextRegen)) {
            // Calculate total minutes since regen threshold
            $minutesSinceRegen = $nextRegen->diffInMinutes($now);
            // Number of full 1-minute cycles passed (including the initial one)
            $cycles = (int) floor($minutesSinceRegen / 1) + 1;
            // Each cycle gives 10 lives
            $livesToAdd = $cycles * 10;

            $this->nyawa = min($this->nyawa + $livesToAdd, $this->max_nyawa);

            if ($this->nyawa < $this->max_nyawa) {
                // Next regen scheduled 1 minute from now
                $this->next_regen_at = $now->copy()->addMinute();
            } else {
                $this->next_regen_at = null;
            }

            $this->save();
        }

        return $this;
    }
}
