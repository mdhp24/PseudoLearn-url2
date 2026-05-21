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

    public const DEFAULT_MAX_NYAWA = 100;
    public const REGEN_INTERVAL_MINUTES = 1;
    public const REGEN_AMOUNT = 10;

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
        });
        
        // NOTE: removed auto-update-on-retrieved to avoid overwriting intentional changes.
    }

    /**
     * Check and regenerate nyawa based on time.
     * 10 nyawa regenerate every 1 minute when below max.
     */
    public function checkAndRegenerate(): self
    {
        $now = Carbon::now();
        $maxNyawa = $this->max_nyawa ?? self::DEFAULT_MAX_NYAWA;

        // If already at max, ensure timer is cleared
        if ($this->nyawa >= $maxNyawa) {
            if ($this->next_regen_at !== null) {
                $this->next_regen_at = null;
                $this->save();
            }
            return $this;
        }

        // Below max - handle regeneration
        if ($this->next_regen_at === null) {
            // Start regeneration timer (first time below max)
            $this->next_regen_at = $now->copy()->addMinutes(self::REGEN_INTERVAL_MINUTES);
            $this->save();
            return $this;
        }

        $nextRegen = Carbon::parse($this->next_regen_at);

        // Check if regeneration time has passed
        if ($now->lt($nextRegen)) {
            return $this;
        }

        // Add 10 nyawa per elapsed minute.
        $secondsSinceRegen = $nextRegen->diffInSeconds($now);
        $minutesSinceRegen = max(1, (int) floor($secondsSinceRegen / 60));
        $livesToAdd = $minutesSinceRegen * self::REGEN_AMOUNT;

        $this->nyawa = min($this->nyawa + $livesToAdd, $maxNyawa);

        if ($this->nyawa < $maxNyawa) {
            $this->next_regen_at = $now->copy()->addMinutes(self::REGEN_INTERVAL_MINUTES);
        } else {
            $this->next_regen_at = null;
        }

        $this->save();

        return $this;
    }

    public function applyWrongAnswerPenalty(int $amount = 1): self
    {
        $maxNyawa = $this->max_nyawa ?? self::DEFAULT_MAX_NYAWA;

        $this->nyawa = max(0, $this->nyawa - $amount);

        if ($this->nyawa < $maxNyawa && $this->next_regen_at === null) {
            $this->next_regen_at = Carbon::now()->addMinutes(self::REGEN_INTERVAL_MINUTES);
        }

        $this->save();

        return $this;
    }
}
