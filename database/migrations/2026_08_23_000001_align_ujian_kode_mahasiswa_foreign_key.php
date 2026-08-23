<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        if (!Schema::hasTable('ujian_kode') || !Schema::hasTable('mahasiswa')) {
            return;
        }

        DB::statement(<<<'SQL'
            UPDATE ujian_kode uk
            JOIN mahasiswa m ON uk.id_mahasiswa = m.id_user
            SET uk.id_mahasiswa = m.id
            WHERE uk.id_mahasiswa IS NOT NULL
        SQL);

        $constraint = DB::selectOne(<<<'SQL'
            SELECT kcu.CONSTRAINT_NAME, kcu.REFERENCED_TABLE_NAME
            FROM information_schema.KEY_COLUMN_USAGE kcu
            WHERE kcu.TABLE_SCHEMA = DATABASE()
              AND kcu.TABLE_NAME = 'ujian_kode'
              AND kcu.COLUMN_NAME = 'id_mahasiswa'
              AND kcu.REFERENCED_TABLE_NAME IS NOT NULL
            LIMIT 1
        SQL);

        if ($constraint?->REFERENCED_TABLE_NAME === 'mahasiswa') {
            return;
        }

        if ($constraint?->CONSTRAINT_NAME) {
            $name = str_replace('`', '``', $constraint->CONSTRAINT_NAME);
            DB::statement("ALTER TABLE `ujian_kode` DROP FOREIGN KEY `{$name}`");
        }

        Schema::table('ujian_kode', function (Blueprint $table) {
            $table->foreign('id_mahasiswa')
                ->references('id')
                ->on('mahasiswa')
                ->cascadeOnDelete();
        });
    }

    public function down(): void
    {
        if (!Schema::hasTable('ujian_kode') || !Schema::hasTable('users')) {
            return;
        }

        $constraint = DB::selectOne(<<<'SQL'
            SELECT kcu.CONSTRAINT_NAME
            FROM information_schema.KEY_COLUMN_USAGE kcu
            WHERE kcu.TABLE_SCHEMA = DATABASE()
              AND kcu.TABLE_NAME = 'ujian_kode'
              AND kcu.COLUMN_NAME = 'id_mahasiswa'
              AND kcu.REFERENCED_TABLE_NAME = 'mahasiswa'
            LIMIT 1
        SQL);

        if ($constraint?->CONSTRAINT_NAME) {
            $name = str_replace('`', '``', $constraint->CONSTRAINT_NAME);
            DB::statement("ALTER TABLE `ujian_kode` DROP FOREIGN KEY `{$name}`");
        }

        Schema::table('ujian_kode', function (Blueprint $table) {
            $table->foreign('id_mahasiswa')
                ->references('id')
                ->on('users')
                ->cascadeOnDelete();
        });
    }
};
