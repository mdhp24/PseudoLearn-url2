<?php

namespace Database\Seeders;

use App\Models\Kelas;
use App\Models\User;
use App\Models\Mahasiswa;
use Illuminate\Database\Seeder;

class UserProductionSeeder extends Seeder
{
    public function run(): void
    {
        $kelas = Kelas::firstOrCreate(['name' => 'TI-1F'], ['angkatan' => '2026']);

        $user = User::firstOrCreate(
            ['email' => 'farel@example.local'],
            ['name' => 'FAREL FIRLANDO', 'password' => bcrypt('password'), 'is_admin' => 0]
        );

        Mahasiswa::firstOrCreate(
            ['nim' => '254107020031'],
            ['id_user' => $user->id, 'id_kelas' => $kelas->id, 'name' => 'FAREL FIRLANDO', 'jenis_kelamin' => 'l', 'open_panduan' => 0]
        );
    }
}
