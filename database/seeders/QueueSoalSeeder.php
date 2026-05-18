<?php

namespace Database\Seeders;

use App\Models\Soal;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class QueueSoalSeeder extends Seeder
{
    private const LEVEL_ID = '019863c4-59f9-7319-9104-08267fc3c551';

    public function run(): void
    {
        $questions = [
            [
                'judul' => 'Enqueue - Tambah Pelanggan Baru',
                'soal' => <<<'TEXT'
Seorang manajer restoran ingin memantau antrian pelanggan yang sedang menunggu untuk dilayani. Ia menggunakan sebuah queue untuk menyimpan data pelanggan. Ketika ada pelanggan baru, ia ingin menambahkan pelanggan tersebut ke dalam antrian. Buatlah pseudocode untuk menambahkan pelanggan baru ke dalam antrian menggunakan operasi enqueue(). Pastikan antrian memeriksa apakah sudah penuh sebelum menambah pelanggan baru.
TEXT,
                'kunci_tipe_data' => [
                    $this->typeData('queue', 'string[]'),
                    $this->typeData('pelanggan', 'string'),
                    $this->typeData('front', 'int'),
                    $this->typeData('rear', 'int'),
                ],
                'kunci_algoritma' => [
                    $this->step('START', 0, 0),
                    $this->step('READ pelanggan'),
                    $this->step('IF isFull(queue) THEN'),
                    $this->step('PRINT "Antrian penuh. Tidak dapat menambah pelanggan."'),
                    $this->step('ELSE', 0, 0),
                    $this->step('IF isEmpty(queue) THEN'),
                    $this->step('front <- 0'),
                    $this->step('rear <- 0'),
                    $this->step('ELSE', 0, 0),
                    $this->step('rear <- rear + 1'),
                    $this->step('END IF', 0, 0),
                    $this->step('queue[rear] <- pelanggan'),
                    $this->step('PRINT "Pelanggan " + pelanggan + " berhasil ditambahkan ke antrian."'),
                    $this->step('END IF', 0, 0),
                    $this->step('END', 0, 0),
                ],
                'order' => 1,
            ],
            [
                'judul' => 'Dequeue - Layani Pelanggan Pertama',
                'soal' => <<<'TEXT'
Setelah beberapa saat, pelanggan pertama dalam antrian akan dilayani. Manajer restoran ingin menghapus pelanggan yang pertama masuk. Buatlah pseudocode untuk operasi dequeue() pada antrian pelanggan restoran.
TEXT,
                'kunci_tipe_data' => [
                    $this->typeData('queue', 'string[]'),
                    $this->typeData('pelanggan', 'string'),
                    $this->typeData('front', 'int'),
                    $this->typeData('rear', 'int'),
                ],
                'kunci_algoritma' => [
                    $this->step('START', 0, 0),
                    $this->step('IF isEmpty(queue) THEN'),
                    $this->step('PRINT "Antrian kosong. Tidak ada pelanggan untuk dilayani."'),
                    $this->step('RETURN NULL'),
                    $this->step('ELSE', 0, 0),
                    $this->step('pelanggan <- queue[front]'),
                    $this->step('front <- front + 1'),
                    $this->step('IF front > rear THEN'),
                    $this->step('front <- -1'),
                    $this->step('rear <- -1'),
                    $this->step('END IF', 0, 0),
                    $this->step('PRINT "Pelanggan " + pelanggan + " telah dilayani."'),
                    $this->step('END IF', 0, 0),
                    $this->step('END', 0, 0),
                ],
                'order' => 2,
            ],
            [
                'judul' => 'isFull - Cek Antrian Penuh',
                'soal' => <<<'TEXT'
Restoran hanya menerima 10 pelanggan dalam antrian. Manajer ingin tahu apakah antrian sudah penuh. Buatlah pseudocode untuk memeriksa kondisi antrian penuh (isFull) dengan kapasitas maksimal 10 pelanggan.
TEXT,
                'kunci_tipe_data' => [
                    $this->typeData('kapasitas', 'int'),
                    $this->typeData('rear', 'int'),
                ],
                'kunci_algoritma' => [
                    $this->step('START', 0, 0),
                    $this->step('kapasitas <- 10'),
                    $this->step('IF rear == kapasitas - 1 THEN'),
                    $this->step('PRINT "Antrian sudah penuh."'),
                    $this->step('RETURN TRUE'),
                    $this->step('ELSE', 0, 0),
                    $this->step('RETURN FALSE'),
                    $this->step('END IF', 0, 0),
                    $this->step('END', 0, 0),
                ],
                'order' => 3,
            ],
            [
                'judul' => 'Peek Front - Lihat Pelanggan Terdepan',
                'soal' => <<<'TEXT'
Manajer restoran ingin memeriksa siapa pelanggan yang pertama dalam antrian tanpa mengeluarkannya. Buatlah pseudocode untuk operasi peek/front pada antrian pelanggan.
TEXT,
                'kunci_tipe_data' => [
                    $this->typeData('queue', 'string[]'),
                    $this->typeData('front', 'int'),
                ],
                'kunci_algoritma' => [
                    $this->step('START', 0, 0),
                    $this->step('IF isEmpty(queue) THEN'),
                    $this->step('PRINT "Antrian kosong."'),
                    $this->step('RETURN NULL'),
                    $this->step('ELSE', 0, 0),
                    $this->step('PRINT "Pelanggan di depan antrian: " + queue[front]'),
                    $this->step('RETURN queue[front]'),
                    $this->step('END IF', 0, 0),
                    $this->step('END', 0, 0),
                ],
                'order' => 4,
            ],
            [
                'judul' => 'isEmpty - Cek Antrian Kosong',
                'soal' => <<<'TEXT'
Manajer restoran juga ingin memantau apakah antrian kosong sebelum melayani pelanggan. Buatlah pseudocode untuk memeriksa kondisi antrian kosong (isEmpty).
TEXT,
                'kunci_tipe_data' => [
                    $this->typeData('front', 'int'),
                    $this->typeData('rear', 'int'),
                ],
                'kunci_algoritma' => [
                    $this->step('START', 0, 0),
                    $this->step('IF front == -1 OR front > rear THEN'),
                    $this->step('PRINT "Antrian kosong."'),
                    $this->step('RETURN TRUE'),
                    $this->step('ELSE', 0, 0),
                    $this->step('RETURN FALSE'),
                    $this->step('END IF', 0, 0),
                    $this->step('END', 0, 0),
                ],
                'order' => 5,
            ],
            [
                'judul' => 'Clear - Hapus Semua Pelanggan',
                'soal' => <<<'TEXT'
Di tengah hari yang sibuk, manajer ingin menghapus semua data pelanggan dalam antrian. Buatlah pseudocode untuk mengosongkan (clear) seluruh isi antrian sekaligus.
TEXT,
                'kunci_tipe_data' => [
                    $this->typeData('front', 'int'),
                    $this->typeData('rear', 'int'),
                ],
                'kunci_algoritma' => [
                    $this->step('START', 0, 0),
                    $this->step('front <- -1'),
                    $this->step('rear <- -1'),
                    $this->step('PRINT "Antrian telah dibersihkan."'),
                    $this->step('END', 0, 0),
                ],
                'order' => 6,
            ],
            [
                'judul' => 'Display - Tampilkan Seluruh Pelanggan',
                'soal' => <<<'TEXT'
Manajer restoran ingin menampilkan seluruh pelanggan dalam antrian. Buatlah pseudocode untuk mencetak semua data pelanggan yang saat ini berada di dalam antrian.
TEXT,
                'kunci_tipe_data' => [
                    $this->typeData('queue', 'string[]'),
                    $this->typeData('front', 'int'),
                    $this->typeData('rear', 'int'),
                ],
                'kunci_algoritma' => [
                    $this->step('START', 0, 0),
                    $this->step('IF isEmpty(queue) THEN'),
                    $this->step('PRINT "Antrian kosong."'),
                    $this->step('ELSE', 0, 0),
                    $this->step('FOR i <- front TO rear DO'),
                    $this->step('PRINT queue[i]'),
                    $this->step('END FOR', 0, 0),
                    $this->step('END IF', 0, 0),
                    $this->step('END', 0, 0),
                ],
                'order' => 7,
            ],
            [
                'judul' => 'Dequeue dengan Return - Pelanggan Keluar',
                'soal' => <<<'TEXT'
Saat menghapus pelanggan, manajer restoran ingin tahu siapa yang pertama kali keluar dari antrian. Buatlah pseudocode untuk operasi dequeue() yang mengembalikan data pelanggan yang dikeluarkan.
TEXT,
                'kunci_tipe_data' => [
                    $this->typeData('queue', 'string[]'),
                    $this->typeData('pelanggan', 'string'),
                    $this->typeData('front', 'int'),
                    $this->typeData('rear', 'int'),
                ],
                'kunci_algoritma' => [
                    $this->step('START', 0, 0),
                    $this->step('IF isEmpty(queue) THEN'),
                    $this->step('PRINT "Antrian kosong."'),
                    $this->step('RETURN NULL'),
                    $this->step('ELSE', 0, 0),
                    $this->step('pelanggan <- queue[front]'),
                    $this->step('front <- front + 1'),
                    $this->step('IF front > rear THEN'),
                    $this->step('front <- -1'),
                    $this->step('rear <- -1'),
                    $this->step('END IF', 0, 0),
                    $this->step('PRINT "Pelanggan " + pelanggan + " telah dilayani."'),
                    $this->step('RETURN pelanggan'),
                    $this->step('END IF', 0, 0),
                    $this->step('END', 0, 0),
                ],
                'order' => 8,
            ],
            [
                'judul' => 'Batch Enqueue - Tambah Banyak Pelanggan',
                'soal' => <<<'TEXT'
Manajer restoran ingin menambahkan beberapa pelanggan ke dalam antrian sekaligus. Buatlah pseudocode untuk menambahkan daftar pelanggan (pelangganList) ke dalam antrian, dengan pengecekan kondisi penuh di setiap iterasi.
TEXT,
                'kunci_tipe_data' => [
                    $this->typeData('queue', 'string[]'),
                    $this->typeData('pelangganList', 'string[]'),
                    $this->typeData('pelanggan', 'string'),
                    $this->typeData('front', 'int'),
                    $this->typeData('rear', 'int'),
                ],
                'kunci_algoritma' => [
                    $this->step('START', 0, 0),
                    $this->step('READ pelangganList'),
                    $this->step('FOR each pelanggan IN pelangganList DO'),
                    $this->step('IF isFull(queue) THEN'),
                    $this->step('PRINT "Antrian penuh. Tidak dapat menambah pelanggan."'),
                    $this->step('BREAK'),
                    $this->step('ELSE', 0, 0),
                    $this->step('IF isEmpty(queue) THEN'),
                    $this->step('front <- 0'),
                    $this->step('END IF', 0, 0),
                    $this->step('rear <- rear + 1'),
                    $this->step('queue[rear] <- pelanggan'),
                    $this->step('PRINT "Pelanggan " + pelanggan + " berhasil ditambahkan ke antrian."'),
                    $this->step('END IF', 0, 0),
                    $this->step('END FOR', 0, 0),
                    $this->step('END', 0, 0),
                ],
                'order' => 9,
            ],
            [
                'judul' => 'Peek Rear - Lihat Pelanggan Terakhir',
                'soal' => <<<'TEXT'
Manajer restoran ingin memeriksa elemen terakhir dalam antrian. Buatlah pseudocode untuk menampilkan pelanggan yang berada di paling belakang antrian tanpa mengeluarkannya.
TEXT,
                'kunci_tipe_data' => [
                    $this->typeData('queue', 'string[]'),
                    $this->typeData('rear', 'int'),
                ],
                'kunci_algoritma' => [
                    $this->step('START', 0, 0),
                    $this->step('IF isEmpty(queue) THEN'),
                    $this->step('PRINT "Antrian kosong."'),
                    $this->step('RETURN NULL'),
                    $this->step('ELSE', 0, 0),
                    $this->step('PRINT "Pelanggan di belakang antrian: " + queue[rear]'),
                    $this->step('RETURN queue[rear]'),
                    $this->step('END IF', 0, 0),
                    $this->step('END', 0, 0),
                ],
                'order' => 10,
            ],
            [
                'judul' => 'Overflow dan Underflow - Hentikan Proses',
                'soal' => <<<'TEXT'
Manajer restoran ingin menghentikan proses jika antrian penuh dan ada pelanggan yang menunggu lebih lama dari waktu yang diizinkan. Buatlah pseudocode yang menangani kondisi overflow dan underflow pada antrian.
TEXT,
                'kunci_tipe_data' => [
                    $this->typeData('queue', 'string[]'),
                    $this->typeData('front', 'int'),
                    $this->typeData('rear', 'int'),
                ],
                'kunci_algoritma' => [
                    $this->step('START', 0, 0),
                    $this->step('IF isFull(queue) THEN'),
                    $this->step('PRINT "Queue overflow. Proses dihentikan."'),
                    $this->step('STOP', 0, 0),
                    $this->step('END IF', 0, 0),
                    $this->step('IF isEmpty(queue) THEN'),
                    $this->step('PRINT "Queue underflow. Proses dihentikan."'),
                    $this->step('STOP', 0, 0),
                    $this->step('END IF', 0, 0),
                    $this->step('END', 0, 0),
                ],
                'order' => 11,
            ],
            [
                'judul' => 'Insert Terurut - Urutkan Berdasarkan Waktu',
                'soal' => <<<'TEXT'
Seorang manajer ingin mengatur urutan kedatangan pelanggan berdasarkan waktu, dan pelanggan yang datang pertama kali harus dilayani pertama kali. Buatlah pseudocode untuk menyisipkan pelanggan baru ke posisi yang tepat berdasarkan waktu kedatangan.
TEXT,
                'kunci_tipe_data' => [
                    $this->typeData('queue', 'Queue of record'),
                    $this->typeData('pelanggan', 'record'),
                    $this->typeData('front', 'int'),
                    $this->typeData('rear', 'int'),
                    $this->typeData('i', 'int'),
                ],
                'kunci_algoritma' => [
                    $this->step('START', 0, 0),
                    $this->step('READ pelanggan'),
                    $this->step('IF isEmpty(queue) THEN'),
                    $this->step('front <- 0'),
                    $this->step('rear <- 0'),
                    $this->step('queue[rear] <- pelanggan'),
                    $this->step('ELSE', 0, 0),
                    $this->step('i <- rear'),
                    $this->step('WHILE i >= front AND queue[i].waktuKedatangan > pelanggan.waktuKedatangan DO'),
                    $this->step('queue[i + 1] <- queue[i]'),
                    $this->step('i <- i - 1'),
                    $this->step('END WHILE', 0, 0),
                    $this->step('queue[i + 1] <- pelanggan'),
                    $this->step('rear <- rear + 1'),
                    $this->step('END IF', 0, 0),
                    $this->step('END', 0, 0),
                ],
                'order' => 12,
            ],
            [
                'judul' => 'Cari Posisi - Temukan Urutan Pelanggan',
                'soal' => <<<'TEXT'
Manajer restoran ingin melayani pelanggan sesuai dengan urutan posisi mereka dalam antrian. Buatlah pseudocode untuk mencari dan menampilkan posisi pelanggan tertentu berdasarkan nama di dalam antrian.
TEXT,
                'kunci_tipe_data' => [
                    $this->typeData('queue', 'Queue of record'),
                    $this->typeData('nama', 'string'),
                    $this->typeData('front', 'int'),
                    $this->typeData('rear', 'int'),
                    $this->typeData('posisi', 'int'),
                    $this->typeData('i', 'int'),
                ],
                'kunci_algoritma' => [
                    $this->step('START', 0, 0),
                    $this->step('READ nama'),
                    $this->step('FOR i <- front TO rear DO'),
                    $this->step('IF queue[i].nama == nama THEN'),
                    $this->step('posisi <- i - front + 1'),
                    $this->step('PRINT "Pelanggan " + nama + " berada di posisi ke-" + posisi'),
                    $this->step('RETURN'),
                    $this->step('END IF', 0, 0),
                    $this->step('END FOR', 0, 0),
                    $this->step('PRINT "Pelanggan tidak ditemukan."'),
                    $this->step('END', 0, 0),
                ],
                'order' => 13,
            ],
            [
                'judul' => 'Validasi Panjang - Periksa Kapasitas Antrian',
                'soal' => <<<'TEXT'
Setelah setiap pelanggan dilayani, manajer ingin memastikan bahwa antrian tidak terlalu panjang. Buatlah pseudocode untuk memeriksa apakah jumlah pelanggan dalam antrian melebihi batas maksimal yang ditentukan (lebih dari 10).
TEXT,
                'kunci_tipe_data' => [
                    $this->typeData('front', 'int'),
                    $this->typeData('rear', 'int'),
                    $this->typeData('jumlah', 'int'),
                    $this->typeData('batas', 'int'),
                ],
                'kunci_algoritma' => [
                    $this->step('START', 0, 0),
                    $this->step('batas <- 10'),
                    $this->step('IF front == -1 OR front > rear THEN'),
                    $this->step('jumlah <- 0'),
                    $this->step('ELSE', 0, 0),
                    $this->step('jumlah <- rear - front + 1'),
                    $this->step('END IF', 0, 0),
                    $this->step('IF jumlah > batas THEN'),
                    $this->step('PRINT "Antrian terlalu panjang. Harap perhatikan."'),
                    $this->step('ELSE', 0, 0),
                    $this->step('PRINT "Antrian normal."'),
                    $this->step('END IF', 0, 0),
                    $this->step('END', 0, 0),
                ],
                'order' => 14,
            ],
            [
                'judul' => 'Hitung Jumlah - Total Pelanggan Menunggu',
                'soal' => <<<'TEXT'
Manajer ingin mengetahui berapa banyak pelanggan yang sedang menunggu di antrian. Buatlah pseudocode untuk menghitung dan menampilkan jumlah total pelanggan yang saat ini berada di dalam antrian.
TEXT,
                'kunci_tipe_data' => [
                    $this->typeData('front', 'int'),
                    $this->typeData('rear', 'int'),
                    $this->typeData('jumlah', 'int'),
                ],
                'kunci_algoritma' => [
                    $this->step('START', 0, 0),
                    $this->step('IF front == -1 OR front > rear THEN'),
                    $this->step('jumlah <- 0'),
                    $this->step('ELSE', 0, 0),
                    $this->step('jumlah <- rear - front + 1'),
                    $this->step('END IF', 0, 0),
                    $this->step('PRINT "Jumlah pelanggan yang sedang menunggu: " + jumlah'),
                    $this->step('END', 0, 0),
                ],
                'order' => 15,
            ],
            [
                'judul' => 'Filter Waktu Tunggu - Deteksi Pelanggan Terlalu Lama',
                'soal' => <<<'TEXT'
Manajer restoran ingin memeriksa apakah ada pelanggan yang telah menunggu lebih lama dari batas waktu yang ditentukan. Buatlah pseudocode untuk menelusuri antrian dan menampilkan pelanggan yang melewati batas waktu tunggu maksimum.
TEXT,
                'kunci_tipe_data' => [
                    $this->typeData('queue', 'Queue of record'),
                    $this->typeData('waktuMax', 'int'),
                    $this->typeData('front', 'int'),
                    $this->typeData('rear', 'int'),
                    $this->typeData('i', 'int'),
                ],
                'kunci_algoritma' => [
                    $this->step('START', 0, 0),
                    $this->step('READ waktuMax'),
                    $this->step('IF front == -1 OR front > rear THEN'),
                    $this->step('PRINT "Antrian kosong."'),
                    $this->step('ELSE', 0, 0),
                    $this->step('FOR i <- front TO rear DO'),
                    $this->step('IF queue[i].waktuMenunggu > waktuMax THEN'),
                    $this->step('PRINT "Pelanggan " + queue[i].nama + " telah menunggu terlalu lama."'),
                    $this->step('END IF', 0, 0),
                    $this->step('END FOR', 0, 0),
                    $this->step('END IF', 0, 0),
                    $this->step('END', 0, 0),
                ],
                'order' => 16,
            ],
            [
                'judul' => 'Display Nama - Tampilkan Semua Pembeli',
                'soal' => <<<'TEXT'
Manajer restoran ingin menampilkan seluruh data pembeli yang mengantri di sebuah warung dengan menggunakan antrian (queue). Buatlah pseudocode untuk mencetak nama seluruh pembeli dalam antrian dari posisi depan hingga belakang.
TEXT,
                'kunci_tipe_data' => [
                    $this->typeData('queue', 'Queue of record'),
                    $this->typeData('front', 'int'),
                    $this->typeData('rear', 'int'),
                ],
                'kunci_algoritma' => [
                    $this->step('START', 0, 0),
                    $this->step('IF front == -1 OR front > rear THEN'),
                    $this->step('PRINT "Antrian kosong."'),
                    $this->step('ELSE', 0, 0),
                    $this->step('FOR i <- front TO rear DO'),
                    $this->step('PRINT queue[i].nama'),
                    $this->step('END FOR', 0, 0),
                    $this->step('END IF', 0, 0),
                    $this->step('END', 0, 0),
                ],
                'order' => 17,
            ],
            [
                'judul' => 'Validasi Registrasi - Cek Pelanggan Tidak Terdeteksi',
                'soal' => <<<'TEXT'
Manajer restoran ingin mengecek apakah ada pelanggan yang masuk ke antrian tetapi tidak terdeteksi. Buatlah pseudocode untuk memvalidasi konsistensi data antrian dan mendeteksi pelanggan yang tidak terdaftar.
TEXT,
                'kunci_tipe_data' => [
                    $this->typeData('queue', 'Queue of record'),
                    $this->typeData('front', 'int'),
                    $this->typeData('rear', 'int'),
                    $this->typeData('i', 'int'),
                ],
                'kunci_algoritma' => [
                    $this->step('START', 0, 0),
                    $this->step('IF front == -1 OR front > rear THEN'),
                    $this->step('PRINT "Semua pelanggan telah terdaftar."'),
                    $this->step('ELSE', 0, 0),
                    $this->step('FOR i <- front TO rear DO'),
                    $this->step('IF queue[i].nama == NULL OR queue[i].nama == "" THEN'),
                    $this->step('PRINT "Ada pelanggan yang tidak terdaftar dalam antrian."'),
                    $this->step('RETURN'),
                    $this->step('END IF', 0, 0),
                    $this->step('END FOR', 0, 0),
                    $this->step('PRINT "Semua pelanggan telah terdaftar."'),
                    $this->step('END IF', 0, 0),
                    $this->step('END', 0, 0),
                ],
                'order' => 18,
            ],
            [
                'judul' => 'Filter Saldo - Saring Nasabah Berdasarkan Saldo',
                'soal' => <<<'TEXT'
Manajer restoran ingin menyaring pelanggan dengan saldo lebih besar dari nilai tertentu. Elemen yang tidak memenuhi syarat harus tetap berada di queue, sedangkan nasabah yang memenuhi syarat dikeluarkan dan diproses. Buatlah pseudocode untuk memfilter nasabah berdasarkan nilai saldo tertentu.
TEXT,
                'kunci_tipe_data' => [
                    $this->typeData('queue', 'Queue of record'),
                    $this->typeData('queueBaru', 'Queue of record'),
                    $this->typeData('nasabah', 'record'),
                    $this->typeData('saldoMax', 'float'),
                ],
                'kunci_algoritma' => [
                    $this->step('START', 0, 0),
                    $this->step('READ saldoMax'),
                    $this->step('queueBaru <- kosong'),
                    $this->step('WHILE not isEmpty(queue) DO'),
                    $this->step('nasabah <- dequeue(queue)'),
                    $this->step('IF nasabah.saldo > saldoMax THEN'),
                    $this->step('PRINT "Nasabah " + nasabah.nama + " memiliki saldo lebih besar dari " + saldoMax'),
                    $this->step('ELSE', 0, 0),
                    $this->step('enqueue(queueBaru, nasabah)'),
                    $this->step('END IF', 0, 0),
                    $this->step('END WHILE', 0, 0),
                    $this->step('queue <- queueBaru'),
                    $this->step('END', 0, 0),
                ],
                'order' => 19,
            ],
            [
                'judul' => 'Cari Posisi Nasabah - Tampil Data Depan dan Posisi',
                'soal' => <<<'TEXT'
Manajer restoran ingin menampilkan data nasabah yang berada di depan queue dan memeriksa posisi nasabah tertentu dalam antrian. Buatlah pseudocode untuk mencari dan menampilkan posisi nasabah berdasarkan nama dalam antrian.
TEXT,
                'kunci_tipe_data' => [
                    $this->typeData('queue', 'Queue of record'),
                    $this->typeData('nama', 'string'),
                    $this->typeData('front', 'int'),
                    $this->typeData('rear', 'int'),
                    $this->typeData('posisi', 'int'),
                    $this->typeData('i', 'int'),
                ],
                'kunci_algoritma' => [
                    $this->step('START', 0, 0),
                    $this->step('READ nama'),
                    $this->step('IF isEmpty(queue) THEN'),
                    $this->step('PRINT "Nasabah tidak ada dalam antrian."'),
                    $this->step('ELSE', 0, 0),
                    $this->step('PRINT "Nasabah di depan queue: " + queue[front].nama'),
                    $this->step('FOR i <- front TO rear DO'),
                    $this->step('IF queue[i].nama == nama THEN'),
                    $this->step('posisi <- i - front + 1'),
                    $this->step('PRINT "Nasabah " + nama + " berada di posisi ke-" + posisi'),
                    $this->step('RETURN'),
                    $this->step('END IF', 0, 0),
                    $this->step('END FOR', 0, 0),
                    $this->step('PRINT "Nasabah tidak ada dalam antrian."'),
                    $this->step('END IF', 0, 0),
                    $this->step('END', 0, 0),
                ],
                'order' => 20,
            ],
        ];

        DB::transaction(function () use ($questions): void {
            foreach ($questions as $question) {
                Soal::updateOrCreate(
                    [
                        'id_level' => self::LEVEL_ID,
                        'judul' => $question['judul'],
                    ],
                    [
                        'soal' => $question['soal'],
                        'kunci_tipe_data' => $question['kunci_tipe_data'],
                        'kunci_algoritma' => $question['kunci_algoritma'],
                        'order' => $question['order'],
                        'status' => 1,
                    ]
                );
            }
        });
    }

    private function typeData(string $variabel, string $tipeData, int $konversi = 1): array
    {
        return [
            'variabel' => $variabel,
            'tipe_data' => $tipeData,
            'konversi' => $konversi,
        ];
    }

    private function step(string $langkah, int $clue = 0, int $konversi = 1): array
    {
        return [
            'langkah' => $langkah,
            'clue' => $clue,
            'konversi' => $konversi,
        ];
    }
}