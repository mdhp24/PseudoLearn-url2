<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        DB::table('nyawa')->update([
            'nyawa' => 100,
            'max_nyawa' => 100,
            'next_regen_at' => null,
            'updated_at' => now(),
        ]);
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        DB::table('nyawa')->update([
            'nyawa' => 25,
            'max_nyawa' => 25,
            'next_regen_at' => null,
            'updated_at' => now(),
        ]);
    }
};
