<?php

namespace App\Console\Commands;

use Carbon\Carbon;
use App\Models\Nyawa;
use Illuminate\Console\Command;

class RegenNyawa extends Command
{
    protected $signature = 'nyawa:regen';
    protected $description = 'Regenerasi nyawa user setiap 1 menit (+10 nyawa) (selalu update next_regen_at meski penuh)';

    public function handle()
    {
        $dataNyawa = Nyawa::all();
        $nowJakarta = Carbon::now();

        foreach ($dataNyawa as $nyawa) {
            $nextRegenAt = $nyawa->next_regen_at;
            // $nextRegenAt = $nextRegenAt->subHours(7);

            if ($nyawa->next_regen_at && $nowJakarta->greaterThanOrEqualTo($nextRegenAt)) {
                // hitung selisih menit antara now dan next_regen_at
                $diffMinutes = $nyawa->next_regen_at->diffInMinutes($nowJakarta);

                // berapa kali siklus 1 menit yg terlewati
                $cycles = floor($diffMinutes / 1) + 1; // +1 untuk regen saat ini

                // setiap siklus 1 menit menambah 10 nyawa
                $addLives = min($cycles * 10, $nyawa->max_nyawa - $nyawa->nyawa);

                if ($addLives > 0) {
                    $nyawa->nyawa += $addLives;

                    // kalau masih belum penuh, set next regen lagi
                    if ($nyawa->nyawa < $nyawa->max_nyawa) {
                        $nyawa->next_regen_at = Carbon::now()->addMinute();
                    } else {
                        $nyawa->next_regen_at = null; // stop kalau penuh
                    }

                    $nyawa->save();
                }

                // Log::info("Nyawa diregen untuk user {$nyawa->id}, total sekarang {$nyawa->nyawa}");

            }
        }

        $this->info("Regen nyawa selesai untuk semua user.");
    }
}
