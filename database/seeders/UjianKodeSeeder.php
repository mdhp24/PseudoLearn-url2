<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UjianKodeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('ujian_kode')->insert([
            [
                'id' => '01996b25-1abf-7072-ab00-cd6402bccbe0',
                'id_level' => '01995dec-678e-70cf-854a-b25e2c2d0d28',
                'id_bank_soal_konversi' => '0199651d-b77a-7329-8b9a-0e5b6b2f16d6',
                'id_mahasiswa' => '619a9bee-cf37-41af-90d6-0db8942ac176',
                'jawaban' => "double pajak = 0.1;\nint harga_motor = 25000000;",
                'output' => '27500000',
                'nilai' => 100,
                'waktu' => 42,
                'created_at' => '2025-09-21 07:20:17',
                'updated_at' => '2025-09-21 07:20:17',
                'deleted_at' => null,
            ],

            [
                'id' => '01997042-3573-7382-b41c-a442c711f2f9',
                'id_level' => '01995dec-678e-70cf-854a-b25e2c2d0d28',
                'id_bank_soal_konversi' => '01996525-5cf1-7256-8f2f-184909a171ff',
                'id_mahasiswa' => '619a9bee-cf37-41af-90d6-0db8942ac176',
                'jawaban' => "int harga_dasar;\nfloat persentase_pajak;",
                'output' => '93500',
                'nilai' => 97,
                'waktu' => 49,
                'created_at' => '2025-09-22 07:10:11',
                'updated_at' => '2025-09-22 07:10:12',
                'deleted_at' => null,
            ],

            [
                'id' => '01997045-beb1-73f7-ab32-5fb7885f99c2',
                'id_level' => '01995dec-678e-70cf-854a-b25e2c2d0d28',
                'id_bank_soal_konversi' => '0199652a-ab5d-7201-b71c-3e984cfd80f4',
                'id_mahasiswa' => '619a9bee-cf37-41af-90d6-0db8942ac176',
                'jawaban' => "int panjang = 10;\nint lebar = 6;",
                'output' => '168.0',
                'nilai' => 100,
                'waktu' => 92,
                'created_at' => '2025-09-22 07:14:03',
                'updated_at' => '2025-09-22 07:14:03',
                'deleted_at' => null,
            ],
        ]);
    }
}