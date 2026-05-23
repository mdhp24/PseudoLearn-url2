<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class SoalSeeder extends Seeder
{
    public function run(): void
    {
        $idLevel = '019863c4-59f9-7319-9104-08267fc3c551';
        $now     = now();

        $soalList = [
            // ============================================================
            // QUEUE: EASY (5 Soal)
            // ============================================================
            [
                'id'              => Str::uuid(),
                'id_level'        => $idLevel,
                'judul'           => 'Operasi Enqueue dan Print pada Antrian',
                'soal'            => '<p>Sebuah sistem antrian menerima dua data berturut-turut yaitu 15 dan 30 menggunakan operasi <code>enqueue()</code>. Setelah kedua data dimasukkan, sistem memanggil fungsi <code>print()</code> untuk menampilkan seluruh isi antrian dari depan ke belakang.</p><p>Tentukan output dari sistem tersebut.</p>',
                'kunci_tipe_data' => json_encode([['variabel' => 'data', 'tipe_data' => 'Queue', 'konversi' => 0]]),
                'kunci_algoritma' => json_encode([
                    ['langkah' => 'START', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'enqueue(15)', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'enqueue(30)', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'print() menampilkan 15 lalu 30', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'END', 'clue' => 0, 'konversi' => 0],
                ]),
                'order'      => 1, 'status' => 1, 'difficulty' => 'easy',
                'created_at' => $now, 'updated_at' => $now, 'deleted_at' => null,
            ],
            [
                'id'              => Str::uuid(),
                'id_level'        => $idLevel,
                'judul'           => 'Operasi Dequeue dan Print pada Antrian',
                'soal'            => '<p>Terdapat antrian dengan data awal 10, 20, dan 30. Sistem kemudian menjalankan operasi <code>dequeue()</code> satu kali untuk mengeluarkan elemen terdepan. Setelah itu, fungsi <code>print()</code> dipanggil.</p><p>Tentukan sisa elemen yang dicetak oleh sistem.</p>',
                'kunci_tipe_data' => json_encode([['variabel' => 'data', 'tipe_data' => 'Queue', 'konversi' => 0]]),
                'kunci_algoritma' => json_encode([
                    ['langkah' => 'START', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'Antrian berisi 10, 20, 30', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'dequeue() dijalankan, angka 10 keluar', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'print() menampilkan sisa elemen: 20 30', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'END', 'clue' => 0, 'konversi' => 0],
                ]),
                'order'      => 2, 'status' => 1, 'difficulty' => 'easy',
                'created_at' => $now, 'updated_at' => $now, 'deleted_at' => null,
            ],
            [
                'id'              => Str::uuid(),
                'id_level'        => $idLevel,
                'judul'           => 'Antrian Barang Gudang (Enqueue & Print)',
                'soal'            => '<p>Sebuah gudang mencatat barang masuk ke dalam antrian. Tiga barang dengan ID 100, 200, dan 300 dimasukkan berturut-turut menggunakan operasi <code>enqueue()</code>. Setelah itu, petugas memanggil fungsi <code>print()</code> untuk melihat isi antrian.</p><p>Tentukan output yang akan tercetak.</p>',
                'kunci_tipe_data' => json_encode([['variabel' => 'data', 'tipe_data' => 'Queue', 'konversi' => 0]]),
                'kunci_algoritma' => json_encode([
                    ['langkah' => 'START', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'enqueue(100), enqueue(200), enqueue(300)', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'print() menampilkan 100 200 300', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'END', 'clue' => 0, 'konversi' => 0],
                ]),
                'order'      => 3, 'status' => 1, 'difficulty' => 'easy',
                'created_at' => $now, 'updated_at' => $now, 'deleted_at' => null,
            ],
            [
                'id'              => Str::uuid(),
                'id_level'        => $idLevel,
                'judul'           => 'Pengurangan Antrian Loket (Dequeue & Print)',
                'soal'            => '<p>Antrian loket awalnya berisi antrian 1, 2, 3, dan 4. Petugas memanggil dua orang pertama sehingga operasi <code>dequeue()</code> dijalankan sebanyak dua kali. Kemudian petugas mengecek sisa antrian dengan operasi <code>print()</code>.</p><p>Tentukan sisa antrian yang dicetak.</p>',
                'kunci_tipe_data' => json_encode([['variabel' => 'data', 'tipe_data' => 'Queue', 'konversi' => 0]]),
                'kunci_algoritma' => json_encode([
                    ['langkah' => 'START', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'Antrian berisi 1, 2, 3, 4', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'dequeue() 2 kali (1 dan 2 keluar)', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'print() menampilkan sisa elemen: 3 4', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'END', 'clue' => 0, 'konversi' => 0],
                ]),
                'order'      => 4, 'status' => 1, 'difficulty' => 'easy',
                'created_at' => $now, 'updated_at' => $now, 'deleted_at' => null,
            ],
            [
                'id'              => Str::uuid(),
                'id_level'        => $idLevel,
                'judul'           => 'Pencatatan Cepat Antrian (Enqueue & Print)',
                'soal'            => '<p>Sistem menerima input antrian nilai 88 menggunakan <code>enqueue()</code>, lalu langsung mencetaknya menggunakan <code>print()</code>. Kemudian, nilai 99 masuk dengan <code>enqueue()</code>, dan sistem kembali memanggil <code>print()</code>.</p><p>Tentukan output baris pertama dan kedua dari sistem.</p>',
                'kunci_tipe_data' => json_encode([['variabel' => 'data', 'tipe_data' => 'Queue', 'konversi' => 0]]),
                'kunci_algoritma' => json_encode([
                    ['langkah' => 'START', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'enqueue(88) lalu print()', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'enqueue(99) lalu print()', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'END', 'clue' => 0, 'konversi' => 0],
                ]),
                'order'      => 5, 'status' => 1, 'difficulty' => 'easy',
                'created_at' => $now, 'updated_at' => $now, 'deleted_at' => null,
            ],

            // ============================================================
            // QUEUE: MEDIUM (5 Soal)
            // ============================================================
            [
                'id'              => Str::uuid(),
                'id_level'        => $idLevel,
                'judul'           => 'Cek Kapasitas dan Peek Antrian Layanan',
                'soal'            => '<p>Sebuah program antrian menggunakan Scanner untuk menerima kapasitas maksimal. Pengguna memasukkan kapasitas 2. Kemudian, sistem mengecek apakah antrian penuh menggunakan <code>IsFull()</code>. Selanjutnya, data 101 dimasukkan dengan <code>enqueue()</code> dan sistem mengecek elemen terdepan menggunakan <code>peek()</code>.</p><p>Tentukan output pengecekan kapasitas dan nilai elemen terdepan.</p>',
                'kunci_tipe_data' => json_encode([['variabel' => 'max', 'tipe_data' => 'int', 'konversi' => 0]]),
                'kunci_algoritma' => json_encode([
                    ['langkah' => 'START', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'Input Scanner: max = 2', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'IsFull() -> false', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'enqueue(101)', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'peek() -> Elemen terdepan: 101', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'END', 'clue' => 0, 'konversi' => 0],
                ]),
                'order'      => 6, 'status' => 1, 'difficulty' => 'medium',
                'created_at' => $now, 'updated_at' => $now, 'deleted_at' => null,
            ],
            [
                'id'              => Str::uuid(),
                'id_level'        => $idLevel,
                'judul'           => 'Mengosongkan Sisa Antrian',
                'soal'            => '<p>Tanpa menggunakan input Scanner, sebuah antrian diisi dengan data 55 dan 66. Program lalu menjalankan <code>dequeue()</code> satu kali, disusul dengan pemanggilan <code>clear()</code>. Terakhir, program memanggil <code>IsEmpty()</code>.</p><p>Tentukan status <code>IsEmpty()</code> di akhir program.</p>',
                'kunci_tipe_data' => json_encode([['variabel' => 'status', 'tipe_data' => 'boolean', 'konversi' => 0]]),
                'kunci_algoritma' => json_encode([
                    ['langkah' => 'START', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'enqueue(55), enqueue(66)', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'dequeue() -> 55 keluar', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'clear() -> sisa elemen dihapus', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'IsEmpty() -> true', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'END', 'clue' => 0, 'konversi' => 0],
                ]),
                'order'      => 7, 'status' => 1, 'difficulty' => 'medium',
                'created_at' => $now, 'updated_at' => $now, 'deleted_at' => null,
            ],
            [
                'id'              => Str::uuid(),
                'id_level'        => $idLevel,
                'judul'           => 'Simulasi Operasi Layanan Queue',
                'soal'            => '<p>Dengan menggunakan Scanner, program menerima input 3 buah data secara berurutan: 5, 15, 25 untuk di-<code>enqueue()</code>. Program mencetak isi antrian dengan <code>print()</code>, lalu melakukan <code>dequeue()</code> satu kali, dan memanggil <code>print()</code> lagi.</p><p>Bagaimana bentuk output print pertama dan kedua?</p>',
                'kunci_tipe_data' => json_encode([['variabel' => 'dt', 'tipe_data' => 'int', 'konversi' => 0]]),
                'kunci_algoritma' => json_encode([
                    ['langkah' => 'START', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'Input 5, 15, 25 lalu enqueue()', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'print() -> 5 15 25', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'dequeue() -> 5 keluar', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'print() -> 15 25', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'END', 'clue' => 0, 'konversi' => 0],
                ]),
                'order'      => 8, 'status' => 1, 'difficulty' => 'medium',
                'created_at' => $now, 'updated_at' => $now, 'deleted_at' => null,
            ],
            [
                'id'              => Str::uuid(),
                'id_level'        => $idLevel,
                'judul'           => 'Batas Kapasitas Antrian',
                'soal'            => '<p>Menggunakan Scanner, admin mengatur kapasitas antrian maksimal (<code>max</code>) sebesar 3. Admin kemudian memasukkan angka 10, 20, dan 30 secara berurutan menggunakan <code>enqueue()</code>. Setelah itu, sistem mengecek apakah antrian sudah penuh dengan memanggil fungsi <code>IsFull()</code>, dilanjutkan dengan <code>peek()</code> untuk melihat antrian terdepan.</p><p>Tentukan status boolean <code>IsFull()</code> dan hasil dari <code>peek()</code>.</p>',
                'kunci_tipe_data' => json_encode([['variabel' => 'max', 'tipe_data' => 'int', 'konversi' => 0]]),
                'kunci_algoritma' => json_encode([
                    ['langkah' => 'START', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'Input Scanner max = 3', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'enqueue(10), enqueue(20), enqueue(30)', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'IsFull() -> true', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'peek() -> Elemen terdepan: 10', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'END', 'clue' => 0, 'konversi' => 0],
                ]),
                'order'      => 9, 'status' => 1, 'difficulty' => 'medium',
                'created_at' => $now, 'updated_at' => $now, 'deleted_at' => null,
            ],
            [
                'id'              => Str::uuid(),
                'id_level'        => $idLevel,
                'judul'           => 'Reset Ulang Antrian Pelanggan',
                'soal'            => '<p>Sebuah toko (tanpa Scanner) memasukkan nomor antrian 5, 6, dan 7 menggunakan <code>enqueue()</code>. Kasir mencetak antrian dengan <code>print()</code>. Karena sistem error, kasir memanggil fungsi <code>clear()</code> untuk mengosongkan seluruh antrian, dan kemudian mengeceknya menggunakan <code>IsEmpty()</code>.</p><p>Tentukan output cetakan pertama dan status <code>IsEmpty()</code> setelah di-clear.</p>',
                'kunci_tipe_data' => json_encode([['variabel' => 'status', 'tipe_data' => 'boolean', 'konversi' => 0]]),
                'kunci_algoritma' => json_encode([
                    ['langkah' => 'START', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'enqueue(5), enqueue(6), enqueue(7)', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'print() -> 5 6 7', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'clear() -> antrian dikosongkan', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'IsEmpty() -> true', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'END', 'clue' => 0, 'konversi' => 0],
                ]),
                'order'      => 10, 'status' => 1, 'difficulty' => 'medium',
                'created_at' => $now, 'updated_at' => $now, 'deleted_at' => null,
            ],

            // ============================================================
            // QUEUE: HARD (5 Soal)
            // ============================================================
            [
                'id'              => Str::uuid(),
                'id_level'        => $idLevel,
                'judul'           => 'Batas Kapasitas Antrean Wahana Bermain',
                'soal'            => '<p>Sebuah taman bermain menggunakan Scanner untuk mengatur kapasitas (<code>max</code>) antrean wahana. Petugas memasukkan batas kapasitas 3. Ada 5 anak dengan ID: 11, 22, 33, 44, dan 55 yang masuk antrean satu per satu. Jika antrean penuh (<code>IsFull()</code>), sistem langsung mencetak "Penuh" dan proses dihentikan (break).</p><p>Berapa banyak anak yang berhasil masuk ke antrean?</p>',
                'kunci_tipe_data' => json_encode([['variabel' => 'max', 'tipe_data' => 'int', 'konversi' => 0]]),
                'kunci_algoritma' => json_encode([
                    ['langkah' => 'START', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'Input Scanner max = 3', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'Loop elemen: 11, 22, 33, 44, 55', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'enqueue(11), enqueue(22), enqueue(33)', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'Saat elemen 44 masuk, IsFull() true -> cetak Penuh, lalu break', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'print total ukuran antrean -> 3', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'END', 'clue' => 0, 'konversi' => 0],
                ]),
                'order'      => 11, 'status' => 1, 'difficulty' => 'hard',
                'created_at' => $now, 'updated_at' => $now, 'deleted_at' => null,
            ],
            [
                'id'              => Str::uuid(),
                'id_level'        => $idLevel,
                'judul'           => 'Simulasi Reset Antrean Otomatis di Klinik',
                'soal'            => '<p>Di sebuah klinik (tanpa Scanner), 3 pasien mendaftar dengan ID: 101, 102, 103 menggunakan <code>enqueue()</code>. Dokter kemudian memanggil ketiga pasien secara berurutan menggunakan <code>dequeue()</code>. Setiap kali <code>dequeue()</code> dijalankan, sistem mengecek: jika nilai <code>front &gt; rear</code>, maka sistem langsung me-reset <code>front</code> dan <code>rear</code> menjadi -1.</p><p>Berapakah nilai <code>front</code> dan <code>rear</code> di akhir program?</p>',
                'kunci_tipe_data' => json_encode([['variabel' => 'front', 'tipe_data' => 'int', 'konversi' => 0]]),
                'kunci_algoritma' => json_encode([
                    ['langkah' => 'START', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'enqueue(101), enqueue(102), enqueue(103)', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'dequeue() -> 101, dequeue() -> 102', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'dequeue() -> 103, front naik melewati rear', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'Kondisi front > rear true -> reset front = -1, rear = -1', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'print Front dan Rear', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'END', 'clue' => 0, 'konversi' => 0],
                ]),
                'order'      => 12, 'status' => 1, 'difficulty' => 'hard',
                'created_at' => $now, 'updated_at' => $now, 'deleted_at' => null,
            ],
            [
                'id'              => Str::uuid(),
                'id_level'        => $idLevel,
                'judul'           => 'Pengarsipan Digital Antrean ke Stack',
                'soal'            => '<p>Sistem perpustakaan menerima 3 ID buku menggunakan Scanner: 1, 2, dan 3 yang dimasukkan ke antrean menggunakan <code>enqueue()</code>. Di sore hari, sistem memindahkan seluruh buku tersebut dari Queue ke dalam arsip (Stack). Selama antrean tidak kosong (<code>IsEmpty()</code>), sistem akan melakukan <code>dequeue()</code> dan datanya langsung di-<code>push()</code> ke Stack.</p><p>Tentukan ID buku yang berada di posisi paling atas (top) pada arsip Stack.</p>',
                'kunci_tipe_data' => json_encode([
                    ['variabel' => 'q', 'tipe_data' => 'Queue', 'konversi' => 0],
                    ['variabel' => 'st', 'tipe_data' => 'Stack', 'konversi' => 0],
                ]),
                'kunci_algoritma' => json_encode([
                    ['langkah' => 'START', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'Input Scanner: enqueue(1), enqueue(2), enqueue(3)', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'Loop: dequeue() -> push() berulang hingga IsEmpty() true', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'dequeue(1) -> push(1)', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'dequeue(2) -> push(2)', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'dequeue(3) -> push(3)', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'print elemen top dari Stack -> 3', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'END', 'clue' => 0, 'konversi' => 0],
                ]),
                'order'      => 13, 'status' => 1, 'difficulty' => 'hard',
                'created_at' => $now, 'updated_at' => $now, 'deleted_at' => null,
            ],
            [
                'id'              => Str::uuid(),
                'id_level'        => $idLevel,
                'judul'           => 'Pembalikan Urutan Mobil Keluar Gang',
                'soal'            => '<p>Tiga mobil terjebak di gang buntu dengan antrean [1, 2, 3]. Untuk keluar, mereka harus diputar balik menjadi [3, 2, 1] tanpa Scanner. Tekniknya: pindahkan seluruh mobil dari Queue ke dalam tumpukan sementara (Stack) menggunakan <code>dequeue()</code> dan <code>push()</code>. Setelah antrean dikosongkan, mobil dikembalikan dari Stack ke Queue menggunakan <code>pop()</code> dan <code>enqueue()</code>.</p><p>Tentukan hasil cetakan antrean setelah dibalik.</p>',
                'kunci_tipe_data' => json_encode([
                    ['variabel' => 'q', 'tipe_data' => 'Queue', 'konversi' => 0],
                    ['variabel' => 'st', 'tipe_data' => 'Stack', 'konversi' => 0],
                ]),
                'kunci_algoritma' => json_encode([
                    ['langkah' => 'START', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'enqueue(1), enqueue(2), enqueue(3)', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'Pindahkan ke Stack: push(dequeue()) hingga IsEmpty() true', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'Reset index Queue', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'Pindahkan kembali: enqueue(pop()) hingga Stack kosong', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'print() -> 3 2 1', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'END', 'clue' => 0, 'konversi' => 0],
                ]),
                'order'      => 14, 'status' => 1, 'difficulty' => 'hard',
                'created_at' => $now, 'updated_at' => $now, 'deleted_at' => null,
            ],
            [
                'id'              => Str::uuid(),
                'id_level'        => $idLevel,
                'judul'           => 'Validasi Antrean Palindrom',
                'soal'            => '<p>Sistem mengecek apakah 3 tiket yang dimasukkan pengunjung dengan Scanner merupakan urutan palindrom (misal: 1 2 1). Setiap input langsung dimasukkan ke Queue (<code>enqueue()</code>) dan ke Stack (<code>push()</code>) sekaligus. Kemudian, elemen diuji dengan membandingkan hasil <code>dequeue()</code> dengan <code>pop()</code>.</p><p>Jika input yang diberikan adalah 1, 2, dan 1, tentukan apakah susunan tiket tersebut membentuk palindrom.</p>',
                'kunci_tipe_data' => json_encode([
                    ['variabel' => 'isPalin', 'tipe_data' => 'boolean', 'konversi' => 0],
                ]),
                'kunci_algoritma' => json_encode([
                    ['langkah' => 'START', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'Input Scanner: 1, 2, 1', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'Simpan ke Queue dan Stack secara bersamaan', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'Loop pengecekan: Bandingkan dequeue() dengan pop()', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => '1 == 1, 2 == 2, 1 == 1. Semua sama, isPalin = true', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'print nilai isPalin', 'clue' => 0, 'konversi' => 0],
                    ['langkah' => 'END', 'clue' => 0, 'konversi' => 0],
                ]),
                'order'      => 15, 'status' => 1, 'difficulty' => 'hard',
                'created_at' => $now, 'updated_at' => $now, 'deleted_at' => null,
            ],
        ];

        // Insert Soal Queue
        foreach (array_chunk($soalList, 500) as $chunk) {
            DB::table('soal')->insert($chunk);
        }

        $totalQueue = count($soalList);

        $this->command->info("SoalQueueSeeder    : {$totalQueue} soal Queue berhasil di-seed.");
    }
}
