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
        DB::statement("
            CREATE OR REPLACE VIEW v_soal AS
            SELECT 
                s.id AS id,
                s.judul AS judul,
                s.soal AS soal,
                s.id_level AS id_level,
                l.name AS level_name,
                s.`order` AS `order`,
                s.status AS status,
                s.difficulty AS difficulty,
                s.created_at AS created_at,
                s.updated_at AS updated_at,
                s.deleted_at AS deleted_at
            FROM soal s
            LEFT JOIN level l ON s.id_level = l.id
        ");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        DB::statement("
            CREATE OR REPLACE VIEW v_soal AS
            SELECT 
                s.id AS id,
                s.judul AS judul,
                s.soal AS soal,
                s.id_level AS id_level,
                l.name AS level_name,
                s.created_at AS created_at,
                s.deleted_at AS deleted_at
            FROM soal s
            LEFT JOIN level l ON s.id_level = l.id
        ");
    }
};
