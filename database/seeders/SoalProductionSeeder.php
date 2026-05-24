<?php

namespace Database\Seeders;

use App\Models\Level;
use App\Models\Soal;
use App\Models\BankSoalKonversi;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

class SoalProductionSeeder extends Seeder
{
    public function run(): void
    {
        $levels = [
            ['name' => 'Queue 1', 'order' => 1],
            ['name' => 'Linked List', 'order' => 2],
        ];

        foreach ($levels as $l) {
            $level = Level::firstOrCreate(['name' => $l['name']], $l);

            if ($l['name'] === 'Queue 1') {
                $soals = [
                    [
                        'judul' => 'Antrian Loket Karcis Bioskop',
                        'soal' => 'Tiga orang masuk antrian: Rina, Doni, Yudi. Cetak FRONT dan SIZE.',
                        'kunci_tipe_data' => [['variabel' => 'antrian', 'tipe_data' => 'Queue', 'konversi' => 0]],
                        'kunci_algoritma' => [['langkah' => 'ENQUEUE(Rina)'], ['langkah' => 'ENQUEUE(Doni)'], ['langkah' => 'ENQUEUE(Yudi)'], ['langkah' => 'PRINT FRONT'], ['langkah' => 'PRINT SIZE']],
                        'order' => 1,
                        'status' => 1,
                        'difficulty' => 'easy',
                    ],
                ];
            } else {
                $soals = [
                    [
                        'judul' => 'Rangkaian Gerbong (SLL)',
                        'soal' => 'Buat SLL berisi 10,20,30 lalu cetak head dan tail.',
                        'kunci_tipe_data' => [['variabel' => 'list', 'tipe_data' => 'LinkedList', 'konversi' => 0]],
                        'kunci_algoritma' => [['langkah' => 'Buat node 10'], ['langkah' => 'Sambung node 20'], ['langkah' => 'Sambung node 30'], ['langkah' => 'PRINT head, tail']],
                        'order' => 1,
                        'status' => 1,
                        'difficulty' => 'easy',
                    ],
                ];
            }

            foreach ($soals as $s) {
                $soal = Soal::firstOrCreate(
                    ['judul' => $s['judul']],
                    array_merge($s, ['id_level' => $level->id, 'kunci_tipe_data' => json_encode($s['kunci_tipe_data']), 'kunci_algoritma' => json_encode($s['kunci_algoritma'])])
                );

                BankSoalKonversi::firstOrCreate(
                    ['id_soal' => $soal->id, 'jawaban' => "Sample answer", 'output' => "Sample output"],
                    ['id_level' => $level->id, 'order' => 0, 'difficulty' => 'easy']
                );
            }
        }
    }
}
