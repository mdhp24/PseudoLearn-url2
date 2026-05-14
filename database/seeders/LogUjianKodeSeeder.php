<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class LogUjianKodeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('log_ujian_kode')->insert([
            [
                'id' => '019df803-605a-723b-8fb5-06a201e34208',
                'id_mahasiswa' => '619a9bee-cf37-41af-90d6-0db8942ac176',
                'id_bank_soal_konversi' => '01996543-dbbf-73ec-b0d6-ff48905b627a',
                'id_level' => '01995e0c-9825-73b3-b94f-2ae0542eabef',
                'index' => 1,
                'item_text' => 'public static void main(String[] args) {',
                'created_at' => '2026-05-05 05:01:04',
                'updated_at' => '2026-05-05 05:01:04',
                'deleted_at' => null,
            ],

            [
                'id' => '019df803-6994-719c-bae3-2b5fa8dba0ce',
                'id_mahasiswa' => '619a9bee-cf37-41af-90d6-0db8942ac176',
                'id_bank_soal_konversi' => '01996543-dbbf-73ec-b0d6-ff48905b627a',
                'id_level' => '01995e0c-9825-73b3-b94f-2ae0542eabef',
                'index' => 2,
                'item_text' => '}',
                'created_at' => '2026-05-05 05:01:06',
                'updated_at' => '2026-05-05 05:01:06',
                'deleted_at' => null,
            ],

            [
                'id' => '019df803-710b-7341-aed4-3dd7417d6a44',
                'id_mahasiswa' => '619a9bee-cf37-41af-90d6-0db8942ac176',
                'id_bank_soal_konversi' => '01996543-dbbf-73ec-b0d6-ff48905b627a',
                'id_level' => '01995e0c-9825-73b3-b94f-2ae0542eabef',
                'index' => 3,
                'item_text' => 'import java.util.Scanner;',
                'created_at' => '2026-05-05 05:01:08',
                'updated_at' => '2026-05-05 05:01:08',
                'deleted_at' => null,
            ],
        ]);
    }
}