<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use App\Models\Nyawa;

class SetNyawaDefault extends Command
{
    protected $signature = 'nyawa:set-default {--all : Update all records}';
    protected $description = 'Set semua record nyawa menjadi DEFAULT_MAX_NYAWA (100) tanpa migration';

    public function handle()
    {
        $default = Nyawa::DEFAULT_MAX_NYAWA;

        DB::beginTransaction();
        try {
            DB::table('nyawa')->update([
                'nyawa' => $default,
                'max_nyawa' => $default,
                'next_regen_at' => null,
                'updated_at' => now(),
            ]);

            DB::commit();
            $this->info("Semua record nyawa telah di-set ke {$default}/{$default}.");
            return 0;
        } catch (\Exception $e) {
            DB::rollBack();
            $this->error('Gagal mengupdate record nyawa: ' . $e->getMessage());
            return 1;
        }
    }
}
