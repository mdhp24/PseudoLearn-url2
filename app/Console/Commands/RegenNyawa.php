<?php

namespace App\Console\Commands;

use App\Models\Nyawa;
use Illuminate\Console\Command;

class RegenNyawa extends Command
{
    protected $signature = 'nyawa:regen';
    protected $description = 'Regenerasi nyawa user 10 per menit (max 100)';

    public function handle()
    {
        $dataNyawa = Nyawa::all();

        foreach ($dataNyawa as $nyawa) {
            $nyawa->checkAndRegenerate();
        }

        $this->info("Regen nyawa selesai untuk semua user.");
    }
}
