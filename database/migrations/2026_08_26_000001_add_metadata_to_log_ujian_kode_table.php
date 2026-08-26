<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('log_ujian_kode', function (Blueprint $table) {
            if (!Schema::hasColumn('log_ujian_kode', 'id_soal')) {
                $table->uuid('id_soal')->nullable()->after('id_bank_soal_konversi');
            }
            if (!Schema::hasColumn('log_ujian_kode', 'block_id')) {
                $table->string('block_id')->nullable()->after('index');
            }
            if (!Schema::hasColumn('log_ujian_kode', 'is_correct')) {
                $table->boolean('is_correct')->default(false)->after('item_text');
            }
            if (!Schema::hasColumn('log_ujian_kode', 'waktu')) {
                $table->integer('waktu')->default(0)->after('is_correct');
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('log_ujian_kode', function (Blueprint $table) {
            if (Schema::hasColumn('log_ujian_kode', 'id_soal')) {
                $table->dropColumn('id_soal');
            }
            if (Schema::hasColumn('log_ujian_kode', 'block_id')) {
                $table->dropColumn('block_id');
            }
            if (Schema::hasColumn('log_ujian_kode', 'is_correct')) {
                $table->dropColumn('is_correct');
            }
            if (Schema::hasColumn('log_ujian_kode', 'waktu')) {
                $table->dropColumn('waktu');
            }
        });
    }
};
