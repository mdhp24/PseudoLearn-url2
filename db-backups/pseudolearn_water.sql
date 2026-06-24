-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: May 23, 2026 at 03:51 PM
-- Server version: 8.4.8
-- PHP Version: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pseudolearn_water`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank_soal_konversi`
--

CREATE TABLE `bank_soal_konversi` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_soal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int UNSIGNED NOT NULL DEFAULT '0',
  `jawaban` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `output` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `difficulty` enum('easy','medium','hard') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'easy',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bank_soal_konversi`
--

INSERT INTO `bank_soal_konversi` (`id`, `id_level`, `id_soal`, `order`, `jawaban`, `output`, `difficulty`, `created_at`, `updated_at`, `deleted_at`) VALUES
('0199651d-b77a-7329-8b9a-0e5b6b2f16d6', '01995dec-678e-70cf-854a-b25e2c2d0d28', '01995df6-35ed-7363-9d42-578622c3e4f2', 0, '[\"double pajak = 0.1;\", \"int harga_motor = 25000000;\", \"int uang_bayar;\", \"float pajak_jual;\", \"pajak_jual = pajak * harga_motor;\", \"uang_bayar = harga_motor + pajak_jual;\", \"System.out.print(uang_bayar);\"]', '27500000', 'easy', '2025-09-19 20:14:30', '2025-10-01 22:41:45', NULL),
('01996525-5cf1-7256-8f2f-184909a171ff', '01995dec-678e-70cf-854a-b25e2c2d0d28', '01995e0a-74d3-73fa-895b-cfe6f4ec6ab6', 0, '[\"int harga_dasar;\", \"float persentase_pajak;\", \"int harga_akhir;\", \"float nilai_pajak;\", \"harga_dasar = 85000;\", \"persentase_pajak = 0.1;\", \"nilai_pajak = harga_dasar * persentase_pajak;\", \"harga_akhir = harga_dasar + nilai_pajak;\", \"System.out.print(\\\"Harga akhir setelah pajak: Rp\\\" + harga_akhir);\"]', 'Harga akhir setelah pajak: Rp93500', 'easy', '2025-09-19 20:22:51', '2025-10-01 22:40:16', NULL),
('0199652a-ab5d-7201-b71c-3e984cfd80f4', '01995dec-678e-70cf-854a-b25e2c2d0d28', '01995e1e-b10a-70d3-8210-d2eee6fe2807', 0, '[\"int panjang = 10;\", \"int lebar = 6;\", \"float tinggi = 1.5f;\", \"double luas_bagian;\", \"luas_bagian = 2 * ((panjang * lebar) + (panjang * tinggi) + (lebar * tinggi));\", \"System.out.println(\\\"Luas Bagian: \\\" +luas_bagian);\"]', 'Luas Bagian: 168.0', 'easy', '2025-09-19 20:28:39', '2025-10-01 22:35:45', NULL),
('01996533-c470-7186-8aff-58267983f830', '01995dec-678e-70cf-854a-b25e2c2d0d28', '01995e24-1a61-73eb-b623-a0220a69532e', 0, '[\"int panjang = 20;\", \"int lebar = 20;\", \"int tinggi = 7;\", \"long volume;\", \"System.out.println(\\\"Panjang: \\\" + panjang + \\\", Lebar: \\\" + lebar + \\\", Tinggi: \\\" + tinggi);\", \"volume = panjang * lebar * tinggi;\", \"System.out.println(\\\"Volume setiap box nasi sebesar: \\\" + volume);\"]', 'Panjang: 20, Lebar: 20, Tinggi: 7\nVolume setiap box nasi sebesar: 2800', 'easy', '2025-09-19 20:38:35', '2025-09-22 00:16:45', NULL),
('0199653d-66d4-7335-bfdc-34bd3f31837d', '01995dec-678e-70cf-854a-b25e2c2d0d28', '01995e27-3c16-7365-be30-b2fed20f53a2', 0, '[\"int r = 42;\", \"float phi = 3.14f;\", \"double taman_bunga;\", \"System.out.println(\\\"Jari-jari: \\\" + r + \\\", phi: \\\" + phi);\", \"taman_bunga = 0.5 * (phi * r * r);\", \"System.out.println(\\\"Luas dari taman bunga sebesar: \\\" + taman_bunga);\"]', 'Jari-jari: 42, phi: 3.14\nLuas dari taman bunga sebesar: 2769.47998046875', 'easy', '2025-09-19 20:49:06', '2025-10-01 22:31:18', NULL),
('01996543-dbbf-73ec-b0d6-ff48905b627a', '01995e0c-9825-73b3-b94f-2ae0542eabef', '01995e2b-056e-716f-a01a-2794060829e0', 0, '[\"int age;\", \"age = 17;\", \"if(age >= 16) {\", \"System.out.println(\\\"Anda dapat melanjutkan tes pembuatan SIM\\\");\", \"} else {\", \"System.out.println(\\\"Anda tidak dapat melanjutkan tes pembuatan SIM\\\");\", \"}\"]', 'Anda dapat melanjutkan tes pembuatan SIM', 'easy', '2025-09-19 20:56:10', '2025-10-01 23:13:39', NULL),
('019966b3-d61f-733a-be06-733c496cdacc', '01995e0c-9825-73b3-b94f-2ae0542eabef', '0199656f-eb1f-70c7-b952-1825aa45f75c', 0, '[\"float ipk;\", \"int toefl;\", \"int attitude;\", \"ipk = 3.5;\", \"toefl = 480;\", \"attitude = 75;\", \"if (ipk >= 3.5 && toefl >= 450) {\", \"if (attitude >= 60 && attitude <= 100) {\", \"System.out.print(\\\"Pelamar dinyatakan lolos seleksi administrasi\\\");\", \"} else {\", \"System.out.print(\\\"Pelamar dinyatakan tidak lolos seleksi administrasi\\\");\", \"}\", \"} else if (ipk >= 3.4 && toefl >= 400 && attitude >= 80 && attitude <= 100) {\", \"System.out.print(\\\"Pelamar dinyatakan lolos bersyarat seleksi administrasi\\\");\", \"} else {\", \"System.out.print(\\\"Pelamar dinyatakan tidak lolos seleksi administrasi\\\");\", \"}\"]', 'Pelamar dinyatakan lolos seleksi administrasi', 'easy', '2025-09-20 03:38:05', '2025-10-01 23:12:00', NULL),
('019966d2-47f3-70f0-9024-24da44ca3981', '01995e0c-9825-73b3-b94f-2ae0542eabef', '0199657d-34ff-739e-bfef-e842ea2e57d3', 0, '[\"String member_card;\", \"int tot_belanja;\", \"float diskon;\", \"int bayar;\", \"tot_belanja = 300000;\", \"member_card = \\\"ya\\\";\", \"if (member_card.equalsIgnoreCase(\\\"ya\\\")) {\", \"if (tot_belanja > 500000) {\", \"System.out.println(\\\"diskon 10%\\\");\", \"} else if (tot_belanja >= 251000 && tot_belanja <= 500000) {\", \"System.out.println(\\\"diskon 5%\\\");\", \"} else if (tot_belanja >= 150000 && tot_belanja <= 250000) {\", \"System.out.println(\\\"diskon 2%\\\");\", \"} else {\", \"System.out.println(\\\"diskon 0%\\\");\", \"}\", \"}\"]', 'diskon 5%', 'easy', '2025-09-20 04:11:21', '2025-10-01 22:56:42', NULL),
('019966e6-b2f8-724f-96d8-d179a6452519', '01995e0c-9825-73b3-b94f-2ae0542eabef', '01996581-d9fc-7116-ac8c-a860cd1b79bd', 0, '[\"int age;\", \"age = 18;\", \"if (age >= 13 && age <= 16) {\", \"System.out.println(\\\"Anda hanya dapat menonton film dengan label Semua Umur (SU)\\\");\", \"} else if (age >= 17 && age <= 20) {\", \"System.out.println(\\\"Anda dapat menonton film dengan label Semua Umur (SU) dan 17+\\\");\", \"} else if (age >= 21) {\", \"System.out.println(\\\"Anda dapat menonton film dengan label semua jenis film\\\");\", \"} else {\", \"System.out.println(\\\"Anda tidak memenuhi kriteria untuk menonton film\\\");\", \"}\"]', 'Anda dapat menonton film dengan label Semua Umur (SU) dan 17+', 'easy', '2025-09-20 04:33:39', '2025-10-01 22:49:41', NULL),
('019966ee-b434-7202-b50f-08820a2db7c3', '01995e0c-9825-73b3-b94f-2ae0542eabef', '01996586-e110-71b7-9507-6b306ef78d5e', 0, '[\"int a, b, c;\", \"a = 10;\", \"b = 20;\", \"c = 15;\", \"if (a > b && a > c) {\", \"System.out.println(\\\"angka a = \\\" + a + \\\" lebih besar\\\");\", \"} else if (b > c) {\", \"System.out.println(\\\"angka b = \\\" + b + \\\" lebih besar\\\");\", \"} else {\", \"System.out.println(\\\"angka c = \\\" + c + \\\" lebih besar\\\");\", \"}\"]', 'angka b = 20 lebih besar', 'easy', '2025-09-20 04:42:23', '2025-10-01 22:46:50', NULL),
('01996701-587b-716d-8987-f42601e1a3e5', '01985f44-f662-72f9-a85b-a7b256942492', '019965b3-5dc1-733a-96f3-167263ed3ac1', 0, '[\"double[] stackSetoran = new double[100];\", \"double setoran;\", \"int top;\", \"String jawaban;\", \"setoran = 3500000;\", \"top = -1;\", \"if (setoran > 3000000) {\", \"System.out.println(\\\"Ingin menambah setoran? (ya/tidak)\\\");\", \"jawaban = \\\"ya\\\";\", \"if (jawaban.equalsIgnoreCase(\\\"ya\\\")) {\", \"stackSetoran[++top] = setoran;\", \"}\", \"}\", \"System.out.println(\\\"Jumlah setoran: \\\" + setoran);\"]', 'Ingin menambah setoran? (ya/tidak)\nJumlah setoran: 3500000.0', 'easy', '2025-09-20 05:02:45', '2025-10-03 05:14:33', NULL),
('01996704-a269-7143-91cb-b94885954cf0', '01985f44-f662-72f9-a85b-a7b256942492', '01996594-b7ae-7084-a4b6-fef776832975', 0, '[\"char[] stackPiring = new char[100];\", \"char piring;\", \"int top;\", \"piring = \'A\';\", \"top = -1;\", \"stackPiring[++top] = piring;\", \"piring = stackPiring[top--];\", \"System.out.println(\\\"Piring siap dipakai: \\\" + piring);\"]', 'Piring siap dipakai: A', 'easy', '2025-09-20 05:06:21', '2025-10-03 07:12:37', NULL),
('0199670c-056e-727c-a34c-557719e99338', '01985f44-f662-72f9-a85b-a7b256942492', '019965a5-6b5d-7016-88a8-1c825dcd3a97', 0, '[\"String[] stackBarang = new String[100];\", \"float berat;\", \"String namaBarang;\", \"String jawaban;\", \"int top;\", \"berat = 35;\", \"top = -1;\", \"if (berat > 30) {\", \"System.out.println(\\\"Ada barang tambahan? (ya/tidak)\\\");\", \"jawaban = \\\"ya\\\";\", \"if (jawaban.equalsIgnoreCase(\\\"ya\\\")) {\", \"namaBarang = \\\"Meja\\\";\", \"stackBarang[++top] = namaBarang;\", \"}\", \"}\", \"System.out.println(\\\"Berat barang: \\\" + berat);\"]', 'Ada barang tambahan? (ya/tidak)\nBerat barang: 35.0', 'easy', '2025-09-20 05:14:25', '2025-10-03 07:10:19', NULL),
('0199670f-ce53-71d6-93a3-0d9f17529207', '01985f44-f662-72f9-a85b-a7b256942492', '019965aa-adc2-73b8-b977-79ce500534db', 0, '[\"String[] stackMakanan = new String[100];\", \"String makanan;\", \"int jumlahMakanan;\", \"int top;\", \"makanan = \\\"Nasi Goreng\\\";\", \"jumlahMakanan = 6;\", \"top = -1;\", \"if (jumlahMakanan > 5) {\", \"stackMakanan[++top] = makanan;\", \"System.out.println(\\\"Makanan yang dihidangkan: \\\" + stackMakanan[top--]);\", \"} else {\", \"stackMakanan[++top] = makanan;\", \"}\"]', 'Makanan yang dihidangkan: Nasi Goreng', 'easy', '2025-09-20 05:18:33', '2025-10-03 06:51:39', NULL),
('01996724-a8fc-72d5-9780-8d3002c46060', '01985f44-f662-72f9-a85b-a7b256942492', '0199671f-15f6-7101-a4c4-2f9227cb03e2', 0, '[\"String[] rakDokumen = new String[100]; int top = -1;\", \"String dokumen;\", \"dokumen = \\\"Surat_Keuangan.pdf\\\";\", \"if (top >= 0) {\", \"String dokumenKeluar = rakDokumen[top--];\", \"System.out.println(\\\"Dokumen yang dikeluarkan: \\\" + dokumenKeluar);\", \"System.out.print(\\\"Sisa dokumen di rak: \\\"); for (int i=0;i<=top;i++) System.out.print(rakDokumen[i]+\\\" \\\");\", \"} else {\", \"System.out.println(\\\"Rak kosong, tidak ada dokumen yang bisa dikeluarkan\\\");\", \"}\"]', 'Rak kosong, tidak ada dokumen yang bisa dikeluarkan', 'easy', '2025-09-20 05:41:19', '2025-10-03 04:43:39', NULL),
('01996747-6c58-73fb-8924-a720f71da756', '01995e0d-85fe-7041-8c7e-cdfbc81bf1ed', '01996744-c306-7298-beec-4f93e45cfa06', 0, '[\"int bilangan;\", \"int kelipatan;\", \"bilangan = 10;\", \"kelipatan = 2;\", \"for (int i = 1; i <= bilangan; i += kelipatan) {\", \"for (int j = 0; j < i; j++) System.out.print(\\\"*\\\"); System.out.println();\", \"}\"]', '*\n***\n*****\n*******\n*********', 'easy', '2025-09-20 06:19:18', '2025-10-01 23:55:57', NULL),
('01996a97-0b6a-7046-a8ef-5b29c3be2014', '01995e0d-85fe-7041-8c7e-cdfbc81bf1ed', '0199674b-b207-71ea-b22e-cf9973f75db4', 0, '[\"int nomor;\", \"int faktorial;\", \"nomor = 5;\", \"faktorial = 1;\", \"for (int i = 1; i <= nomor; i++) {\", \"faktorial *= i;\", \"}\", \"System.out.println(\\\"Faktorial dari \\\" + nomor + \\\" adalah \\\" + faktorial);\"]', 'Faktorial dari 5 adalah 120', 'easy', '2025-09-20 21:45:07', '2025-10-01 23:54:39', NULL),
('01996a99-5160-70fe-a8cd-72263c141e38', '01995e0d-85fe-7041-8c7e-cdfbc81bf1ed', '0199674e-e634-718b-beaf-d8f0d57de3f5', 0, '[\"String kata;\", \"kata = \\\"Politeknik Negeri Malang\\\";\", \"for (int i = 0; i < 5; i++) {\", \"System.out.println(kata);\", \"}\"]', 'Politeknik Negeri Malang\nPoliteknik Negeri Malang\nPoliteknik Negeri Malang\nPoliteknik Negeri Malang\nPoliteknik Negeri Malang', 'easy', '2025-09-20 21:47:36', '2025-10-01 23:53:42', NULL),
('01996a9f-8855-7201-b109-d7c5eea4128a', '01995e0d-85fe-7041-8c7e-cdfbc81bf1ed', '01996753-90ea-7040-bb5c-7cd7ab5e6078', 0, '[\"int n;\", \"int fib0, fib1, fib2;\", \"n = 50;\", \"fib0 = 0;\", \"fib1 = 1;\", \"System.out.print(fib0 + \\\" \\\" + fib1);\", \"while (true) {\", \"fib2 = fib0 + fib1;\", \"if (fib2 >= n) break;\", \"System.out.print(\\\" \\\" + fib2);\", \"fib0 = fib1;\", \"fib1 = fib2;\", \"}\"]', '0 1 1 2 3 5 8 13 21 34', 'easy', '2025-09-20 21:54:24', '2025-10-01 23:50:01', NULL),
('01996aa5-6f72-735e-90c2-3b5942c44435', '01995e0d-85fe-7041-8c7e-cdfbc81bf1ed', '01996757-a7b5-72e7-ae2c-c91194f3357d', 0, '[\"int[] deret = new int[8];\", \"int jumlahDeret = 0;\", \"deret[0] = 1;\", \"for (int i = 1; i < 8; i++) {\", \"deret[i] = deret[i-1] * 2;\", \"jumlahDeret += deret[i];\", \"}\", \"for (int i = 0; i < 8; i++) System.out.print(deret[i] + \\\" \\\");\", \"System.out.println(\\\"\\\\nJumlah seluruh elemen dalam deret: \\\" + jumlahDeret);\"]', '1 2 4 8 16 32 64 128\nJumlah seluruh elemen dalam deret: 254', 'easy', '2025-09-20 22:00:50', '2025-10-01 23:22:24', NULL),
('01996aaa-63bd-7318-8b26-d7abf296e78e', '01995e0d-85fe-7041-8c7e-cdfbc81bf1ed', '0199675d-4c17-7287-8ac8-1fae60417c7e', 0, '[\"int n;\", \"char c;\", \"n = 51;\", \"for (int i = 0; i <= n; i++) {\", \"System.out.println(\\\"Nilai \\\" + i + \\\" memiliki keluaran karakter : \\\" + (char)i);\", \"if (Character.isLowerCase((char)i)) {\", \"System.out.println(\\\"Huruf kecil\\\");\", \"}\", \"}\"]', 'Nilai 0 memiliki keluaran karakter :\nNilai 48 memiliki keluaran karakter : 0\nNilai 49 memiliki keluaran karakter : 1\nNilai 50 memiliki keluaran karakter : 2\nNilai 51 memiliki keluaran karakter : 3', 'easy', '2025-09-20 22:06:15', '2025-10-01 23:20:05', NULL),
('01996aad-b832-7227-8990-58efa5105310', '01995e0d-85fe-7041-8c7e-cdfbc81bf1ed', '01996760-3a58-7095-bfb0-d05466e817c5', 0, '[\"int jumlah_bilangan_asli;\", \"int ui;\", \"jumlah_bilangan_asli = 5;\", \"for (int i = 1; i <= jumlah_bilangan_asli; i++) {\", \"ui = 25 * i;\", \"System.out.println(\\\"U\\\" + i + \\\" = 25 * \\\" + i + \\\" = \\\" + ui);\", \"}\"]', 'U1 = 25 * 1 = 25\nU2 = 25 * 2 = 50\nU3 = 25 * 3 = 75\nU4 = 25 * 4 = 100\nU5 = 25 * 5 = 125', 'easy', '2025-09-20 22:09:53', '2025-10-01 23:15:18', NULL),
('01996abc-979d-7187-90fa-068f0f7623c0', '01995e12-4580-7361-b0d1-379bdea0b2b6', '01996765-71ea-7079-8d2d-573093f98e7c', 0, '[\"String warna;\", \"String tindakan;\", \"warna = \\\"merah\\\";\", \"switch (warna) {\", \"case \\\"merah\\\":\", \"tindakan = \\\"berhenti\\\";\", \"break;\", \"case \\\"kuning\\\":\", \"tindakan = \\\"hati-hati\\\";\", \"break;\", \"case \\\"hijau\\\":\", \"tindakan = \\\"jalan\\\";\", \"break;\", \"default:\", \"tindakan = \\\"warna yang anda inputkan salah\\\";\", \"break;\", \"}\", \"System.out.println(\\\"Tindakan : \\\" +tindakan);\"]', 'Tindakan : berhenti', 'easy', '2025-09-20 22:26:08', '2025-10-02 00:05:20', NULL),
('01996ad8-b320-7381-876b-aa1a114fd72e', '01985f44-f662-72f9-a85b-a7b256942492', '01996acc-ed8f-7078-84c5-e827079e6360', 0, '[\"int desimal;\", \"int sisa;\", \"int[] stackBiner = new int[32];\", \"int bit;\", \"int top;\", \"desimal = 60;\", \"stackBiner = new int[32];\", \"top = -1;\", \"while (desimal > 0) {\", \"sisa = desimal % 2;\", \"stackBiner[++top] = sisa;\", \"desimal = desimal / 2;\", \"}\", \"while (top >= 0) {\", \"bit = stackBiner[top--];\", \"System.out.print(bit);\", \"}\"]', '111100', 'easy', '2025-09-20 22:56:50', '2025-10-03 04:32:14', NULL),
('01996b0f-8f47-705a-9242-fc0f5c0c9b73', '01995e13-29af-7010-8995-1a40e4504851', '01996ac8-52d1-7171-9a2e-5455ae83c2b1', 0, '[\"int[] nilai;\", \"int total_sum;\", \"nilai = new int[]{20,5,25,8,3};\", \"for (int i = 0; i < nilai.length; i++) {\", \"System.out.println(\\\"Elemen ke-\\\" + i + \\\": \\\" + nilai[i]);\", \"}\", \"total_sum = 0;\", \"for (int num : nilai) {\", \"total_sum += num;\", \"}\", \"System.out.println(\\\"Jumlah semua elemen pada array adalah: \\\" + total_sum);\"]', 'Elemen ke-0: 20\nElemen ke-1: 5\nElemen ke-2: 25\nElemen ke-3: 8\nElemen ke-4: 3\nJumlah semua elemen pada array adalah: 61', 'easy', '2025-09-20 23:56:45', '2025-10-03 04:04:45', NULL),
('01996b11-98ee-7029-b142-4cf33b01572f', '01995e13-29af-7010-8995-1a40e4504851', '01996adc-1108-70fc-b2c8-3a9836158a03', 0, '[\"String[] artis;\", \"artis = new String[]{\\\"Suzy\\\", \\\"Song Hye Kyo\\\", \\\"Lee Minho\\\", \\\"Yoona\\\", \\\"Junho\\\"};\", \"for (int i = 0; i < artis.length; i++) {\", \"System.out.println(\\\"Indeks \\\" + i + \\\": \\\" + artis[i]);\", \"}\"]', 'Indeks 0: Suzy\nIndeks 1: Song Hye Kyo\nIndeks 2: Lee Minho\nIndeks 3: Yoona\nIndeks 4: Junho', 'easy', '2025-09-20 23:58:59', '2025-10-03 04:03:57', NULL),
('01996b17-97c2-73c3-a534-81fe0339d9b7', '01995e13-29af-7010-8995-1a40e4504851', '01996adf-b46d-73b2-8cdc-434273bd18c8', 0, '[\"int[] array;\", \"int elemen;\", \"array = new int[]{1, 3, 5, 7, 9, 11, 13};\", \"for (int i = 0; i < array.length; i++) {\", \"elemen = array[i];\", \"System.out.print(elemen);\", \"}\"]', '135791113', 'easy', '2025-09-21 00:05:32', '2025-10-03 04:02:54', NULL),
('01996b1d-e0cf-7010-ae19-8acf31408870', '01995e13-29af-7010-8995-1a40e4504851', '01996ae3-7692-722e-b457-fff0ed70eecf', 0, '[\"int[] bilangan;\", \"int jumlah_bilangan;\", \"int total_nilai;\", \"float rata_rata;\", \"bilangan = new int[]{10, 11, 12, 13, 14, 15};\", \"jumlah_bilangan = bilangan.length;\", \"total_nilai = 0;\", \"for (int n : bilangan) {\", \"total_nilai += n;\", \"}\", \"rata_rata = (double) total_nilai / jumlah_bilangan;\", \"System.out.println(\\\"Bilangan:\\\");\", \"for (int n : bilangan) {\", \"System.out.print(n + \\\" \\\");\", \"}\", \"System.out.println(\\\"Jumlah bilangan: \\\" + jumlah_bilangan);\", \"System.out.println(\\\"Total nilai: \\\" + total_nilai);\", \"System.out.println(\\\"Rata-rata: \\\" + rata_rata);\"]', 'Bilangan:\n10 11 12 13 14 15 Jumlah bilangan: 6\nTotal nilai: 75\nRata-rata: 12.5', 'easy', '2025-09-21 00:12:24', '2025-10-03 03:48:19', NULL),
('01996b22-3878-7083-bc02-833d42743a3e', '01995e13-29af-7010-8995-1a40e4504851', '01996ae7-0dd8-723c-b978-0f3bae73aaa1', 0, '[\"int[] bilangan;\", \"int nilai_max;\", \"int nilai_min;\", \"bilangan = new int[]{1,2,3,4,5,6,7,8,9,10};\", \"nilai_max = bilangan[0];\", \"nilai_min = bilangan[0];\", \"for(int i = 1; i < bilangan.length; i++) {\", \"if(bilangan[i] > nilai_max) nilai_max = bilangan[i];\", \"if(bilangan[i] < nilai_min) nilai_min = bilangan[i];\", \"}\", \"System.out.println(\\\"Bilangan: \\\" + java.util.Arrays.toString(bilangan));\", \"System.out.println(\\\"Nilai maksimum: \\\" + nilai_max);\", \"System.out.println(\\\"Nilai minimum: \\\" + nilai_min);\"]', 'Bilangan: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]\nNilai maksimum: 10\nNilai minimum: 1', 'easy', '2025-09-21 00:17:08', '2025-10-02 19:16:41', NULL),
('2e8d58a3-5441-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', NULL, 0, 'class Node { int d; Node n; Node(int d){this.d=d;} }\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        Node head = new Node(10);\r\n        head.n = new Node(20);\r\n        head.n.n = new Node(30);\r\n        \r\n        System.out.println(\"Depan: \" + head.d);\r\n        System.out.println(\"Belakang: \" + head.n.n.d);\r\n    }\r\n}', 'Depan: 10\r\nBelakang: 30', 'easy', '2026-05-20 11:43:55', '2026-05-20 11:43:55', NULL),
('2e8d6b13-5441-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', NULL, 0, 'class Node { String d; Node n; Node(String d){this.d=d;} }\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        Node h = new Node(\"A\");\r\n        h.n = new Node(\"B\");\r\n        h.n.n = new Node(\"C\");\r\n        \r\n        int count = 0;\r\n        Node tmp = h;\r\n        while(tmp != null) {\r\n            count++;\r\n            tmp = tmp.n;\r\n        }\r\n        System.out.println(\"Jumlah: \" + count);\r\n    }\r\n}', 'Jumlah: 3', 'easy', '2026-05-20 11:43:55', '2026-05-20 11:43:55', NULL),
('2e8d764b-5441-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', NULL, 0, 'class Node { String d; Node n; Node(String d){this.d=d;} }\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        Node h = new Node(\"B\");\r\n        h.n = new Node(\"C\");\r\n        \r\n        Node baru = new Node(\"A\");\r\n        baru.n = h;\r\n        h = baru;\r\n        \r\n        while(h != null) {\r\n            System.out.print(h.d + \" \");\r\n            h = h.n;\r\n        }\r\n    }\r\n}', 'A B C ', 'easy', '2026-05-20 11:43:55', '2026-05-20 11:43:55', NULL),
('2e8d7fa6-5441-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', NULL, 0, 'class DNode { String d; DNode p, n; DNode(String d){this.d=d;} }\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        DNode l1 = new DNode(\"Lagu1\");\r\n        DNode l2 = new DNode(\"Lagu2\");\r\n        \r\n        l1.n = l2;\r\n        l2.p = l1;\r\n        \r\n        System.out.println(\"Maju: \" + l1.d + \", \" + l1.n.d);\r\n        System.out.println(\"Mundur: \" + l2.d + \", \" + l2.p.d);\r\n    }\r\n}', 'Maju: Lagu1, Lagu2\r\nMundur: Lagu2, Lagu1', 'easy', '2026-05-20 11:43:55', '2026-05-20 11:43:55', NULL),
('2e8d8cab-5441-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', NULL, 0, 'class Node { String d; Node n; Node(String d){this.d=d;} }\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        Node h = new Node(\"Sate\");\r\n        h.n = new Node(\"Soto\");\r\n        h.n.n = new Node(\"Bakso\");\r\n        \r\n        Node tmp = h;\r\n        while(tmp != null) {\r\n            System.out.println(tmp.d);\r\n            tmp = tmp.n;\r\n        }\r\n    }\r\n}', 'Sate\r\nSoto\r\nBakso', 'easy', '2026-05-20 11:43:55', '2026-05-20 11:43:55', NULL),
('2e8d994c-5441-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', NULL, 0, 'class Node { int d; Node n; Node(int d){this.d=d;} }\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        Node h = new Node(101);\r\n        h.n = new Node(102);\r\n        h.n.n = new Node(103);\r\n        \r\n        int cari = 102;\r\n        boolean ada = false;\r\n        Node tmp = h;\r\n        while(tmp != null) {\r\n            if(tmp.d == cari) ada = true;\r\n            tmp = tmp.n;\r\n        }\r\n        System.out.println(\"Buku \" + cari + \" Ditemukan: \" + ada);\r\n    }\r\n}', 'Buku 102 Ditemukan: true', 'medium', '2026-05-20 11:43:55', '2026-05-20 11:43:55', NULL),
('2e8da4de-5441-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', NULL, 0, 'class Node { int d; Node n; Node(int d){this.d=d;} }\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        Node h = new Node(1);\r\n        h.n = new Node(2);\r\n        h.n.n = new Node(3);\r\n        \r\n        if(h != null) h = h.n;\r\n        \r\n        while(h != null) {\r\n            System.out.print(h.d + \" \");\r\n            h = h.n;\r\n        }\r\n    }\r\n}', '2 3 ', 'medium', '2026-05-20 11:43:55', '2026-05-20 11:43:55', NULL),
('2e8dad5f-5441-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', NULL, 0, 'class DNode { int d; DNode p, n; DNode(int d){this.d=d;} }\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        DNode n1=new DNode(10), n2=new DNode(20), n3=new DNode(30);\r\n        n1.n=n2; n2.p=n1; n2.n=n3; n3.p=n2;\r\n        \r\n        DNode t = n1;\r\n        while(t.n != null) t = t.n;\r\n        if(t.p != null) t.p.n = null; // hapus ekor\r\n        \r\n        t = n1;\r\n        while(t != null) {\r\n            System.out.print(t.d + \" \");\r\n            t = t.n;\r\n        }\r\n    }\r\n}', '10 20 ', 'medium', '2026-05-20 11:43:55', '2026-05-20 11:43:55', NULL),
('2e8db4c0-5441-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', NULL, 0, 'class Node { String d; Node n; Node(String d){this.d=d;} }\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        Node h = new Node(\"Budi\");\r\n        h.n = new Node(\"Doni\");\r\n        \r\n        Node c = new Node(\"Caca\");\r\n        c.n = h.n;\r\n        h.n = c;\r\n        \r\n        while(h != null) {\r\n            System.out.print(h.d + \" \");\r\n            h = h.n;\r\n        }\r\n    }\r\n}', 'Budi Caca Doni ', 'medium', '2026-05-20 11:43:55', '2026-05-20 11:43:55', NULL),
('2e8dc0a0-5441-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', NULL, 0, 'class Node { int d; Node n; Node(int d){this.d=d;} }\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        Node h = new Node(5000);\r\n        h.n = new Node(10000);\r\n        h.n.n = new Node(15000);\r\n        \r\n        int total = 0;\r\n        Node tmp = h;\r\n        while(tmp != null) {\r\n            total += tmp.d;\r\n            tmp = tmp.n;\r\n        }\r\n        System.out.println(\"Total: \" + total);\r\n    }\r\n}', 'Total: 30000', 'medium', '2026-05-20 11:43:55', '2026-05-20 11:43:55', NULL),
('2e8dccb4-5441-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', NULL, 0, 'class Node { int d; Node n; Node(int d){this.d=d;} }\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        Node h = new Node(80);\r\n        h.n = new Node(95);\r\n        h.n.n = new Node(75);\r\n        \r\n        int maksimum = h.d;\r\n        Node tmp = h.n;\r\n        while(tmp != null) {\r\n            if(tmp.d > maksimum) maksimum = tmp.d;\r\n            tmp = tmp.n;\r\n        }\r\n        System.out.println(\"Maksimum: \" + maksimum);\r\n    }\r\n}', 'Maksimum: 95', 'hard', '2026-05-20 11:43:55', '2026-05-20 11:43:55', NULL),
('2e8dd44c-5441-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', NULL, 0, 'class Node { int d; Node n; Node(int d){this.d=d;} }\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        Node h = new Node(1);\r\n        h.n = new Node(2);\r\n        h.n.n = new Node(3);\r\n        \r\n        Node prev = null, curr = h, next = null;\r\n        while(curr != null) {\r\n            next = curr.n;\r\n            curr.n = prev;\r\n            prev = curr;\r\n            curr = next;\r\n        }\r\n        h = prev;\r\n        \r\n        while(h != null) { System.out.print(h.d + \" \"); h = h.n; }\r\n    }\r\n}', '3 2 1 ', 'hard', '2026-05-20 11:43:55', '2026-05-20 11:43:55', NULL),
('2e8ddb56-5441-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', NULL, 0, 'class DNode { int d; DNode p, n; DNode(int d){this.d=d;} }\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        DNode n1 = new DNode(10), n3 = new DNode(30);\r\n        n1.n = n3; n3.p = n1;\r\n        \r\n        DNode n2 = new DNode(20);\r\n        n2.n = n1.n; // n2.next ke 30\r\n        n2.p = n1;   // n2.prev ke 10\r\n        n1.n.p = n2; // prev dari 30 ke 20\r\n        n1.n = n2;   // next dari 10 ke 20\r\n        \r\n        while(n1 != null) {\r\n            System.out.print(n1.d + \" \");\r\n            n1 = n1.n;\r\n        }\r\n    }\r\n}', '10 20 30 ', 'hard', '2026-05-20 11:43:55', '2026-05-20 11:43:55', NULL),
('2e8de306-5441-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', NULL, 0, 'class Node { int d; Node n; Node(int d){this.d=d;} }\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        Node h = new Node(5); h.n = new Node(10); h.n.n = new Node(15);\r\n        \r\n        Node tmp = h, prev = null;\r\n        int hapus = 10;\r\n        \r\n        while(tmp != null && tmp.d != hapus) {\r\n            prev = tmp;\r\n            tmp = tmp.n;\r\n        }\r\n        if(tmp != null && prev != null) prev.n = tmp.n;\r\n        \r\n        while(h != null) {\r\n            System.out.print(h.d + \" \");\r\n            h = h.n;\r\n        }\r\n    }\r\n}', '5 15 ', 'hard', '2026-05-20 11:43:55', '2026-05-20 11:43:55', NULL),
('2e8de9ca-5441-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', NULL, 0, 'class DNode { char d; DNode p, n; DNode(char d){this.d=d;} }\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        DNode n1=new DNode(\'A\'), n2=new DNode(\'B\'), n3=new DNode(\'A\');\r\n        n1.n=n2; n2.p=n1; n2.n=n3; n3.p=n2;\r\n        \r\n        DNode head = n1, tail = n3;\r\n        boolean isPal = true;\r\n        \r\n        while(head != tail && head.p != tail) {\r\n            if(head.d != tail.d) isPal = false;\r\n            head = head.n;\r\n            tail = tail.p;\r\n        }\r\n        System.out.println(\"Palindrom: \" + isPal);\r\n    }\r\n}', 'Palindrom: true', 'hard', '2026-05-20 11:43:55', '2026-05-20 11:43:55', NULL),
('a2a31706-5538-11f1-b0a2-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', '41328240-54a8-11f1-914b-e4a8dfe60766', 0, 'public class Main {\r\n    static String[] q = new String[10];\r\n    static int f = 0, r = 0, s = 0;\r\n    static void enqueue(String d) { q[r++] = d; s++; }\r\n    public static void main(String[] args) {\r\n        enqueue(\"Rina\");\r\n        enqueue(\"Doni\");\r\n        enqueue(\"Yudi\");\r\n        System.out.println(q[f]);\r\n        System.out.println(s);\r\n    }\r\n}', 'Rina\r\n3', 'easy', '2026-05-21 17:15:16', '2026-05-21 17:15:16', NULL),
('a2a32166-5538-11f1-b0a2-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', '4132be1e-54a8-11f1-914b-e4a8dfe60766', 0, 'public class Main {\r\n    static int[] q = new int[10];\r\n    static int f = 0, r = 0, s = 0;\r\n    static void enqueue(int d) { q[r++] = d; s++; }\r\n    public static void main(String[] args) {\r\n        enqueue(101);\r\n        enqueue(102);\r\n        enqueue(103);\r\n        System.out.println(\"FRONT : \" + q[f]);\r\n        System.out.println(\"REAR  : \" + q[r - 1]);\r\n        System.out.println(\"SIZE  : \" + s);\r\n    }\r\n}', 'FRONT : 101\r\nREAR  : 103\r\nSIZE  : 3', 'easy', '2026-05-21 17:15:16', '2026-05-21 17:15:16', NULL),
('a2a326d9-5538-11f1-b0a2-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', '4132c385-54a8-11f1-914b-e4a8dfe60766', 0, 'import java.util.Scanner;\r\npublic class Main {\r\n    static String[] q = new String[10];\r\n    static int f = 0, r = 0, s = 0;\r\n    static void enqueue(String d) { q[r++] = d; s++; }\r\n    static String isi() {\r\n        String t = \"[\";\r\n        for (int i = f; i < r; i++) { t += q[i]; if (i < r - 1) t += \", \"; }\r\n        return t + \"]\";\r\n    }\r\n    public static void main(String[] args) {\r\n        Scanner sc = new Scanner(System.in);\r\n        for (int i = 0; i < 3; i++) {\r\n            enqueue(sc.nextLine());\r\n            System.out.println(\"Antrian: \" + isi() + \" Ukuran: \" + s);\r\n        }\r\n        sc.close();\r\n    }\r\n}', 'Antrian: [Siti] Ukuran: 1\r\nAntrian: [Siti, Bagas] Ukuran: 2\r\nAntrian: [Siti, Bagas, Citra] Ukuran: 3', 'easy', '2026-05-21 17:15:16', '2026-05-21 17:15:16', NULL),
('a2a32a2d-5538-11f1-b0a2-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', '4132c5c4-54a8-11f1-914b-e4a8dfe60766', 0, 'public class Main {\r\n    static int[] q = new int[10];\r\n    static int f = 0, r = 0, s = 0;\r\n    static void enqueue(int d) { q[r++] = d; s++; }\r\n    static boolean isEmpty() { return s == 0; }\r\n    public static void main(String[] args) {\r\n        System.out.println(isEmpty());\r\n        enqueue(201);\r\n        enqueue(202);\r\n        System.out.println(isEmpty());\r\n        System.out.println(s);\r\n        System.out.println(q[f]);\r\n    }\r\n}', 'true\r\nfalse\r\n2\r\n201', 'easy', '2026-05-21 17:15:16', '2026-05-21 17:15:16', NULL),
('a2a32ce8-5538-11f1-b0a2-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', '4132c7da-54a8-11f1-914b-e4a8dfe60766', 0, 'import java.util.Scanner;\r\npublic class Main {\r\n    static int[] q = new int[10];\r\n    static int f = 0, r = 0, s = 0;\r\n    static void enqueue(int d) { q[r++] = d; s++; }\r\n    public static void main(String[] args) {\r\n        Scanner sc = new Scanner(System.in);\r\n        for (int i = 0; i < 3; i++) enqueue(sc.nextInt());\r\n        System.out.println(\"FRONT  : \" + q[f]);\r\n        System.out.println(\"REAR   : \" + q[r - 1]);\r\n        System.out.println(\"SIZE   : \" + s);\r\n        System.out.println(\"ISEMPTY: \" + (s == 0));\r\n        sc.close();\r\n    }\r\n}', 'FRONT  : 7\r\nREAR   : 9\r\nSIZE   : 3\r\nISEMPTY: false', 'easy', '2026-05-21 17:15:16', '2026-05-21 17:15:16', NULL),
('a2a32fa0-5538-11f1-b0a2-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', '4132cb0f-54a8-11f1-914b-e4a8dfe60766', 0, 'public class Main {\r\n    static String[] q = new String[10];\r\n    static int f = 0, r = 0, s = 0;\r\n    static void enqueue(String d) { q[r++] = d; s++; }\r\n    static String dequeue() { s--; return q[f++]; }\r\n    static String isi() {\r\n        String t = \"[\";\r\n        for (int i = f; i < r; i++) { t += q[i]; if (i < r - 1) t += \", \"; }\r\n        return t + \"]\";\r\n    }\r\n    public static void main(String[] args) {\r\n        enqueue(\"Hendra\"); enqueue(\"Lestari\"); enqueue(\"Miko\");\r\n        String dipanggil = dequeue();\r\n        System.out.println(\"Dipanggil  : \" + dipanggil);\r\n        System.out.println(\"Sisa       : \" + isi());\r\n        System.out.println(\"FRONT baru : \" + q[f]);\r\n        System.out.println(\"SIZE baru  : \" + s);\r\n    }\r\n}', 'Dipanggil  : Hendra\r\nSisa       : [Lestari, Miko]\r\nFRONT baru : Lestari\r\nSIZE baru  : 2', 'medium', '2026-05-21 17:15:16', '2026-05-21 17:15:16', NULL),
('a2a3324f-5538-11f1-b0a2-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', '4132ce14-54a8-11f1-914b-e4a8dfe60766', 0, 'public class Main {\r\n    static int[] q = new int[10];\r\n    static int f = 0, r = 0, s = 0;\r\n    static void enqueue(int d) { q[r++] = d; s++; }\r\n    static int dequeue() { s--; return q[f++]; }\r\n    static boolean isEmpty() { return s == 0; }\r\n    public static void main(String[] args) {\r\n        for (int i = 1; i <= 5; i++) enqueue(i);\r\n        while (!isEmpty()) {\r\n            int pembeli = dequeue();\r\n            System.out.println(\"Dilayani: \" + pembeli + \" Sisa: \" + s);\r\n        }\r\n        System.out.println(\"Antrian telah kosong\");\r\n    }\r\n}', 'Dilayani: 1 Sisa: 4\r\nDilayani: 2 Sisa: 3\r\nDilayani: 3 Sisa: 2\r\nDilayani: 4 Sisa: 1\r\nDilayani: 5 Sisa: 0\r\nAntrian telah kosong', 'medium', '2026-05-21 17:15:16', '2026-05-21 17:15:16', NULL),
('a2a334ee-5538-11f1-b0a2-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', '4132d089-54a8-11f1-914b-e4a8dfe60766', 0, 'import java.util.Scanner;\r\npublic class Main {\r\n    static String[] q = new String[10];\r\n    static int f = 0, r = 0, s = 0;\r\n    static void enqueue(String d) { q[r++] = d; s++; }\r\n    static String dequeue() { s--; return q[f++]; }\r\n    static String isi() {\r\n        String t = \"[\";\r\n        for (int i = f; i < r; i++) { t += q[i]; if (i < r - 1) t += \", \"; }\r\n        return t + \"]\";\r\n    }\r\n    public static void main(String[] args) {\r\n        Scanner sc = new Scanner(System.in);\r\n        enqueue(sc.nextLine()); enqueue(sc.nextLine());\r\n        String a = dequeue();\r\n        enqueue(sc.nextLine());\r\n        String b = dequeue();\r\n        enqueue(sc.nextLine());\r\n        System.out.println(\"a         : \" + a);\r\n        System.out.println(\"b         : \" + b);\r\n        System.out.println(\"Isi akhir : \" + isi());\r\n        System.out.println(\"SIZE      : \" + s);\r\n        sc.close();\r\n    }\r\n}', 'a         : A\r\nb         : B\r\nIsi akhir : [C, D]\r\nSIZE      : 2', 'medium', '2026-05-21 17:15:16', '2026-05-21 17:15:16', NULL),
('a2a338f5-5538-11f1-b0a2-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', '4132d2dd-54a8-11f1-914b-e4a8dfe60766', 0, 'public class Main {\r\n    static int[] q = new int[20]; static int f = 0, r = 0, s = 0;\r\n    static int[] st = new int[20]; static int top = -1;\r\n    static void enqueue(int d) { q[r++] = d; s++; }\r\n    static int dequeue() { s--; return q[f++]; }\r\n    static void push(int d) { st[++top] = d; }\r\n    static int pop() { return st[top--]; }\r\n    static String isi() {\r\n        String t = \"[\";\r\n        for (int i = f; i < r; i++) { t += q[i]; if (i < r - 1) t += \", \"; }\r\n        return t + \"]\";\r\n    }\r\n    public static void main(String[] args) {\r\n        for (int i = 1; i <= 5; i++) enqueue(i);\r\n        System.out.println(\"Sebelum: \" + isi());\r\n        while (s > 0) push(dequeue());\r\n        while (top >= 0) enqueue(pop());\r\n        System.out.println(\"Sesudah: \" + isi());\r\n    }\r\n}', 'Sebelum: [1, 2, 3, 4, 5]\r\nSesudah: [5, 4, 3, 2, 1]', 'medium', '2026-05-21 17:15:16', '2026-05-21 17:15:16', NULL),
('a2a33e5b-5538-11f1-b0a2-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', '4132d4eb-54a8-11f1-914b-e4a8dfe60766', 0, 'import java.util.Scanner;\r\npublic class Main {\r\n    static char[] q = new char[20]; static int f = 0, r = 0, s = 0;\r\n    static char[] st = new char[20]; static int top = -1;\r\n    static void enqueue(char d) { q[r++] = d; s++; }\r\n    static char dequeue() { s--; return q[f++]; }\r\n    static void push(char d) { st[++top] = d; }\r\n    static char pop() { return st[top--]; }\r\n    public static void main(String[] args) {\r\n        Scanner sc = new Scanner(System.in);\r\n        String kata = sc.nextLine();\r\n        for (char c : kata.toCharArray()) { enqueue(c); push(c); }\r\n        boolean isPalindrom = true;\r\n        while (s > 0) if (dequeue() != pop()) isPalindrom = false;\r\n        System.out.println(\"Palindrom: \" + isPalindrom);\r\n        sc.close();\r\n    }\r\n}', 'Palindrom: true', 'medium', '2026-05-21 17:15:16', '2026-05-21 17:15:16', NULL),
('a2a342fc-5538-11f1-b0a2-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', '4132d6e3-54a8-11f1-914b-e4a8dfe60766', 0, 'public class Main {\r\n    static int[] q = new int[20]; static int qf = 0, qr = 0, qs = 0;\r\n    static int[] tmp = new int[20]; static int tf = 0, tr = 0, ts = 0;\r\n    static void enqQ(int d) { q[qr++] = d; qs++; }\r\n    static int deqQ() { qs--; return q[qf++]; }\r\n    static void enqT(int d) { tmp[tr++] = d; ts++; }\r\n    static int deqT() { ts--; return tmp[tf++]; }\r\n    static String isi() {\r\n        String t = \"[\";\r\n        for (int i = qf; i < qr; i++) { t += q[i]; if (i < qr - 1) t += \", \"; }\r\n        return t + \"]\";\r\n    }\r\n    public static void main(String[] args) {\r\n        for (int d : new int[]{11, 22, 33, 44, 55}) enqQ(d);\r\n        int cari = 33; boolean ditemukan = false;\r\n        while (qs > 0) { int e = deqQ(); if (e == cari) ditemukan = true; enqT(e); }\r\n        while (ts > 0) enqQ(deqT());\r\n        System.out.println(\"Ditemukan: \" + ditemukan);\r\n        System.out.println(\"Antrian  : \" + isi());\r\n    }\r\n}', 'Ditemukan: true\r\nAntrian  : [11, 22, 33, 44, 55]', 'hard', '2026-05-21 17:15:16', '2026-05-21 17:15:16', NULL),
('a2a34652-5538-11f1-b0a2-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', '4132d8d2-54a8-11f1-914b-e4a8dfe60766', 0, 'import java.util.Scanner;\r\npublic class Main {\r\n    static int[] q = new int[20]; static int qf = 0, qr = 0, qs = 0;\r\n    static int[] tmp = new int[20]; static int tf = 0, tr = 0, ts = 0;\r\n    static void enqQ(int d) { q[qr++] = d; qs++; }\r\n    static int deqQ() { qs--; return q[qf++]; }\r\n    static void enqT(int d) { tmp[tr++] = d; ts++; }\r\n    static int deqT() { ts--; return tmp[tf++]; }\r\n    static String isi() {\r\n        String t = \"[\";\r\n        for (int i = qf; i < qr; i++) { t += q[i]; if (i < qr - 1) t += \", \"; }\r\n        return t + \"]\";\r\n    }\r\n    public static void main(String[] args) {\r\n        Scanner sc = new Scanner(System.in);\r\n        for (int i = 0; i < 5; i++) enqQ(sc.nextInt());\r\n        int minimum = q[qf];\r\n        while (qs > 0) { int e = deqQ(); if (e < minimum) minimum = e; enqT(e); }\r\n        while (ts > 0) enqQ(deqT());\r\n        System.out.println(\"Minimum: \" + minimum);\r\n        System.out.println(\"Antrian: \" + isi());\r\n        sc.close();\r\n    }\r\n}', 'Minimum: 10\r\nAntrian: [50, 20, 80, 10, 60]', 'hard', '2026-05-21 17:15:16', '2026-05-21 17:15:16', NULL),
('a2a34a35-5538-11f1-b0a2-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', '4132db18-54a8-11f1-914b-e4a8dfe60766', 0, 'import java.util.Scanner;\r\npublic class Main {\r\n    static int[] q = new int[20]; static int qf = 0, qr = 0, qs = 0;\r\n    static int[] tmp = new int[20]; static int tf = 0, tr = 0, ts = 0;\r\n    static void enqQ(int d) { q[qr++] = d; qs++; }\r\n    static int deqQ() { qs--; return q[qf++]; }\r\n    static void enqT(int d) { tmp[tr++] = d; ts++; }\r\n    static int deqT() { ts--; return tmp[tf++]; }\r\n    static String isi() {\r\n        String t = \"[\";\r\n        for (int i = qf; i < qr; i++) { t += q[i]; if (i < qr - 1) t += \", \"; }\r\n        return t + \"]\";\r\n    }\r\n    public static void main(String[] args) {\r\n        Scanner sc = new Scanner(System.in);\r\n        int cari = sc.nextInt();\r\n        for (int d : new int[]{2, 5, 2, 3, 2, 5, 4}) enqQ(d);\r\n        int frekuensi = 0;\r\n        while (qs > 0) { int e = deqQ(); if (e == cari) frekuensi++; enqT(e); }\r\n        while (ts > 0) enqQ(deqT());\r\n        System.out.println(\"Frekuensi \" + cari + \" : \" + frekuensi);\r\n        System.out.println(\"Antrian     : \" + isi());\r\n        sc.close();\r\n    }\r\n}', 'Frekuensi 2 : 3\r\nAntrian     : [2, 5, 2, 3, 2, 5, 4]', 'hard', '2026-05-21 17:15:16', '2026-05-21 17:15:16', NULL),
('a2a34fd8-5538-11f1-b0a2-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', '4132dd2c-54a8-11f1-914b-e4a8dfe60766', 0, 'public class Main {\r\n    static int[] q = new int[20]; static int f = 0, r = 0, s = 0;\r\n    static int[] st = new int[20]; static int top = -1;\r\n    static void enqueue(int d) { q[r++] = d; s++; }\r\n    static int dequeue() { s--; return q[f++]; }\r\n    static void push(int d) { st[++top] = d; }\r\n    static int pop() { return st[top--]; }\r\n    static String isi() {\r\n        String t = \"[\";\r\n        for (int i = f; i < r; i++) { t += q[i]; if (i < r - 1) t += \", \"; }\r\n        return t + \"]\";\r\n    }\r\n    public static void main(String[] args) {\r\n        for (int d : new int[]{301, 302, 303, 304, 305}) enqueue(d);\r\n        int cari = 303; boolean ditemukan = false;\r\n        while (s > 0) { int e = dequeue(); if (e == cari) ditemukan = true; push(e); }\r\n        while (top >= 0) enqueue(pop());\r\n        System.out.println(\"Ditemukan: \" + ditemukan);\r\n        System.out.println(\"Antrian  : \" + isi());\r\n    }\r\n}', 'Ditemukan: true\r\nAntrian  : [305, 304, 303, 302, 301]', 'hard', '2026-05-21 17:15:16', '2026-05-21 17:15:16', NULL),
('a2a354f7-5538-11f1-b0a2-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', '4132e212-54a8-11f1-914b-e4a8dfe60766', 0, 'import java.util.Scanner;\r\npublic class Main {\r\n    static int[] q = new int[20]; static int f = 0, r = 0, s = 0;\r\n    static int[] st = new int[20]; static int top = -1;\r\n    static void enqueue(int d) { q[r++] = d; s++; }\r\n    static int dequeue() { s--; return q[f++]; }\r\n    static void push(int d) { st[++top] = d; }\r\n    static int pop() { return st[top--]; }\r\n    static String isi() {\r\n        String t = \"[\";\r\n        for (int i = f; i < r; i++) { t += q[i]; if (i < r - 1) t += \", \"; }\r\n        return t + \"]\";\r\n    }\r\n    public static void main(String[] args) {\r\n        Scanner sc = new Scanner(System.in);\r\n        for (int i = 0; i < 5; i++) enqueue(sc.nextInt());\r\n        int maksimum = q[f], posisi = 1, index = 1;\r\n        while (s > 0) { int e = dequeue(); if (e > maksimum) { maksimum = e; posisi = index; } push(e); index++; }\r\n        while (top >= 0) enqueue(pop());\r\n        System.out.println(\"Maksimum : \" + maksimum);\r\n        System.out.println(\"Posisi   : \" + posisi);\r\n        System.out.println(\"Antrian  : \" + isi());\r\n        sc.close();\r\n    }\r\n}', 'Maksimum : 95\r\nPosisi   : 4\r\nAntrian  : [80, 95, 60, 90, 75]', 'hard', '2026-05-21 17:15:16', '2026-05-21 17:15:16', NULL),
('b265decb-5437-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', NULL, 0, 'class Node { int d; Node n; Node(int d){this.d=d;} }\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        Node head = new Node(10);\r\n        head.n = new Node(20);\r\n        head.n.n = new Node(30);\r\n        \r\n        System.out.println(\"Depan: \" + head.d);\r\n        System.out.println(\"Belakang: \" + head.n.n.d);\r\n    }\r\n}', 'Depan: 10\r\nBelakang: 30', 'easy', '2026-05-20 10:36:01', '2026-05-20 10:36:01', NULL),
('b2662777-5437-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', NULL, 0, 'class Node { String d; Node n; Node(String d){this.d=d;} }\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        Node h = new Node(\"A\");\r\n        h.n = new Node(\"B\");\r\n        h.n.n = new Node(\"C\");\r\n        \r\n        int count = 0;\r\n        Node tmp = h;\r\n        while(tmp != null) {\r\n            count++;\r\n            tmp = tmp.n;\r\n        }\r\n        System.out.println(\"Jumlah: \" + count);\r\n    }\r\n}', 'Jumlah: 3', 'easy', '2026-05-20 10:36:01', '2026-05-20 10:36:01', NULL),
('b2662d2c-5437-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', NULL, 0, 'class Node { String d; Node n; Node(String d){this.d=d;} }\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        Node h = new Node(\"B\");\r\n        h.n = new Node(\"C\");\r\n        \r\n        Node baru = new Node(\"A\");\r\n        baru.n = h;\r\n        h = baru;\r\n        \r\n        while(h != null) {\r\n            System.out.print(h.d + \" \");\r\n            h = h.n;\r\n        }\r\n    }\r\n}', 'A B C ', 'easy', '2026-05-20 10:36:01', '2026-05-20 10:36:01', NULL),
('b2666495-5437-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', NULL, 0, 'class DNode { String d; DNode p, n; DNode(String d){this.d=d;} }\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        DNode l1 = new DNode(\"Lagu1\");\r\n        DNode l2 = new DNode(\"Lagu2\");\r\n        \r\n        l1.n = l2;\r\n        l2.p = l1;\r\n        \r\n        System.out.println(\"Maju: \" + l1.d + \", \" + l1.n.d);\r\n        System.out.println(\"Mundur: \" + l2.d + \", \" + l2.p.d);\r\n    }\r\n}', 'Maju: Lagu1, Lagu2\r\nMundur: Lagu2, Lagu1', 'easy', '2026-05-20 10:36:01', '2026-05-20 10:36:01', NULL),
('b2666bf1-5437-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', NULL, 0, 'class Node { String d; Node n; Node(String d){this.d=d;} }\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        Node h = new Node(\"Sate\");\r\n        h.n = new Node(\"Soto\");\r\n        h.n.n = new Node(\"Bakso\");\r\n        \r\n        Node tmp = h;\r\n        while(tmp != null) {\r\n            System.out.println(tmp.d);\r\n            tmp = tmp.n;\r\n        }\r\n    }\r\n}', 'Sate\r\nSoto\r\nBakso', 'easy', '2026-05-20 10:36:01', '2026-05-20 10:36:01', NULL),
('b2667090-5437-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', NULL, 0, 'class Node { int d; Node n; Node(int d){this.d=d;} }\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        Node h = new Node(101);\r\n        h.n = new Node(102);\r\n        h.n.n = new Node(103);\r\n        \r\n        int cari = 102;\r\n        boolean ada = false;\r\n        Node tmp = h;\r\n        while(tmp != null) {\r\n            if(tmp.d == cari) ada = true;\r\n            tmp = tmp.n;\r\n        }\r\n        System.out.println(\"Buku \" + cari + \" Ditemukan: \" + ada);\r\n    }\r\n}', 'Buku 102 Ditemukan: true', 'medium', '2026-05-20 10:36:01', '2026-05-20 10:36:01', NULL),
('b2667490-5437-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', NULL, 0, 'class Node { int d; Node n; Node(int d){this.d=d;} }\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        Node h = new Node(1);\r\n        h.n = new Node(2);\r\n        h.n.n = new Node(3);\r\n        \r\n        if(h != null) h = h.n;\r\n        \r\n        while(h != null) {\r\n            System.out.print(h.d + \" \");\r\n            h = h.n;\r\n        }\r\n    }\r\n}', '2 3 ', 'medium', '2026-05-20 10:36:01', '2026-05-20 10:36:01', NULL),
('b26678bb-5437-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', NULL, 0, 'class DNode { int d; DNode p, n; DNode(int d){this.d=d;} }\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        DNode n1=new DNode(10), n2=new DNode(20), n3=new DNode(30);\r\n        n1.n=n2; n2.p=n1; n2.n=n3; n3.p=n2;\r\n        \r\n        DNode t = n1;\r\n        while(t.n != null) t = t.n;\r\n        if(t.p != null) t.p.n = null; // hapus ekor\r\n        \r\n        t = n1;\r\n        while(t != null) {\r\n            System.out.print(t.d + \" \");\r\n            t = t.n;\r\n        }\r\n    }\r\n}', '10 20 ', 'medium', '2026-05-20 10:36:01', '2026-05-20 10:36:01', NULL),
('b2667f3c-5437-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', NULL, 0, 'class Node { String d; Node n; Node(String d){this.d=d;} }\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        Node h = new Node(\"Budi\");\r\n        h.n = new Node(\"Doni\");\r\n        \r\n        Node c = new Node(\"Caca\");\r\n        c.n = h.n;\r\n        h.n = c;\r\n        \r\n        while(h != null) {\r\n            System.out.print(h.d + \" \");\r\n            h = h.n;\r\n        }\r\n    }\r\n}', 'Budi Caca Doni ', 'medium', '2026-05-20 10:36:01', '2026-05-20 10:36:01', NULL),
('b266857e-5437-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', NULL, 0, 'class Node { int d; Node n; Node(int d){this.d=d;} }\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        Node h = new Node(5000);\r\n        h.n = new Node(10000);\r\n        h.n.n = new Node(15000);\r\n        \r\n        int total = 0;\r\n        Node tmp = h;\r\n        while(tmp != null) {\r\n            total += tmp.d;\r\n            tmp = tmp.n;\r\n        }\r\n        System.out.println(\"Total: \" + total);\r\n    }\r\n}', 'Total: 30000', 'medium', '2026-05-20 10:36:01', '2026-05-20 10:36:01', NULL),
('b2668978-5437-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', NULL, 0, 'class Node { int d; Node n; Node(int d){this.d=d;} }\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        Node h = new Node(80);\r\n        h.n = new Node(95);\r\n        h.n.n = new Node(75);\r\n        \r\n        int maksimum = h.d;\r\n        Node tmp = h.n;\r\n        while(tmp != null) {\r\n            if(tmp.d > maksimum) maksimum = tmp.d;\r\n            tmp = tmp.n;\r\n        }\r\n        System.out.println(\"Maksimum: \" + maksimum);\r\n    }\r\n}', 'Maksimum: 95', 'hard', '2026-05-20 10:36:01', '2026-05-20 10:36:01', NULL);
INSERT INTO `bank_soal_konversi` (`id`, `id_level`, `id_soal`, `order`, `jawaban`, `output`, `difficulty`, `created_at`, `updated_at`, `deleted_at`) VALUES
('b2668fb8-5437-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', NULL, 0, 'class Node { int d; Node n; Node(int d){this.d=d;} }\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        Node h = new Node(1);\r\n        h.n = new Node(2);\r\n        h.n.n = new Node(3);\r\n        \r\n        Node prev = null, curr = h, next = null;\r\n        while(curr != null) {\r\n            next = curr.n;\r\n            curr.n = prev;\r\n            prev = curr;\r\n            curr = next;\r\n        }\r\n        h = prev;\r\n        \r\n        while(h != null) { System.out.print(h.d + \" \"); h = h.n; }\r\n    }\r\n}', '3 2 1 ', 'hard', '2026-05-20 10:36:01', '2026-05-20 10:36:01', NULL),
('b26693b8-5437-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', NULL, 0, 'class DNode { int d; DNode p, n; DNode(int d){this.d=d;} }\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        DNode n1 = new DNode(10), n3 = new DNode(30);\r\n        n1.n = n3; n3.p = n1;\r\n        \r\n        DNode n2 = new DNode(20);\r\n        n2.n = n1.n; // n2.next ke 30\r\n        n2.p = n1;   // n2.prev ke 10\r\n        n1.n.p = n2; // prev dari 30 ke 20\r\n        n1.n = n2;   // next dari 10 ke 20\r\n        \r\n        while(n1 != null) {\r\n            System.out.print(n1.d + \" \");\r\n            n1 = n1.n;\r\n        }\r\n    }\r\n}', '10 20 30 ', 'hard', '2026-05-20 10:36:01', '2026-05-20 10:36:01', NULL),
('b266974c-5437-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', NULL, 0, 'class Node { int d; Node n; Node(int d){this.d=d;} }\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        Node h = new Node(5); h.n = new Node(10); h.n.n = new Node(15);\r\n        \r\n        Node tmp = h, prev = null;\r\n        int hapus = 10;\r\n        \r\n        while(tmp != null && tmp.d != hapus) {\r\n            prev = tmp;\r\n            tmp = tmp.n;\r\n        }\r\n        if(tmp != null && prev != null) prev.n = tmp.n;\r\n        \r\n        while(h != null) {\r\n            System.out.print(h.d + \" \");\r\n            h = h.n;\r\n        }\r\n    }\r\n}', '5 15 ', 'hard', '2026-05-20 10:36:01', '2026-05-20 10:36:01', NULL),
('b2669b09-5437-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', NULL, 0, 'class DNode { char d; DNode p, n; DNode(char d){this.d=d;} }\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        DNode n1=new DNode(\'A\'), n2=new DNode(\'B\'), n3=new DNode(\'A\');\r\n        n1.n=n2; n2.p=n1; n2.n=n3; n3.p=n2;\r\n        \r\n        DNode head = n1, tail = n3;\r\n        boolean isPal = true;\r\n        \r\n        while(head != tail && head.p != tail) {\r\n            if(head.d != tail.d) isPal = false;\r\n            head = head.n;\r\n            tail = tail.p;\r\n        }\r\n        System.out.println(\"Palindrom: \" + isPal);\r\n    }\r\n}', 'Palindrom: true', 'hard', '2026-05-20 10:36:01', '2026-05-20 10:36:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `debug_konversi`
--

CREATE TABLE `debug_konversi` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_soal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_soal_konversi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_mahasiswa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_ujian_konversi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `debug` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `guide`
--

CREATE TABLE `guide` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int DEFAULT NULL,
  `judul` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `guide`
--

INSERT INTO `guide` (`id`, `order`, `judul`, `desc`, `img`, `created_at`, `updated_at`, `deleted_at`) VALUES
('31481e71-6186-4bda-8b33-f026cf22e538', 7, '<strong style=\"color: #03346E;\">Rute Belajar</strong>', 'Tiap <strong style=\"color: #000;\">Level</strong> berisi beberapa <strong style=\"color: #000;\">Soal</strong> yang harus dikerjakan<br> \n                        <strong style=\"color: #000;\">secara urut</strong>. Mulai dari soal <strong style=\"color: #F39C12\">Pseudocode</strong> disisi kiri yang berwarna <strong style=\"color: #F39C12\">orange </strong>kemudian dilanjut dengan soal \n                        <strong style=\"color: #03346E;\">Konversi Program</strong> di sisi kanan yang berwarna <strong style=\"color: #03346E;\">biru</strong>.', 'assets/media/guide_image/guide_696d020d23b0a4.46760270.png', '2026-01-18 08:53:49', '2026-01-18 08:53:49', NULL),
('3ac92d5a-02ad-4653-9148-a73678e9e677', 9, '<strong style=\"color: #03346E;\">Arena Ujian Code Program</strong>', 'Ketikan code program sesuai dengan urutan langkah<strong style=\"color: #03346E;\"> algoritma pseudocode!</strong>\n                        lalu klik <strong style=\"color: #03346E;\">“Cek Jawaban”</strong>untuk melihat hasilnya.', 'assets/media/guide_image/guide_696d020d2415c1.97944419.png', '2026-01-18 08:53:49', '2026-01-18 08:53:49', NULL),
('48173a4e-ffb6-446e-ad16-a730eba6a14b', 2, '<strong style=\"color: #03346E;\">Ini arena progres belajarmu!</strong>', 'kamu bisa melihat total poin, badge yang berhasil diraih,<br>peringkatmu di leaderboard, dan jumlah nyawa yang<br>kamu miliki untuk melanjutkan petualangan belajar!!', 'assets/media/guide_image/guide_696d020d230518.59709410.png', '2026-01-18 08:53:49', '2026-01-18 08:53:49', NULL),
('4d7e56d7-b6be-4d67-abeb-944506d8191a', 11, '<strong style=\"color: #03346E;\">Dapatkan Algopoin!</strong>', 'Selesaikan semua soal kemudian dapat <strong style=\"color: #03346E\">Algopoin</strong>', 'assets/media/guide_image/guide_696d020d245c37.55651012.png', '2026-01-18 08:53:49', '2026-01-18 08:53:49', NULL),
('5642e72d-2936-499f-abfa-b052540a84c7', 8, '<strong style=\"color: #03346E;\">Arena Ujian Pseudocode</strong>', 'Susun algoritma dan tipe data yang telah diacak menjadi<br>urutan yang benar! \n                        lalu klik <strong style=\"color: #03346E;\">\"Cek Jawaban\"</strong> untuk melihat hasilnya.', 'assets/media/guide_image/guide_696d020d23dd07.79332895.png', '2026-01-18 08:53:49', '2026-01-18 08:53:49', NULL),
('5b123518-2914-4cab-886a-4bc5f6f0e5f9', 6, '<strong style=\"color: #03346E;\">Buka Kunci Levelmu!</strong>', 'Semua level materi ada di halaman <strong style=\"color: #03346E;\">“Latihan Soal”</strong>\n<br>Setiap level harus dikerjakan berurutan untuk membuka jalan ke level selanjutnya.</p>', 'assets/media/guide_image/guide_696d020d2382e8.54083677.png', '2026-01-18 08:53:49', '2026-01-18 08:53:49', NULL),
('62b76b24-165f-4906-8c16-06f53757f31c', 10, '<strong style=\"color: #03346E;\">Kumpulkan AlgoBadge Sebanyak-banyaknya!</strong>', 'Selesaikan setiap soal dan dapatkan <strong style=\"color: #03346E;\">Algobadge</strong>', 'assets/media/guide_image/guide_696d020d243cc8.35303907.png', '2026-01-18 08:53:49', '2026-01-18 08:53:49', NULL),
('682f0e46-c2ef-4ad6-b8b3-6e002a426125', 1, '<strong style=\"color: #F39C12;\">Selamat Datang,</strong> <strong style=\"color: #03346E;\">di <i>PseudoLearn!</i></strong>', 'Yuk, belajar <strong style=\"color: #03346E;\">algoritma</strong>, <strong style=\"color: #03346E;\">tipe data</strong>, dan <strong style=\"color: #03346E;\">Code Program Java</strong>  dengan cara yang seru dan penuh tantangan!', 'assets/media/guide_image/guide_696d020d2021f1.34553001.png', '2026-01-18 08:53:49', '2026-01-18 08:53:49', NULL),
('740e91f9-4097-411e-af9d-0625bfa22ea9', 13, '<strong style=\"color: #03346E;\">Ayo Naik Peringkat!</strong>', 'Leaderboard dihitung dari <strong style=\"color: #03346E;\">total poin</strong> + <strong style=\"color: #03346E\">total langkah</strong> drag &amp; drop.\n\n<br>\nRaih posisi teratas dengan poin terbanyak dan langkah paling efisien saat menyusun algoritma!.', 'assets/media/guide_image/guide_696d020d24b839.53093515.png', '2026-01-18 08:53:49', '2026-01-18 08:53:49', NULL),
('a3811ec5-0b84-45cb-8cb3-d272fcfce5a6', 3, '<strong style=\"color: #03346E;\">Hati-hati, Nyawamu Terbatas!</strong>', 'Kamu <strong style=\"color: #03346E\">maksimal</strong> memiliki <strong style=\"color: #03346E;\">25</strong> nyawa. Jika nyawamu hangus, satu nyawa akan otomatis kembali setiap 10 menit.', 'assets/media/guide_image/guide_696d020d2328e5.46492530.png', '2026-01-18 08:53:49', '2026-01-18 08:53:49', NULL),
('a6e6ce49-e598-49cd-8092-002bf6848825', 4, '<strong style=\"color: #03346E;\">Isi ulang nyawa dengan cepat!</strong>', 'Mau lebih cepat isi ulang nyawa? Selesaikan misi dan klaim hadiahnya!', 'assets/media/guide_image/guide_696d020d234736.49034051.png', '2026-01-18 08:53:49', '2026-01-18 08:53:49', NULL),
('d0fd25df-2bf8-44b5-a651-157dc08efd31', 5, '<strong style=\"color: #03346E;\">Hati-hati dalam menjawab!</strong>', 'Pikirkan baik-baik sebelum klik <strong style=\"color: #03346E;\">“Cek Jawaban”</strong> karena ketika jawaban salah = 1 nyawa melayang!', 'assets/media/guide_image/guide_696d020d236670.47207810.png', '2026-01-18 08:53:49', '2026-01-18 08:53:49', NULL),
('dfe710a1-3f79-4c39-8960-3069685fc107', 12, 'Lanjut ke Level Selanjutnya!', 'Semua soal berhasil terselesaikan, <strong style=\"color: #03346E\">Level</strong> berikutnya terbuka!', 'assets/media/guide_image/guide_696d020d247ca9.47633164.png', '2026-01-18 08:53:49', '2026-01-18 08:53:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `history_confidence`
--

CREATE TABLE `history_confidence` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_soal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_mahasiswa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_ujian` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_jawaban` int DEFAULT NULL COMMENT '0: salah, 1: benar',
  `status_confidence` int DEFAULT NULL COMMENT '0: tidak yakin, 1: yakin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `history_jawaban`
--

CREATE TABLE `history_jawaban` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_soal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_mahasiswa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `index_tipe_data` int DEFAULT NULL,
  `tipe_data` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `index_algoritma` int DEFAULT NULL,
  `algoritma` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('benar','salah') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `angkatan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `konversi`
--

CREATE TABLE `konversi` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_soal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jawaban` json DEFAULT NULL,
  `output` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bobot` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `difficulty` enum('easy','medium','hard') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `konversi`
--

INSERT INTO `konversi` (`id`, `id_level`, `id_soal`, `jawaban`, `output`, `bobot`, `created_at`, `updated_at`, `deleted_at`, `difficulty`) VALUES
('0199651d-b77a-7329-8b9a-0e5b6b2f16d6', '01995dec-678e-70cf-854a-b25e2c2d0d28', '01995df6-35ed-7363-9d42-578622c3e4f2', '[{\"1\": \"double pajak = 0.1;\"}, {\"2\": \"int harga_motor = 25000000;\"}, {\"3\": \"int uang_bayar;\"}, {\"4\": \"float pajak_jual;\"}, {\"5\": \"pajak_jual = pajak * harga_motor;\"}, {\"6\": \"uang_bayar = harga_motor + pajak_jual;\"}, {\"7\": \"System.out.print(uang_bayar);\"}]', '27500000', 100, '2025-09-20 03:14:30', '2025-10-02 05:41:45', NULL, NULL),
('01996525-5cf1-7256-8f2f-184909a171ff', '01995dec-678e-70cf-854a-b25e2c2d0d28', '01995e0a-74d3-73fa-895b-cfe6f4ec6ab6', '[{\"1\": \"int harga_dasar;\"}, {\"2\": \"float persentase_pajak;\"}, {\"3\": \"int harga_akhir;\"}, {\"4\": \"float nilai_pajak;\"}, {\"5\": \"harga_dasar = 85000;\"}, {\"6\": \"persentase_pajak = 0.1;\"}, {\"7\": \"nilai_pajak = harga_dasar * persentase_pajak;\"}, {\"8\": \"harga_akhir = harga_dasar + nilai_pajak;\"}, {\"9\": \"System.out.print(\\\"Harga akhir setelah pajak: Rp\\\" + harga_akhir);\"}]', 'Harga akhir setelah pajak: Rp93500', 100, '2025-09-20 03:22:51', '2025-10-02 05:40:16', NULL, NULL),
('0199652a-ab5d-7201-b71c-3e984cfd80f4', '01995dec-678e-70cf-854a-b25e2c2d0d28', '01995e1e-b10a-70d3-8210-d2eee6fe2807', '[{\"1\": \"int panjang = 10;\"}, {\"2\": \"int lebar = 6;\"}, {\"3\": \"float tinggi = 1.5f;\"}, {\"4\": \"double luas_bagian;\"}, {\"5\": \"luas_bagian = 2 * ((panjang * lebar) + (panjang * tinggi) + (lebar * tinggi));\"}, {\"6\": \"System.out.println(\\\"Luas Bagian: \\\" +luas_bagian);\"}]', 'Luas Bagian: 168.0', 100, '2025-09-20 03:28:39', '2025-10-02 05:35:45', NULL, NULL),
('01996533-c470-7186-8aff-58267983f830', '01995dec-678e-70cf-854a-b25e2c2d0d28', '01995e24-1a61-73eb-b623-a0220a69532e', '[{\"1\": \"int panjang = 20;\"}, {\"2\": \"int lebar = 20;\"}, {\"3\": \"int tinggi = 7;\"}, {\"4\": \"long volume;\"}, {\"5\": \"System.out.println(\\\"Panjang: \\\" + panjang + \\\", Lebar: \\\" + lebar + \\\", Tinggi: \\\" + tinggi);\"}, {\"6\": \"volume = panjang * lebar * tinggi;\"}, {\"7\": \"System.out.println(\\\"Volume setiap box nasi sebesar: \\\" + volume);\"}]', 'Panjang: 20, Lebar: 20, Tinggi: 7\r\nVolume setiap box nasi sebesar: 2800', 100, '2025-09-20 03:38:35', '2025-09-22 07:16:45', NULL, NULL),
('0199653d-66d4-7335-bfdc-34bd3f31837d', '01995dec-678e-70cf-854a-b25e2c2d0d28', '01995e27-3c16-7365-be30-b2fed20f53a2', '[{\"1\": \"int r = 42;\"}, {\"2\": \"float phi = 3.14f;\"}, {\"3\": \"double taman_bunga;\"}, {\"4\": \"System.out.println(\\\"Jari-jari: \\\" + r + \\\", phi: \\\" + phi);\"}, {\"5\": \"taman_bunga = 0.5 * (phi * r * r);\"}, {\"6\": \"System.out.println(\\\"Luas dari taman bunga sebesar: \\\" + taman_bunga);\"}]', 'Jari-jari: 42, phi: 3.14\r\nLuas dari taman bunga sebesar: 2769.47998046875', 100, '2025-09-20 03:49:06', '2025-10-02 05:31:18', NULL, NULL),
('01996543-dbbf-73ec-b0d6-ff48905b627a', '01995e0c-9825-73b3-b94f-2ae0542eabef', '01995e2b-056e-716f-a01a-2794060829e0', '[{\"1\": \"int age;\"}, {\"2\": \"age = 17;\"}, {\"3\": \"if(age >= 16) {\"}, {\"4\": \"System.out.println(\\\"Anda dapat melanjutkan tes pembuatan SIM\\\");\"}, {\"5\": \"} else {\"}, {\"6\": \"System.out.println(\\\"Anda tidak dapat melanjutkan tes pembuatan SIM\\\");\"}, {\"7\": \"}\"}]', 'Anda dapat melanjutkan tes pembuatan SIM', 100, '2025-09-20 03:56:10', '2025-10-02 06:13:39', NULL, NULL),
('019966b3-d61f-733a-be06-733c496cdacc', '01995e0c-9825-73b3-b94f-2ae0542eabef', '0199656f-eb1f-70c7-b952-1825aa45f75c', '[{\"1\": \"float ipk;\"}, {\"2\": \"int toefl;\"}, {\"3\": \"int attitude;\"}, {\"4\": \"ipk = 3.5;\"}, {\"5\": \"toefl = 480;\"}, {\"6\": \"attitude = 75;\"}, {\"7\": \"if (ipk >= 3.5 && toefl >= 450) {\"}, {\"8\": \"if (attitude >= 60 && attitude <= 100) {\"}, {\"9\": \"System.out.print(\\\"Pelamar dinyatakan lolos seleksi administrasi\\\");\"}, {\"10\": \"} else {\"}, {\"11\": \"System.out.print(\\\"Pelamar dinyatakan tidak lolos seleksi administrasi\\\");\"}, {\"12\": \"}\"}, {\"13\": \"} else if (ipk >= 3.4 && toefl >= 400 && attitude >= 80 && attitude <= 100) {\"}, {\"14\": \"System.out.print(\\\"Pelamar dinyatakan lolos bersyarat seleksi administrasi\\\");\"}, {\"15\": \"} else {\"}, {\"16\": \"System.out.print(\\\"Pelamar dinyatakan tidak lolos seleksi administrasi\\\");\"}, {\"17\": \"}\"}]', 'Pelamar dinyatakan lolos seleksi administrasi', 100, '2025-09-20 10:38:05', '2025-10-02 06:12:00', NULL, NULL),
('019966d2-47f3-70f0-9024-24da44ca3981', '01995e0c-9825-73b3-b94f-2ae0542eabef', '0199657d-34ff-739e-bfef-e842ea2e57d3', '[{\"1\": \"String member_card;\"}, {\"2\": \"int tot_belanja;\"}, {\"3\": \"float diskon;\"}, {\"4\": \"int bayar;\"}, {\"5\": \"tot_belanja = 300000;\"}, {\"6\": \"member_card = \\\"ya\\\";\"}, {\"7\": \"if (member_card.equalsIgnoreCase(\\\"ya\\\")) {\"}, {\"8\": \"if (tot_belanja > 500000) {\"}, {\"9\": \"System.out.println(\\\"diskon 10%\\\");\"}, {\"10\": \"} else if (tot_belanja >= 251000 && tot_belanja <= 500000) {\"}, {\"11\": \"System.out.println(\\\"diskon 5%\\\");\"}, {\"12\": \"} else if (tot_belanja >= 150000 && tot_belanja <= 250000) {\"}, {\"13\": \"System.out.println(\\\"diskon 2%\\\");\"}, {\"14\": \"} else {\"}, {\"15\": \"System.out.println(\\\"diskon 0%\\\");\"}, {\"16\": \"}\"}, {\"17\": \"}\"}]', 'diskon 5%', 100, '2025-09-20 11:11:21', '2025-10-02 05:56:42', NULL, NULL),
('019966e6-b2f8-724f-96d8-d179a6452519', '01995e0c-9825-73b3-b94f-2ae0542eabef', '01996581-d9fc-7116-ac8c-a860cd1b79bd', '[{\"1\": \"int age;\"}, {\"2\": \"age = 18;\"}, {\"3\": \"if (age >= 13 && age <= 16) {\"}, {\"4\": \"System.out.println(\\\"Anda hanya dapat menonton film dengan label Semua Umur (SU)\\\");\"}, {\"5\": \"} else if (age >= 17 && age <= 20) {\"}, {\"6\": \"System.out.println(\\\"Anda dapat menonton film dengan label Semua Umur (SU) dan 17+\\\");\"}, {\"7\": \"} else if (age >= 21) {\"}, {\"8\": \"System.out.println(\\\"Anda dapat menonton film dengan label semua jenis film\\\");\"}, {\"9\": \"} else {\"}, {\"10\": \"System.out.println(\\\"Anda tidak memenuhi kriteria untuk menonton film\\\");\"}, {\"11\": \"}\"}]', 'Anda dapat menonton film dengan label Semua Umur (SU) dan 17+', 100, '2025-09-20 11:33:39', '2025-10-02 05:49:41', NULL, NULL),
('019966ee-b434-7202-b50f-08820a2db7c3', '01995e0c-9825-73b3-b94f-2ae0542eabef', '01996586-e110-71b7-9507-6b306ef78d5e', '[{\"1\": \"int a, b, c;\"}, {\"2\": \"a = 10;\"}, {\"3\": \"b = 20;\"}, {\"4\": \"c = 15;\"}, {\"5\": \"if (a > b && a > c) {\"}, {\"6\": \"System.out.println(\\\"angka a = \\\" + a + \\\" lebih besar\\\");\"}, {\"7\": \"} else if (b > c) {\"}, {\"8\": \"System.out.println(\\\"angka b = \\\" + b + \\\" lebih besar\\\");\"}, {\"9\": \"} else {\"}, {\"10\": \"System.out.println(\\\"angka c = \\\" + c + \\\" lebih besar\\\");\"}, {\"11\": \"}\"}]', 'angka b = 20 lebih besar', 100, '2025-09-20 11:42:23', '2025-10-02 05:46:50', NULL, NULL),
('01996701-587b-716d-8987-f42601e1a3e5', '01985f44-f662-72f9-a85b-a7b256942492', '019965b3-5dc1-733a-96f3-167263ed3ac1', '[{\"1\": \"double[] stackSetoran = new double[100];\"}, {\"2\": \"double setoran;\"}, {\"3\": \"int top;\"}, {\"4\": \"String jawaban;\"}, {\"5\": \"setoran = 3500000;\"}, {\"6\": \"top = -1;\"}, {\"7\": \"if (setoran > 3000000) {\"}, {\"8\": \"System.out.println(\\\"Ingin menambah setoran? (ya/tidak)\\\");\"}, {\"9\": \"jawaban = \\\"ya\\\";\"}, {\"10\": \"if (jawaban.equalsIgnoreCase(\\\"ya\\\")) {\"}, {\"11\": \"stackSetoran[++top] = setoran;\"}, {\"12\": \"}\"}, {\"13\": \"}\"}, {\"14\": \"System.out.println(\\\"Jumlah setoran: \\\" + setoran);\"}]', 'Ingin menambah setoran? (ya/tidak)\r\nJumlah setoran: 3500000.0', 100, '2025-09-20 12:02:45', '2025-10-03 12:14:33', NULL, NULL),
('01996704-a269-7143-91cb-b94885954cf0', '01985f44-f662-72f9-a85b-a7b256942492', '01996594-b7ae-7084-a4b6-fef776832975', '[{\"1\": \"char[] stackPiring = new char[100];\"}, {\"2\": \"char piring;\"}, {\"3\": \"int top;\"}, {\"4\": \"piring = \'A\';\"}, {\"5\": \"top = -1;\"}, {\"6\": \"stackPiring[++top] = piring;\"}, {\"7\": \"piring = stackPiring[top--];\"}, {\"8\": \"System.out.println(\\\"Piring siap dipakai: \\\" + piring);\"}]', 'Piring siap dipakai: A', 100, '2025-09-20 12:06:21', '2025-10-03 14:12:37', NULL, NULL),
('0199670c-056e-727c-a34c-557719e99338', '01985f44-f662-72f9-a85b-a7b256942492', '019965a5-6b5d-7016-88a8-1c825dcd3a97', '[{\"1\": \"String[] stackBarang = new String[100];\"}, {\"2\": \"float berat;\"}, {\"3\": \"String namaBarang;\"}, {\"4\": \"String jawaban;\"}, {\"5\": \"int top;\"}, {\"6\": \"berat = 35;\"}, {\"7\": \"top = -1;\"}, {\"8\": \"if (berat > 30) {\"}, {\"9\": \"System.out.println(\\\"Ada barang tambahan? (ya/tidak)\\\");\"}, {\"10\": \"jawaban = \\\"ya\\\";\"}, {\"11\": \"if (jawaban.equalsIgnoreCase(\\\"ya\\\")) {\"}, {\"12\": \"namaBarang = \\\"Meja\\\";\"}, {\"13\": \"stackBarang[++top] = namaBarang;\"}, {\"14\": \"}\"}, {\"15\": \"}\"}, {\"16\": \"System.out.println(\\\"Berat barang: \\\" + berat);\"}]', 'Ada barang tambahan? (ya/tidak)\r\nBerat barang: 35.0', 100, '2025-09-20 12:14:25', '2025-10-03 14:10:19', NULL, NULL),
('0199670f-ce53-71d6-93a3-0d9f17529207', '01985f44-f662-72f9-a85b-a7b256942492', '019965aa-adc2-73b8-b977-79ce500534db', '[{\"1\": \"String[] stackMakanan = new String[100];\"}, {\"2\": \"String makanan;\"}, {\"3\": \"int jumlahMakanan;\"}, {\"4\": \"int top;\"}, {\"5\": \"makanan = \\\"Nasi Goreng\\\";\"}, {\"6\": \"jumlahMakanan = 6;\"}, {\"7\": \"top = -1;\"}, {\"8\": \"if (jumlahMakanan > 5) {\"}, {\"9\": \"stackMakanan[++top] = makanan;\"}, {\"10\": \"System.out.println(\\\"Makanan yang dihidangkan: \\\" + stackMakanan[top--]);\"}, {\"11\": \"} else {\"}, {\"12\": \"stackMakanan[++top] = makanan;\"}, {\"13\": \"}\"}]', 'Makanan yang dihidangkan: Nasi Goreng', 100, '2025-09-20 12:18:33', '2025-10-03 13:51:39', NULL, NULL),
('01996724-a8fc-72d5-9780-8d3002c46060', '01985f44-f662-72f9-a85b-a7b256942492', '0199671f-15f6-7101-a4c4-2f9227cb03e2', '[{\"1\": \"String[] rakDokumen = new String[100]; int top = -1;\"}, {\"2\": \"String dokumen;\"}, {\"3\": \"dokumen = \\\"Surat_Keuangan.pdf\\\";\"}, {\"4\": \"if (top >= 0) {\"}, {\"5\": \"String dokumenKeluar = rakDokumen[top--];\"}, {\"6\": \"System.out.println(\\\"Dokumen yang dikeluarkan: \\\" + dokumenKeluar);\"}, {\"7\": \"System.out.print(\\\"Sisa dokumen di rak: \\\"); for (int i=0;i<=top;i++) System.out.print(rakDokumen[i]+\\\" \\\");\"}, {\"8\": \"} else {\"}, {\"9\": \"System.out.println(\\\"Rak kosong, tidak ada dokumen yang bisa dikeluarkan\\\");\"}, {\"10\": \"}\"}]', 'Rak kosong, tidak ada dokumen yang bisa dikeluarkan', 100, '2025-09-20 12:41:19', '2025-10-03 11:43:39', NULL, NULL),
('01996747-6c58-73fb-8924-a720f71da756', '01995e0d-85fe-7041-8c7e-cdfbc81bf1ed', '01996744-c306-7298-beec-4f93e45cfa06', '[{\"1\": \"int bilangan;\"}, {\"2\": \"int kelipatan;\"}, {\"3\": \"bilangan = 10;\"}, {\"4\": \"kelipatan = 2;\"}, {\"5\": \"for (int i = 1; i <= bilangan; i += kelipatan) {\"}, {\"6\": \"for (int j = 0; j < i; j++) System.out.print(\\\"*\\\"); System.out.println();\"}, {\"7\": \"}\"}]', '*\r\n***\r\n*****\r\n*******\r\n*********', 100, '2025-09-20 13:19:18', '2025-10-02 06:55:57', NULL, NULL),
('01996a97-0b6a-7046-a8ef-5b29c3be2014', '01995e0d-85fe-7041-8c7e-cdfbc81bf1ed', '0199674b-b207-71ea-b22e-cf9973f75db4', '[{\"1\": \"int nomor;\"}, {\"2\": \"int faktorial;\"}, {\"3\": \"nomor = 5;\"}, {\"4\": \"faktorial = 1;\"}, {\"5\": \"for (int i = 1; i <= nomor; i++) {\"}, {\"6\": \"faktorial *= i;\"}, {\"7\": \"}\"}, {\"8\": \"System.out.println(\\\"Faktorial dari \\\" + nomor + \\\" adalah \\\" + faktorial);\"}]', 'Faktorial dari 5 adalah 120', 100, '2025-09-21 04:45:07', '2025-10-02 06:54:39', NULL, NULL),
('01996a99-5160-70fe-a8cd-72263c141e38', '01995e0d-85fe-7041-8c7e-cdfbc81bf1ed', '0199674e-e634-718b-beaf-d8f0d57de3f5', '[{\"1\": \"String kata;\"}, {\"2\": \"kata = \\\"Politeknik Negeri Malang\\\";\"}, {\"3\": \"for (int i = 0; i < 5; i++) {\"}, {\"4\": \"System.out.println(kata);\"}, {\"5\": \"}\"}]', 'Politeknik Negeri Malang\r\nPoliteknik Negeri Malang\r\nPoliteknik Negeri Malang\r\nPoliteknik Negeri Malang\r\nPoliteknik Negeri Malang', 100, '2025-09-21 04:47:36', '2025-10-02 06:53:42', NULL, NULL),
('01996a9f-8855-7201-b109-d7c5eea4128a', '01995e0d-85fe-7041-8c7e-cdfbc81bf1ed', '01996753-90ea-7040-bb5c-7cd7ab5e6078', '[{\"1\": \"int n;\"}, {\"2\": \"int fib0, fib1, fib2;\"}, {\"3\": \"n = 50;\"}, {\"4\": \"fib0 = 0;\"}, {\"5\": \"fib1 = 1;\"}, {\"6\": \"System.out.print(fib0 + \\\" \\\" + fib1);\"}, {\"7\": \"while (true) {\"}, {\"8\": \"fib2 = fib0 + fib1;\"}, {\"9\": \"if (fib2 >= n) break;\"}, {\"10\": \"System.out.print(\\\" \\\" + fib2);\"}, {\"11\": \"fib0 = fib1;\"}, {\"12\": \"fib1 = fib2;\"}, {\"13\": \"}\"}]', '0 1 1 2 3 5 8 13 21 34', 100, '2025-09-21 04:54:24', '2025-10-02 06:50:01', NULL, NULL),
('01996aa5-6f72-735e-90c2-3b5942c44435', '01995e0d-85fe-7041-8c7e-cdfbc81bf1ed', '01996757-a7b5-72e7-ae2c-c91194f3357d', '[{\"1\": \"int[] deret = new int[8];\"}, {\"2\": \"int jumlahDeret = 0;\"}, {\"3\": \"deret[0] = 1;\"}, {\"4\": \"for (int i = 1; i < 8; i++) {\"}, {\"5\": \"deret[i] = deret[i-1] * 2;\"}, {\"6\": \"jumlahDeret += deret[i];\"}, {\"7\": \"}\"}, {\"8\": \"for (int i = 0; i < 8; i++) System.out.print(deret[i] + \\\" \\\");\"}, {\"9\": \"System.out.println(\\\"\\\\nJumlah seluruh elemen dalam deret: \\\" + jumlahDeret);\"}]', '1 2 4 8 16 32 64 128 \r\nJumlah seluruh elemen dalam deret: 254', 100, '2025-09-21 05:00:50', '2025-10-02 06:22:24', NULL, NULL),
('01996aaa-63bd-7318-8b26-d7abf296e78e', '01995e0d-85fe-7041-8c7e-cdfbc81bf1ed', '0199675d-4c17-7287-8ac8-1fae60417c7e', '[{\"1\": \"int n;\"}, {\"2\": \"char c;\"}, {\"3\": \"n = 51;\"}, {\"4\": \"for (int i = 0; i <= n; i++) {\"}, {\"5\": \"System.out.println(\\\"Nilai \\\" + i + \\\" memiliki keluaran karakter : \\\" + (char)i);\"}, {\"6\": \"if (Character.isLowerCase((char)i)) {\"}, {\"7\": \"System.out.println(\\\"Huruf kecil\\\");\"}, {\"8\": \"}\"}, {\"9\": \"}\"}]', 'Nilai 0 memiliki keluaran karakter : \0\r\nNilai 1 memiliki keluaran karakter : \r\nNilai 2 memiliki keluaran karakter : \r\nNilai 3 memiliki keluaran karakter : \r\nNilai 4 memiliki keluaran karakter : \r\nNilai 5 memiliki keluaran karakter : \r\nNilai 6 memiliki keluaran karakter : \r\nNilai 7 memiliki keluaran karakter : \r\nNilai 8 memiliki keluaran karakter : \r\nNilai 9 memiliki keluaran karakter : 	\r\nNilai 10 memiliki keluaran karakter : \r\n\r\nNilai 11 memiliki keluaran karakter : \r\nNilai 12 memiliki keluaran karakter : \r\nNilai 13 memiliki keluaran karakter : \r\nNilai 14 memiliki keluaran karakter : \r\nNilai 15 memiliki keluaran karakter : \r\nNilai 16 memiliki keluaran karakter : \r\nNilai 17 memiliki keluaran karakter : \r\nNilai 18 memiliki keluaran karakter : \r\nNilai 19 memiliki keluaran karakter : \r\nNilai 20 memiliki keluaran karakter : \r\nNilai 21 memiliki keluaran karakter : \r\nNilai 22 memiliki keluaran karakter : \r\nNilai 23 memiliki keluaran karakter : \r\nNilai 24 memiliki keluaran karakter : \r\nNilai 25 memiliki keluaran karakter : \r\nNilai 26 memiliki keluaran karakter : \Z\r\nNilai 27 memiliki keluaran karakter : \r\nNilai 28 memiliki keluaran karakter : \r\nNilai 29 memiliki keluaran karakter : \r\nNilai 30 memiliki keluaran karakter : \r\nNilai 31 memiliki keluaran karakter : \r\nNilai 32 memiliki keluaran karakter :  \r\nNilai 33 memiliki keluaran karakter : !\r\nNilai 34 memiliki keluaran karakter : \"\r\nNilai 35 memiliki keluaran karakter : #\r\nNilai 36 memiliki keluaran karakter : $\r\nNilai 37 memiliki keluaran karakter : %\r\nNilai 38 memiliki keluaran karakter : &\r\nNilai 39 memiliki keluaran karakter : \'\r\nNilai 40 memiliki keluaran karakter : (\r\nNilai 41 memiliki keluaran karakter : )\r\nNilai 42 memiliki keluaran karakter : *\r\nNilai 43 memiliki keluaran karakter : +\r\nNilai 44 memiliki keluaran karakter : ,\r\nNilai 45 memiliki keluaran karakter : -\r\nNilai 46 memiliki keluaran karakter : .\r\nNilai 47 memiliki keluaran karakter : /\r\nNilai 48 memiliki keluaran karakter : 0\r\nNilai 49 memiliki keluaran karakter : 1\r\nNilai 50 memiliki keluaran karakter : 2\r\nNilai 51 memiliki keluaran karakter : 3', 100, '2025-09-21 05:06:15', '2025-10-02 06:20:05', NULL, NULL),
('01996aad-b832-7227-8990-58efa5105310', '01995e0d-85fe-7041-8c7e-cdfbc81bf1ed', '01996760-3a58-7095-bfb0-d05466e817c5', '[{\"1\": \"int jumlah_bilangan_asli;\"}, {\"2\": \"int ui;\"}, {\"3\": \"jumlah_bilangan_asli = 5;\"}, {\"4\": \"for (int i = 1; i <= jumlah_bilangan_asli; i++) {\"}, {\"5\": \"ui = 25 * i;\"}, {\"6\": \"System.out.println(\\\"U\\\" + i + \\\" = 25 * \\\" + i + \\\" = \\\" + ui);\"}, {\"7\": \"}\"}]', 'U1 = 25 * 1 = 25\r\nU2 = 25 * 2 = 50\r\nU3 = 25 * 3 = 75\r\nU4 = 25 * 4 = 100\r\nU5 = 25 * 5 = 125', 100, '2025-09-21 05:09:53', '2025-10-02 06:15:18', NULL, NULL),
('01996abc-979d-7187-90fa-068f0f7623c0', '01995e12-4580-7361-b0d1-379bdea0b2b6', '01996765-71ea-7079-8d2d-573093f98e7c', '[{\"1\": \"String warna;\"}, {\"2\": \"String tindakan;\"}, {\"3\": \"warna = \\\"merah\\\";\"}, {\"4\": \"switch (warna) {\"}, {\"5\": \"case \\\"merah\\\":\"}, {\"6\": \"tindakan = \\\"berhenti\\\";\"}, {\"7\": \"break;\"}, {\"8\": \"case \\\"kuning\\\":\"}, {\"9\": \"tindakan = \\\"hati-hati\\\";\"}, {\"10\": \"break;\"}, {\"11\": \"case \\\"hijau\\\":\"}, {\"12\": \"tindakan = \\\"jalan\\\";\"}, {\"13\": \"break;\"}, {\"14\": \"default:\"}, {\"15\": \"tindakan = \\\"warna yang anda inputkan salah\\\";\"}, {\"16\": \"break;\"}, {\"17\": \"}\"}, {\"18\": \"System.out.println(\\\"Tindakan : \\\" +tindakan);\"}]', 'Tindakan : berhenti', 100, '2025-09-21 05:26:08', '2025-10-02 07:05:20', NULL, NULL),
('01996ad8-b320-7381-876b-aa1a114fd72e', '01985f44-f662-72f9-a85b-a7b256942492', '01996acc-ed8f-7078-84c5-e827079e6360', '[{\"1\": \"int desimal;\"}, {\"2\": \"int sisa;\"}, {\"3\": \"int[] stackBiner = new int[32];\"}, {\"4\": \"int bit;\"}, {\"5\": \"int top;\"}, {\"6\": \"desimal = 60;\"}, {\"7\": \"stackBiner = new int[32];\"}, {\"8\": \"top = -1;\"}, {\"9\": \"while (desimal > 0) {\"}, {\"10\": \"sisa = desimal % 2;\"}, {\"11\": \"stackBiner[++top] = sisa;\"}, {\"12\": \"desimal = desimal / 2;\"}, {\"13\": \"}\"}, {\"14\": \"while (top >= 0) {\"}, {\"15\": \"bit = stackBiner[top--];\"}, {\"16\": \"System.out.print(bit);\"}, {\"17\": \"}\"}]', '111100', 100, '2025-09-21 05:56:50', '2025-10-03 11:32:14', NULL, NULL),
('01996b0f-8f47-705a-9242-fc0f5c0c9b73', '01995e13-29af-7010-8995-1a40e4504851', '01996ac8-52d1-7171-9a2e-5455ae83c2b1', '[{\"1\": \"int[] nilai;\"}, {\"2\": \"int total_sum;\"}, {\"3\": \"nilai = new int[]{20,5,25,8,3};\"}, {\"4\": \"for (int i = 0; i < nilai.length; i++) {\"}, {\"5\": \"System.out.println(\\\"Elemen ke-\\\" + i + \\\": \\\" + nilai[i]);\"}, {\"6\": \"}\"}, {\"7\": \"total_sum = 0;\"}, {\"8\": \"for (int num : nilai) {\"}, {\"9\": \"total_sum += num;\"}, {\"10\": \"}\"}, {\"11\": \"System.out.println(\\\"Jumlah semua elemen pada array adalah: \\\" + total_sum);\"}]', 'Elemen ke-0: 20\r\nElemen ke-1: 5\r\nElemen ke-2: 25\r\nElemen ke-3: 8\r\nElemen ke-4: 3\r\nJumlah semua elemen pada array adalah: 61', 100, '2025-09-21 06:56:45', '2025-10-03 11:04:45', NULL, NULL),
('01996b11-98ee-7029-b142-4cf33b01572f', '01995e13-29af-7010-8995-1a40e4504851', '01996adc-1108-70fc-b2c8-3a9836158a03', '[{\"1\": \"String[] artis;\"}, {\"2\": \"artis = new String[]{\\\"Suzy\\\", \\\"Song Hye Kyo\\\", \\\"Lee Minho\\\", \\\"Yoona\\\", \\\"Junho\\\"};\"}, {\"3\": \"for (int i = 0; i < artis.length; i++) {\"}, {\"4\": \"System.out.println(\\\"Indeks \\\" + i + \\\": \\\" + artis[i]);\"}, {\"5\": \"}\"}]', 'Indeks 0: Suzy\r\nIndeks 1: Song Hye Kyo\r\nIndeks 2: Lee Minho\r\nIndeks 3: Yoona\r\nIndeks 4: Junho', 100, '2025-09-21 06:58:59', '2025-10-03 11:03:57', NULL, NULL),
('01996b17-97c2-73c3-a534-81fe0339d9b7', '01995e13-29af-7010-8995-1a40e4504851', '01996adf-b46d-73b2-8cdc-434273bd18c8', '[{\"1\": \"int[] array;\"}, {\"2\": \"int elemen;\"}, {\"3\": \"array = new int[]{1, 3, 5, 7, 9, 11, 13};\"}, {\"4\": \"for (int i = 0; i < array.length; i++) {\"}, {\"5\": \"elemen = array[i];\"}, {\"6\": \"System.out.print(elemen);\"}, {\"7\": \"}\"}]', '135791113', 100, '2025-09-21 07:05:32', '2025-10-03 11:02:54', NULL, NULL),
('01996b1d-e0cf-7010-ae19-8acf31408870', '01995e13-29af-7010-8995-1a40e4504851', '01996ae3-7692-722e-b457-fff0ed70eecf', '[{\"1\": \"int[] bilangan;\"}, {\"2\": \"int jumlah_bilangan;\"}, {\"3\": \"int total_nilai;\"}, {\"4\": \"float rata_rata;\"}, {\"5\": \"bilangan = new int[]{10, 11, 12, 13, 14, 15};\"}, {\"6\": \"jumlah_bilangan = bilangan.length;\"}, {\"7\": \"total_nilai = 0;\"}, {\"8\": \"for (int n : bilangan) {\"}, {\"9\": \"total_nilai += n;\"}, {\"10\": \"}\"}, {\"11\": \"rata_rata = (double) total_nilai / jumlah_bilangan;\"}, {\"12\": \"System.out.println(\\\"Bilangan:\\\");\"}, {\"13\": \"for (int n : bilangan) {\"}, {\"14\": \"System.out.print(n + \\\" \\\");\"}, {\"15\": \"}\"}, {\"16\": \"System.out.println(\\\"Jumlah bilangan: \\\" + jumlah_bilangan);\"}, {\"17\": \"System.out.println(\\\"Total nilai: \\\" + total_nilai);\"}, {\"18\": \"System.out.println(\\\"Rata-rata: \\\" + rata_rata);\"}]', 'Bilangan:\r\n10 11 12 13 14 15 Jumlah bilangan: 6\r\nTotal nilai: 75\r\nRata-rata: 12.5', 100, '2025-09-21 07:12:24', '2025-10-03 10:48:19', NULL, NULL),
('01996b22-3878-7083-bc02-833d42743a3e', '01995e13-29af-7010-8995-1a40e4504851', '01996ae7-0dd8-723c-b978-0f3bae73aaa1', '[{\"1\": \"int[] bilangan;\"}, {\"2\": \"int nilai_max;\"}, {\"3\": \"int nilai_min;\"}, {\"4\": \"bilangan = new int[]{1,2,3,4,5,6,7,8,9,10};\"}, {\"5\": \"nilai_max = bilangan[0];\"}, {\"6\": \"nilai_min = bilangan[0];\"}, {\"7\": \"for(int i = 1; i < bilangan.length; i++) {\"}, {\"8\": \"if(bilangan[i] > nilai_max) nilai_max = bilangan[i];\"}, {\"9\": \"if(bilangan[i] < nilai_min) nilai_min = bilangan[i];\"}, {\"10\": \"}\"}, {\"11\": \"System.out.println(\\\"Bilangan: \\\" + java.util.Arrays.toString(bilangan));\"}, {\"12\": \"System.out.println(\\\"Nilai maksimum: \\\" + nilai_max);\"}, {\"13\": \"System.out.println(\\\"Nilai minimum: \\\" + nilai_min);\"}]', 'Bilangan: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]\r\nNilai maksimum: 10\r\nNilai minimum: 1', 100, '2025-09-21 07:17:08', '2025-10-03 02:16:41', NULL, NULL),
('4d943c82-54a8-11f1-914b-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', '41328240-54a8-11f1-914b-e4a8dfe60766', '[{\"1\": \"public class Main {\"}, {\"2\": \"    static String[] q = new String[10];\"}, {\"3\": \"    static int f = 0, r = 0, s = 0;\"}, {\"4\": \"    static void enqueue(String d) { q[r++] = d; s++; }\"}, {\"5\": \"    public static void main(String[] args) {\"}, {\"6\": \"        enqueue(\\\"Rina\\\");\"}, {\"7\": \"        enqueue(\\\"Doni\\\");\"}, {\"8\": \"        enqueue(\\\"Yudi\\\");\"}, {\"9\": \"        System.out.println(q[f]);\"}, {\"10\": \"        System.out.println(s);\"}, {\"11\": \"    }\"}, {\"12\": \"}\"}]', 'Rina\r\n3', 100, '2026-05-21 00:02:05', '2026-05-21 00:02:05', NULL, NULL),
('4d945262-54a8-11f1-914b-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', '4132be1e-54a8-11f1-914b-e4a8dfe60766', '[{\"1\": \"public class Main {\"}, {\"2\": \"    static int[] q = new int[10];\"}, {\"3\": \"    static int f = 0, r = 0, s = 0;\"}, {\"4\": \"    static void enqueue(int d) { q[r++] = d; s++; }\"}, {\"5\": \"    public static void main(String[] args) {\"}, {\"6\": \"        enqueue(101);\"}, {\"7\": \"        enqueue(102);\"}, {\"8\": \"        enqueue(103);\"}, {\"9\": \"        System.out.println(\\\"FRONT : \\\" + q[f]);\"}, {\"10\": \"        System.out.println(\\\"REAR  : \\\" + q[r - 1]);\"}, {\"11\": \"        System.out.println(\\\"SIZE  : \\\" + s);\"}, {\"12\": \"    }\"}, {\"13\": \"}\"}]', 'FRONT : 101\r\nREAR  : 103\r\nSIZE  : 3', 100, '2026-05-21 00:02:05', '2026-05-21 00:02:05', NULL, NULL),
('4d947fad-54a8-11f1-914b-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', '4132c385-54a8-11f1-914b-e4a8dfe60766', '[{\"1\": \"import java.util.Scanner;\"}, {\"2\": \"public class Main {\"}, {\"3\": \"    static String[] q = new String[10];\"}, {\"4\": \"    static int f = 0, r = 0, s = 0;\"}, {\"5\": \"    static void enqueue(String d) { q[r++] = d; s++; }\"}, {\"6\": \"    static String isi() {\"}, {\"7\": \"        String t = \\\"[\\\";\"}, {\"8\": \"        for (int i = f; i < r; i++) { t += q[i]; if (i < r - 1) t += \\\", \\\"; }\"}, {\"9\": \"        return t + \\\"]\\\";\"}, {\"10\": \"    }\"}, {\"11\": \"    public static void main(String[] args) {\"}, {\"12\": \"        Scanner sc = new Scanner(System.in);\"}, {\"13\": \"        for (int i = 0; i < 3; i++) {\"}, {\"14\": \"            enqueue(sc.nextLine());\"}, {\"15\": \"            System.out.println(\\\"Antrian: \\\" + isi() + \\\" Ukuran: \\\" + s);\"}, {\"16\": \"        }\"}, {\"17\": \"        sc.close();\"}, {\"18\": \"    }\"}, {\"19\": \"}\"}]', 'Antrian: [Siti] Ukuran: 1\r\nAntrian: [Siti, Bagas] Ukuran: 2\r\nAntrian: [Siti, Bagas, Citra] Ukuran: 3', 100, '2026-05-21 00:02:05', '2026-05-21 00:02:05', NULL, NULL),
('4d9485ee-54a8-11f1-914b-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', '4132c5c4-54a8-11f1-914b-e4a8dfe60766', '[{\"1\": \"public class Main {\"}, {\"2\": \"    static int[] q = new int[10];\"}, {\"3\": \"    static int f = 0, r = 0, s = 0;\"}, {\"4\": \"    static void enqueue(int d) { q[r++] = d; s++; }\"}, {\"5\": \"    static boolean isEmpty() { return s == 0; }\"}, {\"6\": \"    public static void main(String[] args) {\"}, {\"7\": \"        System.out.println(isEmpty());\"}, {\"8\": \"        enqueue(201);\"}, {\"9\": \"        enqueue(202);\"}, {\"10\": \"        System.out.println(isEmpty());\"}, {\"11\": \"        System.out.println(s);\"}, {\"12\": \"        System.out.println(q[f]);\"}, {\"13\": \"    }\"}, {\"14\": \"}\"}]', 'true\r\nfalse\r\n2\r\n201', 100, '2026-05-21 00:02:05', '2026-05-21 00:02:05', NULL, NULL),
('4d948afe-54a8-11f1-914b-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', '4132c7da-54a8-11f1-914b-e4a8dfe60766', '[{\"1\": \"import java.util.Scanner;\"}, {\"2\": \"public class Main {\"}, {\"3\": \"    static int[] q = new int[10];\"}, {\"4\": \"    static int f = 0, r = 0, s = 0;\"}, {\"5\": \"    static void enqueue(int d) { q[r++] = d; s++; }\"}, {\"6\": \"    public static void main(String[] args) {\"}, {\"7\": \"        Scanner sc = new Scanner(System.in);\"}, {\"8\": \"        for (int i = 0; i < 3; i++) enqueue(sc.nextInt());\"}, {\"9\": \"        System.out.println(\\\"FRONT  : \\\" + q[f]);\"}, {\"10\": \"        System.out.println(\\\"REAR   : \\\" + q[r - 1]);\"}, {\"11\": \"        System.out.println(\\\"SIZE   : \\\" + s);\"}, {\"12\": \"        System.out.println(\\\"ISEMPTY: \\\" + (s == 0));\"}, {\"13\": \"        sc.close();\"}, {\"14\": \"    }\"}, {\"15\": \"}\"}]', 'FRONT  : 7\r\nREAR   : 9\r\nSIZE   : 3\r\nISEMPTY: false', 100, '2026-05-21 00:02:05', '2026-05-21 00:02:05', NULL, NULL),
('4d949031-54a8-11f1-914b-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', '4132cb0f-54a8-11f1-914b-e4a8dfe60766', '[{\"1\": \"public class Main {\"}, {\"2\": \"    static String[] q = new String[10];\"}, {\"3\": \"    static int f = 0, r = 0, s = 0;\"}, {\"4\": \"    static void enqueue(String d) { q[r++] = d; s++; }\"}, {\"5\": \"    static String dequeue() { s--; return q[f++]; }\"}, {\"6\": \"    static String isi() {\"}, {\"7\": \"        String t = \\\"[\\\";\"}, {\"8\": \"        for (int i = f; i < r; i++) { t += q[i]; if (i < r - 1) t += \\\", \\\"; }\"}, {\"9\": \"        return t + \\\"]\\\";\"}, {\"10\": \"    }\"}, {\"11\": \"    public static void main(String[] args) {\"}, {\"12\": \"        enqueue(\\\"Hendra\\\"); enqueue(\\\"Lestari\\\"); enqueue(\\\"Miko\\\");\"}, {\"13\": \"        String dipanggil = dequeue();\"}, {\"14\": \"        System.out.println(\\\"Dipanggil  : \\\" + dipanggil);\"}, {\"15\": \"        System.out.println(\\\"Sisa       : \\\" + isi());\"}, {\"16\": \"        System.out.println(\\\"FRONT baru : \\\" + q[f]);\"}, {\"17\": \"        System.out.println(\\\"SIZE baru  : \\\" + s);\"}, {\"18\": \"    }\"}, {\"19\": \"}\"}]', 'Dipanggil  : Hendra\r\nSisa       : [Lestari, Miko]\r\nFRONT baru : Lestari\r\nSIZE baru  : 2', 100, '2026-05-21 00:02:05', '2026-05-21 00:02:05', NULL, NULL),
('4d949556-54a8-11f1-914b-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', '4132ce14-54a8-11f1-914b-e4a8dfe60766', '[{\"1\": \"public class Main {\"}, {\"2\": \"    static int[] q = new int[10];\"}, {\"3\": \"    static int f = 0, r = 0, s = 0;\"}, {\"4\": \"    static void enqueue(int d) { q[r++] = d; s++; }\"}, {\"5\": \"    static int dequeue() { s--; return q[f++]; }\"}, {\"6\": \"    static boolean isEmpty() { return s == 0; }\"}, {\"7\": \"    public static void main(String[] args) {\"}, {\"8\": \"        for (int i = 1; i <= 5; i++) enqueue(i);\"}, {\"9\": \"        while (!isEmpty()) {\"}, {\"10\": \"            int pembeli = dequeue();\"}, {\"11\": \"            System.out.println(\\\"Dilayani: \\\" + pembeli + \\\" Sisa: \\\" + s);\"}, {\"12\": \"        }\"}, {\"13\": \"        System.out.println(\\\"Antrian telah kosong\\\");\"}, {\"14\": \"    }\"}, {\"15\": \"}\"}]', 'Dilayani: 1 Sisa: 4\r\nDilayani: 2 Sisa: 3\r\nDilayani: 3 Sisa: 2\r\nDilayani: 4 Sisa: 1\r\nDilayani: 5 Sisa: 0\r\nAntrian telah kosong', 100, '2026-05-21 00:02:05', '2026-05-21 00:02:05', NULL, NULL),
('4d949a26-54a8-11f1-914b-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', '4132d089-54a8-11f1-914b-e4a8dfe60766', '[{\"1\": \"import java.util.Scanner;\"}, {\"2\": \"public class Main {\"}, {\"3\": \"    static String[] q = new String[10];\"}, {\"4\": \"    static int f = 0, r = 0, s = 0;\"}, {\"5\": \"    static void enqueue(String d) { q[r++] = d; s++; }\"}, {\"6\": \"    static String dequeue() { s--; return q[f++]; }\"}, {\"7\": \"    static String isi() {\"}, {\"8\": \"        String t = \\\"[\\\";\"}, {\"9\": \"        for (int i = f; i < r; i++) { t += q[i]; if (i < r - 1) t += \\\", \\\"; }\"}, {\"10\": \"        return t + \\\"]\\\";\"}, {\"11\": \"    }\"}, {\"12\": \"    public static void main(String[] args) {\"}, {\"13\": \"        Scanner sc = new Scanner(System.in);\"}, {\"14\": \"        enqueue(sc.nextLine()); enqueue(sc.nextLine());\"}, {\"15\": \"        String a = dequeue();\"}, {\"16\": \"        enqueue(sc.nextLine());\"}, {\"17\": \"        String b = dequeue();\"}, {\"18\": \"        enqueue(sc.nextLine());\"}, {\"19\": \"        System.out.println(\\\"a         : \\\" + a);\"}, {\"20\": \"        System.out.println(\\\"b         : \\\" + b);\"}, {\"21\": \"        System.out.println(\\\"Isi akhir : \\\" + isi());\"}, {\"22\": \"        System.out.println(\\\"SIZE      : \\\" + s);\"}, {\"23\": \"        sc.close();\"}, {\"24\": \"    }\"}, {\"25\": \"}\"}]', 'a         : A\r\nb         : B\r\nIsi akhir : [C, D]\r\nSIZE      : 2', 100, '2026-05-21 00:02:05', '2026-05-21 00:02:05', NULL, NULL),
('4d949f99-54a8-11f1-914b-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', '4132d2dd-54a8-11f1-914b-e4a8dfe60766', '[{\"1\": \"public class Main {\"}, {\"2\": \"    static int[] q = new int[20]; static int f = 0, r = 0, s = 0;\"}, {\"3\": \"    static int[] st = new int[20]; static int top = -1;\"}, {\"4\": \"    static void enqueue(int d) { q[r++] = d; s++; }\"}, {\"5\": \"    static int dequeue() { s--; return q[f++]; }\"}, {\"6\": \"    static void push(int d) { st[++top] = d; }\"}, {\"7\": \"    static int pop() { return st[top--]; }\"}, {\"8\": \"    static String isi() {\"}, {\"9\": \"        String t = \\\"[\\\";\"}, {\"10\": \"        for (int i = f; i < r; i++) { t += q[i]; if (i < r - 1) t += \\\", \\\"; }\"}, {\"11\": \"        return t + \\\"]\\\";\"}, {\"12\": \"    }\"}, {\"13\": \"    public static void main(String[] args) {\"}, {\"14\": \"        for (int i = 1; i <= 5; i++) enqueue(i);\"}, {\"15\": \"        System.out.println(\\\"Sebelum: \\\" + isi());\"}, {\"16\": \"        while (s > 0) push(dequeue());\"}, {\"17\": \"        while (top >= 0) enqueue(pop());\"}, {\"18\": \"        System.out.println(\\\"Sesudah: \\\" + isi());\"}, {\"19\": \"    }\"}, {\"20\": \"}\"}]', 'Sebelum: [1, 2, 3, 4, 5]\r\nSesudah: [5, 4, 3, 2, 1]', 100, '2026-05-21 00:02:05', '2026-05-21 00:02:05', NULL, NULL),
('4d94a52b-54a8-11f1-914b-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', '4132d4eb-54a8-11f1-914b-e4a8dfe60766', '[{\"1\": \"import java.util.Scanner;\"}, {\"2\": \"public class Main {\"}, {\"3\": \"    static char[] q = new char[20]; static int f = 0, r = 0, s = 0;\"}, {\"4\": \"    static char[] st = new char[20]; static int top = -1;\"}, {\"5\": \"    static void enqueue(char d) { q[r++] = d; s++; }\"}, {\"6\": \"    static char dequeue() { s--; return q[f++]; }\"}, {\"7\": \"    static void push(char d) { st[++top] = d; }\"}, {\"8\": \"    static char pop() { return st[top--]; }\"}, {\"9\": \"    public static void main(String[] args) {\"}, {\"10\": \"        Scanner sc = new Scanner(System.in);\"}, {\"11\": \"        String kata = sc.nextLine();\"}, {\"12\": \"        for (char c : kata.toCharArray()) { enqueue(c); push(c); }\"}, {\"13\": \"        boolean isPalindrom = true;\"}, {\"14\": \"        while (s > 0) if (dequeue() != pop()) isPalindrom = false;\"}, {\"15\": \"        System.out.println(\\\"Palindrom: \\\" + isPalindrom);\"}, {\"16\": \"        sc.close();\"}, {\"17\": \"    }\"}, {\"18\": \"}\"}]', 'Palindrom: true', 100, '2026-05-21 00:02:05', '2026-05-21 00:02:05', NULL, NULL),
('4d94aa76-54a8-11f1-914b-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', '4132d6e3-54a8-11f1-914b-e4a8dfe60766', '[{\"1\": \"public class Main {\"}, {\"2\": \"    static int[] q = new int[20]; static int qf = 0, qr = 0, qs = 0;\"}, {\"3\": \"    static int[] tmp = new int[20]; static int tf = 0, tr = 0, ts = 0;\"}, {\"4\": \"    static void enqQ(int d) { q[qr++] = d; qs++; }\"}, {\"5\": \"    static int deqQ() { qs--; return q[qf++]; }\"}, {\"6\": \"    static void enqT(int d) { tmp[tr++] = d; ts++; }\"}, {\"7\": \"    static int deqT() { ts--; return tmp[tf++]; }\"}, {\"8\": \"    static String isi() {\"}, {\"9\": \"        String t = \\\"[\\\";\"}, {\"10\": \"        for (int i = qf; i < qr; i++) { t += q[i]; if (i < qr - 1) t += \\\", \\\"; }\"}, {\"11\": \"        return t + \\\"]\\\";\"}, {\"12\": \"    }\"}, {\"13\": \"    public static void main(String[] args) {\"}, {\"14\": \"        for (int d : new int[]{11, 22, 33, 44, 55}) enqQ(d);\"}, {\"15\": \"        int cari = 33; boolean ditemukan = false;\"}, {\"16\": \"        while (qs > 0) { int e = deqQ(); if (e == cari) ditemukan = true; enqT(e); }\"}, {\"17\": \"        while (ts > 0) enqQ(deqT());\"}, {\"18\": \"        System.out.println(\\\"Ditemukan: \\\" + ditemukan);\"}, {\"19\": \"        System.out.println(\\\"Antrian  : \\\" + isi());\"}, {\"20\": \"    }\"}, {\"21\": \"}\"}]', 'Ditemukan: true\r\nAntrian  : [11, 22, 33, 44, 55]', 100, '2026-05-21 00:02:05', '2026-05-21 00:02:05', NULL, NULL),
('4d94b05d-54a8-11f1-914b-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', '4132d8d2-54a8-11f1-914b-e4a8dfe60766', '[{\"1\": \"import java.util.Scanner;\"}, {\"2\": \"public class Main {\"}, {\"3\": \"    static int[] q = new int[20]; static int qf = 0, qr = 0, qs = 0;\"}, {\"4\": \"    static int[] tmp = new int[20]; static int tf = 0, tr = 0, ts = 0;\"}, {\"5\": \"    static void enqQ(int d) { q[qr++] = d; qs++; }\"}, {\"6\": \"    static int deqQ() { qs--; return q[qf++]; }\"}, {\"7\": \"    static void enqT(int d) { tmp[tr++] = d; ts++; }\"}, {\"8\": \"    static int deqT() { ts--; return tmp[tf++]; }\"}, {\"9\": \"    static String isi() {\"}, {\"10\": \"        String t = \\\"[\\\";\"}, {\"11\": \"        for (int i = qf; i < qr; i++) { t += q[i]; if (i < qr - 1) t += \\\", \\\"; }\"}, {\"12\": \"        return t + \\\"]\\\";\"}, {\"13\": \"    }\"}, {\"14\": \"    public static void main(String[] args) {\"}, {\"15\": \"        Scanner sc = new Scanner(System.in);\"}, {\"16\": \"        for (int i = 0; i < 5; i++) enqQ(sc.nextInt());\"}, {\"17\": \"        int minimum = q[qf];\"}, {\"18\": \"        while (qs > 0) { int e = deqQ(); if (e < minimum) minimum = e; enqT(e); }\"}, {\"19\": \"        while (ts > 0) enqQ(deqT());\"}, {\"20\": \"        System.out.println(\\\"Minimum: \\\" + minimum);\"}, {\"21\": \"        System.out.println(\\\"Antrian: \\\" + isi());\"}, {\"22\": \"        sc.close();\"}, {\"23\": \"    }\"}, {\"24\": \"}\"}]', 'Minimum: 10\r\nAntrian: [50, 20, 80, 10, 60]', 100, '2026-05-21 00:02:05', '2026-05-21 00:02:05', NULL, NULL),
('4d94b63d-54a8-11f1-914b-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', '4132db18-54a8-11f1-914b-e4a8dfe60766', '[{\"1\": \"import java.util.Scanner;\"}, {\"2\": \"public class Main {\"}, {\"3\": \"    static int[] q = new int[20]; static int qf = 0, qr = 0, qs = 0;\"}, {\"4\": \"    static int[] tmp = new int[20]; static int tf = 0, tr = 0, ts = 0;\"}, {\"5\": \"    static void enqQ(int d) { q[qr++] = d; qs++; }\"}, {\"6\": \"    static int deqQ() { qs--; return q[qf++]; }\"}, {\"7\": \"    static void enqT(int d) { tmp[tr++] = d; ts++; }\"}, {\"8\": \"    static int deqT() { ts--; return tmp[tf++]; }\"}, {\"9\": \"    static String isi() {\"}, {\"10\": \"        String t = \\\"[\\\";\"}, {\"11\": \"        for (int i = qf; i < qr; i++) { t += q[i]; if (i < qr - 1) t += \\\", \\\"; }\"}, {\"12\": \"        return t + \\\"]\\\";\"}, {\"13\": \"    }\"}, {\"14\": \"    public static void main(String[] args) {\"}, {\"15\": \"        Scanner sc = new Scanner(System.in);\"}, {\"16\": \"        int cari = sc.nextInt();\"}, {\"17\": \"        for (int d : new int[]{2, 5, 2, 3, 2, 5, 4}) enqQ(d);\"}, {\"18\": \"        int frekuensi = 0;\"}, {\"19\": \"        while (qs > 0) { int e = deqQ(); if (e == cari) frekuensi++; enqT(e); }\"}, {\"20\": \"        while (ts > 0) enqQ(deqT());\"}, {\"21\": \"        System.out.println(\\\"Frekuensi \\\" + cari + \\\" : \\\" + frekuensi);\"}, {\"22\": \"        System.out.println(\\\"Antrian     : \\\" + isi());\"}, {\"23\": \"        sc.close();\"}, {\"24\": \"    }\"}, {\"25\": \"}\"}]', 'Frekuensi 2 : 3\r\nAntrian     : [2, 5, 2, 3, 2, 5, 4]', 100, '2026-05-21 00:02:05', '2026-05-21 00:02:05', NULL, NULL),
('4d94bbcc-54a8-11f1-914b-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', '4132dd2c-54a8-11f1-914b-e4a8dfe60766', '[{\"1\": \"public class Main {\"}, {\"2\": \"    static int[] q = new int[20]; static int f = 0, r = 0, s = 0;\"}, {\"3\": \"    static int[] st = new int[20]; static int top = -1;\"}, {\"4\": \"    static void enqueue(int d) { q[r++] = d; s++; }\"}, {\"5\": \"    static int dequeue() { s--; return q[f++]; }\"}, {\"6\": \"    static void push(int d) { st[++top] = d; }\"}, {\"7\": \"    static int pop() { return st[top--]; }\"}, {\"8\": \"    static String isi() {\"}, {\"9\": \"        String t = \\\"[\\\";\"}, {\"10\": \"        for (int i = f; i < r; i++) { t += q[i]; if (i < r - 1) t += \\\", \\\"; }\"}, {\"11\": \"        return t + \\\"]\\\";\"}, {\"12\": \"    }\"}, {\"13\": \"    public static void main(String[] args) {\"}, {\"14\": \"        for (int d : new int[]{301, 302, 303, 304, 305}) enqueue(d);\"}, {\"15\": \"        int cari = 303; boolean ditemukan = false;\"}, {\"16\": \"        while (s > 0) { int e = dequeue(); if (e == cari) ditemukan = true; push(e); }\"}, {\"17\": \"        while (top >= 0) enqueue(pop());\"}, {\"18\": \"        System.out.println(\\\"Ditemukan: \\\" + ditemukan);\"}, {\"19\": \"        System.out.println(\\\"Antrian  : \\\" + isi());\"}, {\"20\": \"    }\"}, {\"21\": \"}\"}]', 'Ditemukan: true\r\nAntrian  : [305, 304, 303, 302, 301]', 100, '2026-05-21 00:02:05', '2026-05-21 00:02:05', NULL, NULL),
('4d94d678-54a8-11f1-914b-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', '4132e212-54a8-11f1-914b-e4a8dfe60766', '[{\"1\": \"import java.util.Scanner;\"}, {\"2\": \"public class Main {\"}, {\"3\": \"    static int[] q = new int[20]; static int f = 0, r = 0, s = 0;\"}, {\"4\": \"    static int[] st = new int[20]; static int top = -1;\"}, {\"5\": \"    static void enqueue(int d) { q[r++] = d; s++; }\"}, {\"6\": \"    static int dequeue() { s--; return q[f++]; }\"}, {\"7\": \"    static void push(int d) { st[++top] = d; }\"}, {\"8\": \"    static int pop() { return st[top--]; }\"}, {\"9\": \"    static String isi() {\"}, {\"10\": \"        String t = \\\"[\\\";\"}, {\"11\": \"        for (int i = f; i < r; i++) { t += q[i]; if (i < r - 1) t += \\\", \\\"; }\"}, {\"12\": \"        return t + \\\"]\\\";\"}, {\"13\": \"    }\"}, {\"14\": \"    public static void main(String[] args) {\"}, {\"15\": \"        Scanner sc = new Scanner(System.in);\"}, {\"16\": \"        for (int i = 0; i < 5; i++) enqueue(sc.nextInt());\"}, {\"17\": \"        int maksimum = q[f], posisi = 1, index = 1;\"}, {\"18\": \"        while (s > 0) { int e = dequeue(); if (e > maksimum) { maksimum = e; posisi = index; } push(e); index++; }\"}, {\"19\": \"        while (top >= 0) enqueue(pop());\"}, {\"20\": \"        System.out.println(\\\"Maksimum : \\\" + maksimum);\"}, {\"21\": \"        System.out.println(\\\"Posisi   : \\\" + posisi);\"}, {\"22\": \"        System.out.println(\\\"Antrian  : \\\" + isi());\"}, {\"23\": \"        sc.close();\"}, {\"24\": \"    }\"}, {\"25\": \"}\"}]', 'Maksimum : 95\r\nPosisi   : 4\r\nAntrian  : [80, 95, 60, 90, 75]', 100, '2026-05-21 00:02:05', '2026-05-21 00:02:05', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `label_skor`
--

CREATE TABLE `label_skor` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_soal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_mahasiswa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skor` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feedback_data_type` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `feedback_algorithm` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `order` int DEFAULT NULL,
  `manual_active` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id`, `name`, `image`, `feedback_data_type`, `feedback_algorithm`, `order`, `manual_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
('01985f44-f662-72f9-a85b-a7b256942492', 'Stack', 'assets/media/level_image/level_688b13cbbc675.png', 'Cek kembali kesalahan pada tipe data int, String, Double, Float, long', 'Cek kembali kesalahan pada urutan algoritma', 9, 0, '2025-07-30 23:56:51', '2026-05-20 08:19:45', NULL),
('019863c4-59f9-7319-9104-08267fc3c551', 'Queue', 'assets/media/level_image/level_68a69ecb76297.png', 'Cek kembali kesalahan pada tipe data int, String, Double, Float, long', 'Cek kembali kesalahan pada urutan algoritma', 2, 1, '2025-07-31 20:54:29', '2026-05-20 08:18:52', NULL),
('01995dec-678e-70cf-854a-b25e2c2d0d28', 'Tipe Data', 'assets/media/level_image/level_696cfb93a5cd8.png', 'Cek kembali kesalahan pada tipe data int, String, Double, Float, long', 'Cek kembali kesalahan pada urutan algoritma', 1, 1, '2025-09-18 10:43:18', '2026-05-20 08:18:52', NULL),
('01995e0c-9825-73b3-b94f-2ae0542eabef', 'Kondisi', 'assets/media/level_image/level_696cfbb088f61.png', 'Cek kembali kesalahan pada tipe data int, String, Double, Float, long', 'Cek kembali kesalahan pada urutan algoritma', 4, 0, '2025-09-18 11:18:27', '2026-05-20 08:19:45', NULL),
('01995e0d-85fe-7041-8c7e-cdfbc81bf1ed', 'Perulangan', 'assets/media/level_image/level_696cfbc71833b.png', 'Cek kembali kesalahan pada tipe data int, String, Double, Float, long', 'Cek kembali kesalahan pada urutan algoritma', 5, 0, '2025-09-18 11:19:28', '2026-05-20 08:19:45', NULL),
('01995e12-4580-7361-b0d1-379bdea0b2b6', 'Fungsi', 'assets/media/level_image/level_696cfbdbcdcfe.png', 'Cek kembali kesalahan pada tipe data int, String, Double, Float, long', 'Cek kembali kesalahan pada urutan algoritma', 6, 0, '2025-09-18 11:24:39', '2026-05-20 08:19:45', NULL),
('01995e13-29af-7010-8995-1a40e4504851', 'Array 1', 'assets/media/level_image/level_696cfbebd15c6.png', 'Cek kembali kesalahan pada tipe data int, String, Double, Float, long', 'Cek kembali kesalahan pada urutan algoritma', 7, 0, '2025-09-18 11:25:38', '2026-05-20 08:19:45', NULL),
('01995e17-eb90-721f-92c5-3ce5162cedfd', 'Sorting', 'assets/media/level_image/level_696cfc29a2fea.png', 'Cek kembali kesalahan pada tipe data int, String, Double, Float, long', 'Cek kembali kesalahan pada urutan algoritma', 10, 0, '2025-09-18 11:30:50', '2026-05-20 08:19:45', NULL),
('01995e18-9100-7037-9f92-b6491990b048', 'Searching', 'assets/media/level_image/level_696cfd336aeb4.png', 'Cek kembali kesalahan pada tipe data int, String, Double, Float, long', 'Cek kembali kesalahan pada urutan algoritma', 11, 0, '2025-09-18 11:31:32', '2026-05-20 08:19:45', NULL),
('01996adc-c3ca-712b-abc0-933c691ccfc8', 'Array 2', 'assets/media/level_image/level_696cfc0852e19.png', 'Cek kembali kesalahan pada tipe data int, String, Double, Float, long', 'Cek kembali kesalahan pada urutan algoritma', 8, 0, '2025-09-21 06:01:17', '2026-05-20 08:19:45', NULL),
('019de356-abfa-717d-958c-e9311c2712f3', 'Linked List', 'assets/media/level_image/level_6a0dd0cb08117.png', 'Cek kembali kesalahan pada tipe data int, String, Double, Float, long', 'Cek kembali kesalahan pada urutan algoritma', 3, NULL, '2026-05-20 11:49:20', '2026-05-20 08:19:28', '2026-05-20 08:19:28'),
('019e20a7-b5ca-71f5-bf74-ef427589ef0e', 'Linked List', 'assets/media/level_image/level_6a04438275852.png', 'Cek kembali kesalahan pada tipe data int, String, Double, Float, long.', 'Cek kembali kesalahan pada urutan algoritma.', 3, 0, '2026-05-13 02:25:22', '2026-05-20 08:19:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `log_data`
--

CREATE TABLE `log_data` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_soal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_mahasiswa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `index` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemText` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `timer_second` int DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variabel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `log_ujian_kode`
--

CREATE TABLE `log_ujian_kode` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_mahasiswa` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_bank_soal_konversi` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_level` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `index` int NOT NULL,
  `item_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_kelas` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nim` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `jenis_kelamin` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `open_panduan` smallint DEFAULT NULL COMMENT '0: belum, 1: sudah',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `nilai_test`
--

CREATE TABLE `nilai_test` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_mahasiswa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pre_test` int DEFAULT NULL,
  `post_test` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `nyawa`
--

CREATE TABLE `nyawa` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_mahasiswa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nyawa` int NOT NULL,
  `max_nyawa` int NOT NULL,
  `next_regen_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `pencapaian`
--

CREATE TABLE `pencapaian` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_mahasiswa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_soal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_soal_konversi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` enum('leaderboard','badge','soal','konversi') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '''leaderboard'',''badge'',''soal'',''konversi''',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `progress` int DEFAULT NULL,
  `max_progress` int DEFAULT NULL,
  `status` smallint DEFAULT NULL COMMENT '0: belum hak\r\n1: not claimed\r\n2: claimed',
  `heart` int DEFAULT NULL,
  `date_claimed` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`, `deleted_at`) VALUES
('ffb8c542-a376-11f0-8150-b46921aaa072', 'maintenance_mahasiswa', '0', '2025-10-07 12:13:13', '2026-05-04 21:32:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `soal`
--

CREATE TABLE `soal` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `judul` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `soal` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `kunci_tipe_data` json DEFAULT NULL,
  `kunci_algoritma` json DEFAULT NULL,
  `order` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `difficulty` enum('easy','medium','hard') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'easy',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `soal`
--

INSERT INTO `soal` (`id`, `id_level`, `judul`, `soal`, `kunci_tipe_data`, `kunci_algoritma`, `order`, `status`, `difficulty`, `created_at`, `updated_at`, `deleted_at`) VALUES
('01995df6-35ed-7363-9d42-578622c3e4f2', '01995dec-678e-70cf-854a-b25e2c2d0d28', 'Program Hitung Harga Motor', '<p>Pak Hari membeli sepeda motor dengan harga <strong>25.000.000 </strong>dan dikenakan pajak penjualan sebesar <strong>10%</strong>.<strong> </strong>Uang yang harus dibayar pak Hari sebesar…..</p>', '\"[{\\\"variabel\\\":\\\"pajak = 10%\\\",\\\"tipe_data\\\":\\\"double\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"harga_motor\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"uang_bayar\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"pajak_jual\\\",\\\"tipe_data\\\":\\\"float\\\",\\\"konversi\\\":1}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"read pajak, harga_motor\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"pajak_jual = pajak*harga_motor\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"uang_bayar = harga_motor + pajak jual\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"print (uang_bayar)\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 1, 1, 'easy', '2025-09-18 10:54:00', '2026-01-18 09:54:04', NULL),
('01995e0a-74d3-73fa-895b-cfe6f4ec6ab6', '01995dec-678e-70cf-854a-b25e2c2d0d28', 'program Hitung Harga Jual', '<p>Sebuah rumah makan baru telah dibuka di Jl. Borobudur Malang. Berdasarkan peraturan pemerintah daerah maka rumah makan tersebut dikenakan pajak berdasarkan makanan yang dijual.&nbsp;Buatlah program Java untuk <strong>menghitung harga jual \"Bakso Merapi\" (Rp85.000)</strong> setelah ditambah <strong>pajak 10%</strong>. Program harus menampilkan output berupa harga akhir setelah terkena pajak!</p>', '\"[{\\\"variabel\\\":\\\"harga_dasar\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"persentase_pajak\\\",\\\"tipe_data\\\":\\\"float\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"harga_akhir\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"nilai_pajak\\\",\\\"tipe_data\\\":\\\"float\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"double\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"read harga_dasar = 85000;\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"read persentase_pajak = 0.1;\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"SET nilai_pajak = harga_dasar * persentase_pajak\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"SET harga_akhir = harga_dasar + nilai_pajak\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT \\\\\\\"Harga akhir setelah pajak: Rp\\\\\\\" +harga_akhir\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 3, 1, 'easy', '2025-09-18 11:16:07', '2025-10-14 01:59:01', NULL),
('01995e1e-b10a-70d3-8210-d2eee6fe2807', '01995dec-678e-70cf-854a-b25e2c2d0d28', 'Program Hitung Luas Kolam', '<p>Pak Budi mempunyai kolam renang berbentuk balok berukuran <strong>panjang 10 m</strong>, <strong>lebar 6 m</strong>, dan <strong>kedalaman 1,5 m</strong>. Sisi bagian dalam kolam renang dikeramik, luas bagian kolam renang yang dikeramik adalah</p>', '\"[{\\\"variabel\\\":\\\"panjang = 10m\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"lebar = 6m\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"tinggi = 1,5m\\\",\\\"tipe_data\\\":\\\"float\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"luas_bagian\\\",\\\"tipe_data\\\":\\\"double\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"read panjang, lebar, tinggi\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"luas_bagian = 2 * ((p*l) + (p*t) + (l*t))\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"print (luas_bagian)\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 4, 1, 'easy', '2025-09-18 11:38:13', '2025-10-14 01:59:01', NULL),
('01995e24-1a61-73eb-b623-a0220a69532e', '01995dec-678e-70cf-854a-b25e2c2d0d28', 'Perhitungan Volume', '<p>Pak Andi berencana untuk melakukan syukuran pada tanggal 31 Mei 2023. Untuk itu, Pak Andi mulai mempersiapkan pembelian box nasi, akan tetapi stok persediaan yang tersisa di toko hanyalah box nasi dengan perbandingan <strong>ukuran panjang : lebar : tinggi sebesar 20:20:7</strong>. Untuk mengetahui apakah box nasi ini cukup untuk menyimpan makanan yang akan dibagikan kepada para tamu, maka diperlukan <strong>perhitungan volume dari nasi box</strong>. Berdasarkan kondisi di atas, buatlah algoritma yang dapat menggambarkan proses <strong>perhitungan volume box nasi</strong>!</p>', '\"[{\\\"variabel\\\":\\\"Panjang\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"Lebar\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"Tinggi\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"volume\\\",\\\"tipe_data\\\":\\\"long\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"long\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT \\\\u201cMasukkan nilai panjang, lebar, tinggi\\\\u201d\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"READ panjang, lebar, tinggi\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"volume = panjang * lebar * tinggi\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT \\\\u201cVolume setiap box nasi sebesar:\\\\u201d + volume\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 5, 1, 'easy', '2025-09-18 11:44:08', '2025-10-14 01:59:01', NULL),
('01995e27-3c16-7365-be30-b2fed20f53a2', '01995dec-678e-70cf-854a-b25e2c2d0d28', 'Program Hitung Luas Taman', '<p>Diketahui sebuah taman <strong>berbentuk lingkaran</strong>, yang mana setengah dari luas taman tersebut akan ditanami bunga. Jika jari-jari taman tersebut <strong>sebesar 42 meter</strong>, tentukan <strong>luas taman yang akan ditanami rumput</strong> dengan menggunakan algoritma pseudocode! <strong>(phi : 3,14)</strong></p>', '\"[{\\\"variabel\\\":\\\"r\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"phi\\\",\\\"tipe_data\\\":\\\"float\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"taman_bunga\\\",\\\"tipe_data\\\":\\\"double\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"double\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT \\\\u201cMasukkan jari - jari taman, phi\\\\u201d\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"READ r, phi\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"taman_bunga = \\\\u00bd (phi * 42 * 42)\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT \\\\u201cLuas dari taman bunga sebesar:\\\\u201d + taman_bunga\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 2, 1, 'easy', '2025-09-18 11:47:33', '2025-10-14 01:59:01', NULL),
('01995e2b-056e-716f-a01a-2794060829e0', '01995e0c-9825-73b3-b94f-2ae0542eabef', 'Program Hitung Batas Umur', '<p>Buatlah algoritma untuk menentukan <strong>batas umur pembutan SIM</strong> kendaraan bermotor!</p>', '\"[{\\\"variabel\\\":\\\"age\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"char\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"long\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT \\\\\\\"masukkan umur anda\\\\\\\"\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"READ age\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"IF(age>=16) THEN\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT \\\\\\\"anda dapat melanjutkan tes pembuatan SIM\\\\\\\"\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"ELSE\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT \\\\\\\"anda tidak dapat melanjutkan tes pembuatan SIM \\\\\\\"\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"ENDIF\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 1, 1, 'easy', '2025-09-18 11:51:41', '2025-10-02 06:12:54', NULL),
('0199656f-eb1f-70c7-b952-1825aa45f75c', '01995e0c-9825-73b3-b94f-2ae0542eabef', 'Program Kondisi Proses Seleksi', '<p>Sebuah sistem dibuat untuk mempermudah perusahaan yang akan melakukan seleksi administrasi terhadap beberapa pelamar kerja yang telah menyelesaikan pendaftaran. Untuk syarat pelamar kerja secara akademis yang akan dinyatakan lolos tahap berikutnya ialah :&nbsp;</p><ol><li>Memiliki ipk minimal 3.5</li><li>Memiliki skor toefl tidak kurang dari 450</li><li>Memiliki nilai attitude sekurang - kurangnya B</li></ol><p>Untuk nilai attitude sendiri akan mengindikasikan perilaku yang baik berdasarkan observasi perusahaan dengan parameter nilai :&nbsp;</p><ul><li><strong>80 - 100 = A</strong></li><li><strong>60-79 = B</strong></li><li><strong>0-59 = C</strong></li></ul><p>Namun, terdapat pengecualian, apabila pelamar memenuhi semua poin, kecuali poin 3, maka akan secara otomatis dinyatakan gugur. Kemudian, untuk pelamar yang hanya memiliki nilai ipk lebih dari atau sama dengan 3.4 dan skor toefl lebih dari atau sama dengan 400, akan tetapi memiliki nilai attitude A, maka akan dinyatakan lolos bersyarat. Berdasarkan kondisi di atas, buatlah algoritma yang tepat agar nantinya dapat diterapkan ke dalam sistem.</p>', '\"[{\\\"variabel\\\":\\\"ipk\\\",\\\"tipe_data\\\":\\\"float\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"toefl\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"attitude\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"double\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"char\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"read ipk;\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"read toefl;\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"read attitude;\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"IF (ipk >= 3.5 AND toefl >= 450) THEN\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"IF (attitude >= 60 AND attitude <= 100) THEN\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT \\\\\\\"Pelamar dinyatakan lolos seleksi administrasi\\\\\\\"\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"ELSE\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT \\\\\\\"Pelamar dinyatakan tidak lolos seleksi administrasi\\\\\\\"\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"ENDIF\\\",\\\"clue\\\":1,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"ELSE IF (ipk >= 3.4 AND toefl >= 400 AND attitude >= 80 AND attitude <= 100) THEN\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT \\\\\\\"Pelamar dinyatakan lolos bersyarat seleksi administrasi\\\\\\\"\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"ELSE\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT \\\\\\\"Pelamar dinyatakan tidak lolos seleksi administrasi\\\\\\\"\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"ENDIF\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 2, 1, 'easy', '2025-09-20 04:44:17', '2025-10-02 06:10:13', NULL),
('0199657d-34ff-739e-bfef-e842ea2e57d3', '01995e0c-9825-73b3-b94f-2ae0542eabef', 'Program Kondisi Diskon Belanja', '<p>Sebuah toko memberlakukan <strong>potongan harga</strong> dan juga <strong>potongan harga untuk periode bulan Mei 2023</strong> secara spesial kepada para customer yang memenuhi syarat dan ketentuan yang berlaku, yang mana :</p><ol><li>Customer yang memiliki kartu member dan melakukan transaksi &gt; Rp.500.000,00 akan mendapat diskon sebesar 10%</li><li>Customer yang memiliki kartu member dan melakukan transaksi antara Rp.251.000,00-Rp.500.0000,00 akan mendapat diskon sebesar 5%</li><li>Customer yang memiliki kartu member dan melakukan antara Rp.150.000,00 - 250.000,000 akan mendapat diskon sebesar 2%</li><li>Customer yang tidak memiliki kartu member dan melakukan transaksi &gt;= Rp.500.000,00 akan mendapatkan potongan harga senilai Rp.20.000,00</li></ol>', '\"[{\\\"variabel\\\":\\\"member_card\\\",\\\"tipe_data\\\":\\\"string\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"tot_belanja\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"diskon\\\",\\\"tipe_data\\\":\\\"float\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"bayar\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"double\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT \\\\\\\"Masukkan total belanja\\\\\\\"\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"READ tot_belanja\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT \\\\\\\"Apakah customer memiliki kartu member (ya\\\\/tidak)?\\\\\\\"\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"READ member_card\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"IF (member_card.equalsIgnoreCase(\\\\\\\"ya\\\\\\\")) THEN\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"IF (tot_belanja > 500000) THEN\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT diskon = 10%\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"ELSE IF (tot_belanja >= 251000 AND tot_belanja <= 500000) THEN\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT diskon = 5%\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"ELSE IF (tot_belanja >= 150000 AND tot_belanja <= 250000) THEN\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT diskon = 2%\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"ELSE\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT diskon = 0\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"ENDIF\\\",\\\"clue\\\":0,\\\"konversi\\\":1}]\"', 3, 1, 'easy', '2025-09-20 04:58:48', '2025-10-02 05:55:22', NULL),
('01996581-d9fc-7116-ac8c-a860cd1b79bd', '01995e0c-9825-73b3-b94f-2ae0542eabef', 'Program Kondisi Klasifikasi Usia', '<p>Seiring berjalannya waktu perkembangan industri film di Indonsesia tidak dapat dipungkiri telah menghasilkan berbagai jenis produk film yang menarik, mulai dari <i>action, horror, romance, biography, family</i>, dsb. Akan tetapi perkembangan ini tidak serta merta dapat dinikmati oleh seluruh lapisan masyarat, hal ini dikarenakan LSF dan industri film secara global telah menetapkan klasifikasi usia penonton demi menjaga nilai - nilai moral dan mencegah hal - hal negatif yang diakibatkan ketidaksiapan mental dan emosi penonton selama mengikuti alur cerita film. Adapun klasifikasi usia tersebut terbagi menjadi 3, diantaranya :</p><ol><li><strong>Semua Umur (SU), 13+ atau untuk penonton 13 tahun ke atas&nbsp;</strong></li><li><strong>17+ untuk penonton usia 17 tahun ke atas</strong></li><li><strong>21+ atau untuk penonton usia 21 tahun ke atas yang juga suka dikenal dengan rating R (R-rated)</strong></li></ol><p>Berdasarkan kondisi di atas, buatlah <strong>algoritma yang dapat menggambarkan klasifikasi usia penonton</strong> dengan produk - produk film yang dapat mereka konsumsi.<strong>&nbsp;</strong></p>', '\"[{\\\"variabel\\\":\\\"age\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"string\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"char\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT \\\\\\\"masukkan umur anda\\\\\\\"\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"READ age\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"IF (age>= 13 && age<=16) THEN\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT \\\\\\\"Anda hanya dapat menonton film dengan label Semua Umur(SU)\\\\\\\"\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"ELSE IF (age>= 17 && age<=20) THEN\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT \\\\\\\"Anda dapat menonton film dengan label Semua Umur (SU) dan 17+\\\\\\\"\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"ELSE IF (age>=21) THEN\\\",\\\"clue\\\":1,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT \\\\\\\"Anda dapat menonton film dengan label semua jenis film\\\\\\\"\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"ELSE\\\",\\\"clue\\\":1,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT \\\\\\\"Anda tidak memenuhi kriteria untuk menonton film\\\\\\\"\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"ENDIF\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 4, 1, 'easy', '2025-09-20 05:03:52', '2025-10-02 05:50:03', NULL),
('01996586-e110-71b7-9507-6b306ef78d5e', '01995e0c-9825-73b3-b94f-2ae0542eabef', 'Program Hitung Bilangan', '<p>Terdapat sebuah bilangan yaitu <strong>a, b, dan c.</strong> Buatlah <strong>algoritma untuk menemukan angka terbesar</strong> dari 3 bilangan tersebut!</p>', '\"[{\\\"variabel\\\":\\\"a, b, c\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"char\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"double\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT \\\\u201cMasukkan angka a\\\\u201d\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"READ a\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT \\\\u201cMasukkan angka b\\\\u201d\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"READ b\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT \\\\u201cMasukkan angka c\\\\u201d\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"READ c\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"IF(a>b AND a>c) THEN\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT a+ \\\\\\\"lebih besar\\\\\\\"\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"ELSE IF( b > c) THEN\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT b + \\\\\\\" lebih besar \\\\\\\"\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"ELSE\\\",\\\"clue\\\":1,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT c+ \\\\\\\" lebih besar \\\\\\\"\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"ENDIF\\\",\\\"clue\\\":1,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 5, 1, 'easy', '2025-09-20 05:09:22', '2025-10-02 05:47:22', NULL),
('01996594-b7ae-7084-a4b6-fef776832975', '01985f44-f662-72f9-a85b-a7b256942492', 'Susunan Piring Rumah Sakit', '<p>Di dapur rumah sakit, para koki menumpuk piring makan steril dalam satu rak, piring-piring tersebut telah memiliki kodenya masing-masing <strong>(kode piring, \'A\', \'B\', dst)</strong>. Setiap piring yang selesai dicuci langsung ditaruh di atas tumpukan. Ketika waktu makan tiba, <strong>piring paling atas diambil lebih dulu</strong> untuk digunakan. Buatkan algoritma sederhana untuk <strong>memasukkan piring dan mengambilnya kembali.</strong></p>', '\"[{\\\"variabel\\\":\\\"stackPiring\\\",\\\"tipe_data\\\":\\\"STACK of char\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"piring\\\",\\\"tipe_data\\\":\\\"char\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"string\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"top\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"READ piring\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"INISIASI TOP = -1\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PUSH(stackPiring, piring)\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"POP(stackPiring)\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT(\\\\\\\"Piring siap dipakai:\\\\\\\", piring)\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 1, 1, 'easy', '2025-09-20 05:24:29', '2025-10-03 14:11:34', NULL),
('019965a5-6b5d-7016-88a8-1c825dcd3a97', '01985f44-f662-72f9-a85b-a7b256942492', 'Pencatatan Barang Gudang', '<p>Petugas gudang mencatat barang masuk ke dalam STACK. Jika berat barang <strong>lebih dari 30 kg</strong>, maka sistem akan menanyakan apakah ada tambahan barang. Jika ya, maka data barang tambahan <strong>dimasukkan ke dalam STACK</strong>.</p>', '\"[{\\\"variabel\\\":\\\"stackBarang\\\",\\\"tipe_data\\\":\\\"STACK of string\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"berat\\\",\\\"tipe_data\\\":\\\"float\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"namaBarang\\\",\\\"tipe_data\\\":\\\"string\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"STACK of char\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"char\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"jawaban\\\",\\\"tipe_data\\\":\\\"string\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"top\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"READ berat\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"INISIALISASI top = -1\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"IF berat > 30 THEN\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"ASK \\\\\\\"Ada barang tambahan? (ya\\\\/tidak)\\\\\\\"\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"READ jawaban\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"IF jawaban = \\\\\\\"ya\\\\\\\" THEN\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"READ namaBarang\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PUSH(stackBarang, namaBarang)\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END IF\\\",\\\"clue\\\":1,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END IF\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT(\\\\\\\"Berat barang:\\\\\\\", berat)\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 2, 1, 'easy', '2025-09-20 05:42:43', '2025-10-03 14:08:36', NULL),
('019965aa-adc2-73b8-b977-79ce500534db', '01985f44-f662-72f9-a85b-a7b256942492', 'Pesanan Restoran', '<p>Di sebuah restoran, setiap pelanggan yang datang harus memilih makanan dari menu. Makanan yang dipilih dimasukkan ke dalam STACK. Jika jumlah makanan di <strong>STACK lebih dari 5,</strong> maka makanan terakhir yang dimasukkan akan dikeluarkan untuk dihidangkan terlebih dahulu. Namun, jika jumlah <strong>makanan kurang dari 5,</strong> pelanggan dapat memilih lebih banyak makanan. Buat algoritma untuk menangani ini.</p>', '\"[{\\\"variabel\\\":\\\"stackMakanan\\\",\\\"tipe_data\\\":\\\"STACK of string\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"makanan\\\",\\\"tipe_data\\\":\\\"string\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"jumlahMakanan\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"char\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"STACK of char\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"top\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"READ makanan\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"READ jumlahMakanan\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"INISIALISASI top = -1\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"IF jumlahMakanan > 5 THEN\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PUSH(stackMakanan, makanan)\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT(\\\\\\\"Makanan yang dihidangkan:\\\\\\\", POP(stackMakanan))\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"ELSE\\\",\\\"clue\\\":1,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PUSH(stackMakanan, makanan)\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END IF\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 3, 1, 'easy', '2025-09-20 05:48:28', '2025-10-03 13:48:15', NULL),
('019965b3-5dc1-733a-96f3-167263ed3ac1', '01985f44-f662-72f9-a85b-a7b256942492', 'Transaksi Setoran Uang Nasabah', '<p>Di sebuah bank, kasir menggunakan STACK untuk memproses transaksi setoran uang nasabah. Jika nasabah menyetor <strong>lebih dari Rp. 3.000.000</strong>, maka kasir akan menanyakan apakah nasabah ingin setoran tambahan. Jika ya, kasir akan menambahkan jumlah setoran ke STACK. Buat algoritma untuk menangani setoran ini.</p>', '\"[{\\\"variabel\\\":\\\"stackSetoran\\\",\\\"tipe_data\\\":\\\"STACK of double\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"setoran\\\",\\\"tipe_data\\\":\\\"double\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"STACK of int\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"top\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"jawaban\\\",\\\"tipe_data\\\":\\\"string\\\",\\\"konversi\\\":1}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"READ setoran\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"INISIALISASI top = -1\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"IF setoran > 3000000 THEN\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"ASK \\\\\\\"Ingin menambah setoran? (ya\\\\/tidak)\\\\\\\"\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"READ jawaban\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"IF jawaban = \\\\\\\"ya\\\\\\\" THEN\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PUSH(stackSetoran, setoran)\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END IF\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END IF\\\",\\\"clue\\\":1,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT \\\\\\\"Jumlah setoran:\\\\\\\", setoran\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 4, 1, 'easy', '2025-09-20 05:57:57', '2025-10-03 12:13:00', NULL),
('0199671f-15f6-7101-a4c4-2f9227cb03e2', '01985f44-f662-72f9-a85b-a7b256942492', 'Pengelolaan Dokumen di Rak', '<p>Di sebuah kantor, seorang pekerja ingin <strong>mengeluarkan dokumen dari rak (STACK)</strong>. Setelah dokumen dikeluarkan, pekerja ingin melihat <strong>sisa dokumen yang masih ada di rak</strong>.</p>', '\"[{\\\"variabel\\\":\\\"rakDokumen\\\",\\\"tipe_data\\\":\\\"STACK of string\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"dokumen\\\",\\\"tipe_data\\\":\\\"string\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"STACK of int\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"READ dokumen\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"IF rakDokumen is not empty THEN\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"dokumenKeluar = POP(rakDokumen)\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT(\\\\\\\"Dokumen yang dikeluarkan:\\\\\\\", dokumenKeluar)\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT(\\\\\\\"Sisa dokumen di rak:\\\\\\\", rakDokumen)\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"ELSE\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT(\\\\\\\"Rak kosong, tidak ada dokumen yang bisa dikeluarkan\\\\\\\")\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END IF\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 5, 1, 'easy', '2025-09-20 12:35:14', '2025-10-03 11:42:41', NULL),
('01996744-c306-7298-beec-4f93e45cfa06', '01995e0d-85fe-7041-8c7e-cdfbc81bf1ed', 'Program Tampil Pola', '<p>Susunlah algoritma berikut dengan tepat, sehingga dapat menampilkan sebuah output sebagaimana berikut :</p><p>*</p><p>***</p><p>*****</p><p>*******</p><p>*********</p>', '\"[{\\\"variabel\\\":\\\"bilangan\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"kelipatan\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"long\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"char\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"READ bilangan = 10\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"READ kelipatan = 2\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"FOR i in range(1, bilangan, kelipatan)\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT(\'*\' * i)\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"ENDFOR\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 1, 1, 'easy', '2025-09-20 13:16:23', '2025-10-02 06:54:59', NULL),
('0199674b-b207-71ea-b22e-cf9973f75db4', '01995e0d-85fe-7041-8c7e-cdfbc81bf1ed', 'Program Hitung Faktorial', '<p>Sebuah sistem dikembangkan untuk dapat melakukan perhitungan bilangan faktorial dari angka 5, yang mana memiliki rumus :</p><p><strong>n! = n * (n-1) * (n-2) * (n-3) *&nbsp;(n-4) *&nbsp;(n-5)</strong></p><p>Untuk mempermudah proses implementasi ke dalam ssource code, susunlah algoritma yang dapat menginterpretasikan perhitungan bilangan faktorial dengan tepat!</p>', '\"[{\\\"variabel\\\":\\\"nomor\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"faktorial\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"float\\\",\\\"tipe_data\\\":\\\"\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"READ nomor = 5\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"READ faktorial = 1\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"FOR i in range(1, nomor + 1)\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"faktorial *= i\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"ENDFOR\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT(f\\\\\\\"Faktorial dari {nomor} adalah {faktorial}\\\\\\\")\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 2, 1, 'easy', '2025-09-20 13:23:58', '2025-10-02 06:54:15', NULL),
('0199674e-e634-718b-beaf-d8f0d57de3f5', '01995e0d-85fe-7041-8c7e-cdfbc81bf1ed', 'Program Cetak Kata', '<p>Buatlah sebuah algoritma yang menginterpretasikan proses cetak kata <strong>Politeknik Negeri Malang</strong> sebanyak 5 baris dengan menggunakan perulangan repeat-until!</p>', '\"[{\\\"variabel\\\":\\\"kata\\\",\\\"tipe_data\\\":\\\"string\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"long\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"READ kata = \'Politeknik Negeri Malang\'\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"FOR i in range(5)\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"print(kata)\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"ENDFOR\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 3, 1, 'easy', '2025-09-20 13:27:28', '2025-10-02 06:51:44', NULL),
('01996753-90ea-7040-bb5c-7cd7ab5e6078', '01995e0d-85fe-7041-8c7e-cdfbc81bf1ed', 'Program Hitung Fibonacci', '<p>Buatlah algoritma dibawah ini menjadi algoritma yang tepat untuk menampilkan runtun <strong>Fibonacci&nbsp;</strong>yang bernilai kurang dari n!<br>Sebagaimana diketahui rumus &nbsp;<strong>Fibonacci&nbsp;</strong>adalah sebagaimana berikut:<br><strong>fn = fn-1 + fn-2</strong>, dengan n adalah bilangan bulat.</p>', '\"[{\\\"variabel\\\":\\\"n\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"fib0, fib1, fib2\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"double\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"float\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"long\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT \\\\\\\"Masukkan nilai n: \\\\\\\"\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"n = 50;\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"fib0 = 0;\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"fib1 = 1;\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT fib0, fib1\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"WHILE true\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"fib2 = fib0 + fib1\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"IF fib2 >= n THEN BREAK\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT fib2\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"fib0 = fib1\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"fib1 = fib2\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END WHILE\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 4, 1, 'easy', '2025-09-20 13:32:33', '2025-10-02 06:50:52', NULL),
('01996757-a7b5-72e7-ae2c-c91194f3357d', '01995e0d-85fe-7041-8c7e-cdfbc81bf1ed', 'Program Hitung Deret', '<p>Berikut disajikan deret angka dengan pola unik.</p><p><strong>1 2 4 8 16 32 64 128</strong></p><p>Berdasarkan pola deret di atas, buatlah susunan program sehingga memperoleh hasil penjumlahan seluruh deret diatas!</p>', '\"[{\\\"variabel\\\":\\\"deret\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"jumlahDeret\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"long\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"float\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"READ deret = [1]\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"FOR i in range(7)\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"deret.append(deret[-1] * 2)\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"READ jumlah_deret = sum(deret)\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"ENDFOR\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT(\\\\\\\"Deret angka:\\\\\\\", deret)\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT(\\\\\\\"Jumlah seluruh elemen dalam deret:\\\\\\\", jumlah_deret)\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 5, 1, 'easy', '2025-09-20 13:37:01', '2025-10-02 06:20:28', NULL),
('0199675d-4c17-7287-8ac8-1fae60417c7e', '01995e0d-85fe-7041-8c7e-cdfbc81bf1ed', 'Program Hitung ASCII', '<p>Susunlah algoritma berikut ini dengan tepat, agar nantinya dapat menghasilkan keluaran berupa daftar karakter dari suatu rentang nilai&nbsp;<strong>ASCII</strong>&nbsp;!</p>', '\"[{\\\"variabel\\\":\\\"n\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"c\\\",\\\"tipe_data\\\":\\\"char\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"long\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"READ n = 51\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"FOR c = 0 TO n DO\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT (\\\\\\\"Nilai + (int)c + memiliki keluaran karakter : \\\\\\\" +c)\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"IF(Character.isLowerCase(c)) THEN\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT (\\\\\\\"Huruf kecil\\\\\\\")\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"ENDIF\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"ENDFOR\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 6, 1, 'easy', '2025-09-20 13:43:11', '2025-10-02 06:19:45', NULL),
('01996760-3a58-7095-bfb0-d05466e817c5', '01995e0d-85fe-7041-8c7e-cdfbc81bf1ed', 'Program Hitung Kelipatan', '<p>Pilihlah algoritma di bawah ini yang paling tepat menggambarkan proses perhitungan bilangan asli kelipatan 25 dengan pola sebagaimana berikut.</p><p><strong>25 &nbsp; &nbsp; &nbsp; &nbsp;50 &nbsp; &nbsp; &nbsp;75 &nbsp; &nbsp; &nbsp;100 &nbsp; &nbsp; &nbsp;125</strong></p><p><strong>25*1 &nbsp; &nbsp;25*2 &nbsp; 25*3 &nbsp; &nbsp;25*4 &nbsp; 25*5&nbsp;&nbsp;</strong></p><p>Dengan jumlah bilangan asli ditentukan sebanyak 5.<br>Noted : Jika i mewakili urutan suku, maka suku ke−<strong>i&nbsp;</strong>adalah&nbsp;<strong>Ui</strong>&nbsp;yang mempunyai pola&nbsp;<strong>Ui</strong>&nbsp;= 25 * i.</p>', '\"[{\\\"variabel\\\":\\\"jumlah_bilangan_asli\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"ui\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"long\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"float\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"READ jumlah_bilangan_asli = 5\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"FOR i in range(1, jumlah_bilangan_asli + 1)\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"READ ui = 25 * i\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT (f\\\\\\\"U{i} = 25 * {i} = {Ui}\\\\\\\")\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"ENDFOR\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 7, 1, 'easy', '2025-09-20 13:46:23', '2025-10-02 06:14:59', NULL),
('01996765-71ea-7079-8d2d-573093f98e7c', '01995e12-4580-7361-b0d1-379bdea0b2b6', 'Program Kondisi Lampu', '<p>Kamu adalah pengendara sepeda motor yang sedang melintas di jalan raya dan bertemu lampu lalu lintas. Susunlah algoritma pseudocode untuk menentukan apa yang harus kamu lakukan untuk setiap kondisi lampu lalu lintas!</p>', '\"[{\\\"variabel\\\":\\\"warna\\\",\\\"tipe_data\\\":\\\"string\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"tindakan\\\",\\\"tipe_data\\\":\\\"string\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"char\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"varchar\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT \\\\u201cmasukkan warna\\\\u201d\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"READ warna = Merah\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"Switch (warna)\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"case \\\\u201cmerah\\\\u201d\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"tindakan = \\\\u201cberhenti\\\\u201d\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"break\\\",\\\"clue\\\":1,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"case \\\\u201ckuning\\\\u201d\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"tindakan = \\\\u201chati-hati\\\\u201d\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"break\\\",\\\"clue\\\":1,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"case \\\\u201chijau\\\\u201d\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"tindakan = \\\\u201chati-hati\\\\u201d\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"break\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"Default\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"tindakan = \\\\u201cwarna yang anda inputkan salah\\\\u201d\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"break\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"ENDSWITCH\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT +tindakan\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 1, 1, 'easy', '2025-09-20 13:52:05', '2025-10-02 07:02:14', NULL),
('01996ac8-52d1-7171-9a2e-5455ae83c2b1', '01995e13-29af-7010-8995-1a40e4504851', 'Penjumlahan Elemen Array', '<p>Tuliskan algoritma pseudocode untuk <strong>menjumlahkan semua elemen pada array</strong>. Jumlah array yang akan disimpan adalah 5. Masukkan 5 elemen array :</p><ol><li>Elemen ke-0 : 20</li><li>Elemen ke-1 : 5</li><li>Elemen ke-2 : 25</li><li>Elemen ke-3 : 8</li><li>Elemen ke-4 : 3</li></ol><p><br>&nbsp;</p>', '\"[{\\\"variabel\\\":\\\"nilai\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"total_sum\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"double\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"float\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"READ nilai[5]={20,5,25,8,3}\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"FOR i, value in enumerate(nilai)\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"print(f\\\\\\\"Elemen ke-{i}: {value}\\\\\\\")\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"ENDFOR\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"total_sum = 0\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"FOR num in nilai\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"READ total_sum += num\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"ENDFOR\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT(f\\\\\\\"\\\\\\\\Jumlah semua elemen pada array adalah: {total_sum}\\\\\\\")\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 1, 1, 'easy', '2025-09-21 05:38:57', '2025-10-03 11:04:21', NULL),
('01996acc-ed8f-7078-84c5-e827079e6360', '01985f44-f662-72f9-a85b-a7b256942492', 'Konversi Bilangan Desimal', '<p>Lakukan konversi bilangan desimal “60” ke dalam biner menggunakan konsep Stack!</p>', '\"[{\\\"variabel\\\":\\\"desimal\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"sisa\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"stackBiner\\\",\\\"tipe_data\\\":\\\"STACK of Integer\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"bit\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"float\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"STACK of float\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"top\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"READ desimal = 60\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"INISIALISASI stackBiner = kosong\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"top \\\\u2190 -1\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"WHILE desimal > 0 DO\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"sisa \\\\u2190 desimal % 2\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PUSH(stackBiner, sisa)\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"desimal \\\\u2190 desimal DIV 2\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END WHILE\\\",\\\"clue\\\":1,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"WHILE stackBiner not empty DO\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"bit \\\\u2190 POP(stackBiner)\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT(bit)\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END WHILE\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 6, 1, 'easy', '2025-09-21 05:43:59', '2025-10-03 11:24:06', NULL),
('01996adc-1108-70fc-b2c8-3a9836158a03', '01995e13-29af-7010-8995-1a40e4504851', 'Mengakses Nilai Array', '<p>Diketahui sebuah agensi memiliki 5 artis yang sangat terkenal. 5 artis tersebut adalah Suzy, Song Hye Kyo, Lee Minho, Yoona, Junho. Anggap artis tersebut sebagai deret array dan buatlah pseudocode untuk <strong>mengakses nilai indeks pada array </strong>tersebut dengan menggunakan <strong>metode perulangan</strong>.</p>', '\"[{\\\"variabel\\\":\\\"artis\\\",\\\"tipe_data\\\":\\\"string\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"varchar\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"long\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"artis = [\\\\\\\"Suzy\\\\\\\", \\\\\\\"Song Hye Kyo\\\\\\\", \\\\\\\"Lee Minho\\\\\\\", \\\\\\\"Yoona\\\\\\\", \\\\\\\"Junho\\\\\\\"]\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"FOR i in range(len(artis))\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT(\\\\\\\"Indeks\\\\\\\", i, \\\\\\\":\\\\\\\", artis[i])\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END FOR\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 2, 1, 'easy', '2025-09-21 06:00:31', '2025-10-03 11:03:31', NULL),
('01996adf-b46d-73b2-8cdc-434273bd18c8', '01995e13-29af-7010-8995-1a40e4504851', 'Menampilkan Elemen Array', '<p>Buatlah sebuah&nbsp;pseudocode yang&nbsp;menampilkan <strong>7 </strong>elemen array <strong>1, 3, 5, 7, 9, 11, 13.</strong></p>', '\"[{\\\"variabel\\\":\\\"array\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"elemen\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"varchar\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"READ array = [1, 3, 5, 7, 9, 11, 13]\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"FOR i = 0 to len(array)-1\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"elemen = array[i]\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT(elemen)\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END FOR\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 3, 1, 'easy', '2025-09-21 06:04:29', '2025-10-03 11:02:10', NULL),
('01996ae3-7692-722e-b457-fff0ed70eecf', '01995e13-29af-7010-8995-1a40e4504851', 'Menghitung Rata-rata Bilangan', '<p>Buatlah pseudocode untuk menghitung <strong>rata-rata bilangan&nbsp;{10,11,12,13,14,15}.</strong></p>', '\"[{\\\"variabel\\\":\\\"bilangan\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"jumlah_bilangan\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"total_nilai\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"rata_rata\\\",\\\"tipe_data\\\":\\\"float\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"double\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"READ bilangan = [10, 11, 12, 13, 14, 15]\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"READ jumlah_bilangan = len(bilangan)\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"total_nilai = 0;\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"FOR setiap n dalam bilangan\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"total_nilai += n;\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END FOR\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"rata_rata = total_nilai \\\\/ jumlah_bilangan\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT(\\\\\\\"Bilangan:\\\\\\\")\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"FOR setiap n dalam bilangan\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT(n)\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END FOR\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT(\\\\\\\"Jumlah bilangan:\\\\\\\", jumlah_bilangan)\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT(\\\\\\\"Total nilai:\\\\\\\", total_nilai)\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT(\\\\\\\"Rata-rata:\\\\\\\", rata_rata)\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 4, 1, 'easy', '2025-09-21 06:08:35', '2025-10-03 10:46:41', NULL);
INSERT INTO `soal` (`id`, `id_level`, `judul`, `soal`, `kunci_tipe_data`, `kunci_algoritma`, `order`, `status`, `difficulty`, `created_at`, `updated_at`, `deleted_at`) VALUES
('01996ae7-0dd8-723c-b978-0f3bae73aaa1', '01995e13-29af-7010-8995-1a40e4504851', 'Mencari Nilai Max & Min', '<p>Buatlah pseudocode untuk mencari <strong>nilai maximum </strong>dan <strong>nilai minimum </strong>dari bilangan<strong> 1 sampai 10</strong>.</p>', '\"[{\\\"variabel\\\":\\\"bilangan\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"nilai_max\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"nilai_min\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"float\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"string\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"READ bilangan = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"nilai_max = bilangan[0]\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"nilai_min = bilangan[0]\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"FOR i = 1 TO panjang(bilangan) - 1\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"IF bilangan[i] > nilai_max THEN nilai_max = bilangan[i]\\\",\\\"clue\\\":1,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"IF bilangan[i] < nilai_min THEN nilai_min = bilangan[i]\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END FOR\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT(\\\\\\\"Bilangan: \\\\\\\", bilangan)\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT(\\\\\\\"Nilai maksimum: \\\\\\\", nilai_max)\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT(\\\\\\\"Nilai minimum: \\\\\\\", nilai_min)\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 5, 1, 'easy', '2025-09-21 06:12:31', '2025-10-03 02:10:55', NULL),
('01996aec-ffe3-721f-8360-88d4c75ef217', '01996adc-c3ca-712b-abc0-933c691ccfc8', 'Membuat List Harga', '<p>Seorang pegawai apotek sedang mendata <strong>daftar harga obat-obatan </strong>yang baru saja dikirim oleh distributor. Pegawai itu kewalahan dengan tugas tersebut. Bantulah pegawai apotek itu untuk mempermudah tugasnya dengan membuat sebuah algoritma pseudocode untuk <strong>mendata daftar harga obat-obatan.</strong></p>', '\"[{\\\"variabel\\\":\\\"arrObat\\\",\\\"tipe_data\\\":\\\"int\\\"},{\\\"variabel\\\":\\\"x, y\\\",\\\"tipe_data\\\":\\\"int\\\"},{\\\"variabel\\\":\\\"harga\\\",\\\"tipe_data\\\":\\\"int\\\"},{\\\"variabel\\\":\\\"obat\\\",\\\"tipe_data\\\":\\\"string\\\"},{\\\"variabel\\\":null,\\\"tipe_data\\\":\\\"double\\\"},{\\\"variabel\\\":null,\\\"tipe_data\\\":\\\"char\\\"}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":\\\"0\\\"},{\\\"langkah\\\":\\\"READ arrObat : [ 1...4 , 1...2]\\\",\\\"clue\\\":\\\"0\\\"},{\\\"langkah\\\":\\\"FOR( y = 1; y \\\\u2190 2; y++)\\\",\\\"clue\\\":\\\"0\\\"},{\\\"langkah\\\":\\\"IF y = 1 then\\\",\\\"clue\\\":\\\"1\\\"},{\\\"langkah\\\":\\\"arrObat [x,y] = obat\\\",\\\"clue\\\":\\\"1\\\"},{\\\"langkah\\\":\\\"ELSE\\\",\\\"clue\\\":\\\"0\\\"},{\\\"langkah\\\":\\\"WRITE \\\\\\\"Masukkan nama obat : \\\\\\\"\\\",\\\"clue\\\":\\\"0\\\"},{\\\"langkah\\\":\\\"WRITE \\\\\\\"Masukkan harga : \\\\\\\"\\\",\\\"clue\\\":\\\"0\\\"},{\\\"langkah\\\":\\\"READ(obat)\\\",\\\"clue\\\":\\\"0\\\"},{\\\"langkah\\\":\\\"ENDIF\\\",\\\"clue\\\":\\\"0\\\"},{\\\"langkah\\\":\\\"ENDFOR\\\",\\\"clue\\\":\\\"1\\\"},{\\\"langkah\\\":\\\"FOR( x = 1; x \\\\u2190 4; x++)\\\",\\\"clue\\\":\\\"0\\\"},{\\\"langkah\\\":\\\"arrObat [x,y] = harga\\\",\\\"clue\\\":\\\"0\\\"},{\\\"langkah\\\":\\\"READ(harga)\\\",\\\"clue\\\":\\\"0\\\"},{\\\"langkah\\\":\\\"ENDFOR\\\",\\\"clue\\\":\\\"0\\\"},{\\\"langkah\\\":\\\"FOR( x = 1; x \\\\u2190 4; x++)\\\",\\\"clue\\\":\\\"0\\\"},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":\\\"0\\\"}]\"', 1, 1, 'easy', '2025-09-21 06:19:00', '2025-10-02 05:24:15', NULL),
('01996af5-12df-73f8-9c0c-0073a3ca35fa', '01996adc-c3ca-712b-abc0-933c691ccfc8', 'Array Bubble Sort', '<p>Seorang dosen sedang mengoreksi hasil ujian mahasiswanya. Dosen itu ingin mengurutkan hasil ujian tersebut dari nilai yang terkecil hingga ke nilai yang terbesar. Buatlah algoritma pseudocode untuk membantu dosen itu dalam mengurutkan nilai hasil ujian tersebut. Berikut adalah hasil nilai dari ujian yang telah dikoreksi oleh dosen itu :</p><ol><li>98</li><li>60</li><li>90</li><li>50</li><li>82</li><li>80</li><li>75</li><li>68</li></ol>', '\"[{\\\"variabel\\\":\\\"nilai\\\",\\\"tipe_data\\\":\\\"int\\\"},{\\\"variabel\\\":\\\"n, temp\\\",\\\"tipe_data\\\":\\\"int\\\"},{\\\"variabel\\\":null,\\\"tipe_data\\\":\\\"double\\\"},{\\\"variabel\\\":null,\\\"tipe_data\\\":\\\"float\\\"}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":\\\"0\\\"},{\\\"langkah\\\":\\\"READ nilai[] = {98,60,90,50,82,80,75,68}\\\",\\\"clue\\\":\\\"0\\\"},{\\\"langkah\\\":\\\"READ n = nilai.length\\\",\\\"clue\\\":\\\"0\\\"},{\\\"langkah\\\":\\\"READ temp = 0\\\",\\\"clue\\\":\\\"1\\\"},{\\\"langkah\\\":\\\"FOR(int i=0; n > i; i++)\\\",\\\"clue\\\":\\\"0\\\"},{\\\"langkah\\\":\\\"FOR(int j=0; (n-i) > j; j++)\\\",\\\"clue\\\":\\\"1\\\"},{\\\"langkah\\\":\\\"temp = nilai[j-1]\\\",\\\"clue\\\":\\\"0\\\"},{\\\"langkah\\\":\\\"IF(nilai[j-1] > nilai[j])\\\",\\\"clue\\\":\\\"0\\\"},{\\\"langkah\\\":\\\"nilai[j] = temp\\\",\\\"clue\\\":\\\"0\\\"},{\\\"langkah\\\":\\\"nilai[j-1] = nilai[j]\\\",\\\"clue\\\":\\\"0\\\"},{\\\"langkah\\\":\\\"ENDIF\\\",\\\"clue\\\":\\\"0\\\"},{\\\"langkah\\\":\\\"ENDFOR\\\",\\\"clue\\\":\\\"1\\\"},{\\\"langkah\\\":\\\"ENDFOR\\\",\\\"clue\\\":\\\"1\\\"},{\\\"langkah\\\":\\\"PRINT(\\\\\\\"Hasil pengurutan : \\\\\\\")\\\",\\\"clue\\\":\\\"1\\\"},{\\\"langkah\\\":\\\"FOR(int i=0; n > i; i++)\\\",\\\"clue\\\":\\\"0\\\"},{\\\"langkah\\\":\\\"ENDFOR\\\",\\\"clue\\\":\\\"0\\\"},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":\\\"0\\\"}]\"', 2, 1, 'easy', '2025-09-21 06:27:50', '2025-10-02 05:24:15', NULL),
('01996af7-42d4-7153-b63a-9fec9d10e693', '01996adc-c3ca-712b-abc0-933c691ccfc8', 'Menghitung Panjang Array', '<p>Sebuah array memiliki<strong> nilai = 100</strong>. Buatlah pseudocode untuk <strong>menghitung panjang array </strong>tersebut.</p><p><br>&nbsp;</p>', '\"[{\\\"variabel\\\":\\\"nilai\\\",\\\"tipe_data\\\":\\\"int\\\"},{\\\"variabel\\\":\\\"i\\\",\\\"tipe_data\\\":\\\"int\\\"},{\\\"variabel\\\":null,\\\"tipe_data\\\":\\\"char\\\"},{\\\"variabel\\\":null,\\\"tipe_data\\\":\\\"double\\\"}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":\\\"0\\\"},{\\\"langkah\\\":\\\"READ nilai[] = [100]\\\",\\\"clue\\\":\\\"0\\\"},{\\\"langkah\\\":\\\"FOR (int i=0; nilai.length > i; i++)\\\",\\\"clue\\\":\\\"0\\\"},{\\\"langkah\\\":\\\"PRINT(nilai[i])\\\",\\\"clue\\\":\\\"0\\\"},{\\\"langkah\\\":\\\"ENDFOR\\\",\\\"clue\\\":\\\"0\\\"},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":\\\"0\\\"}]\"', 3, 1, 'easy', '2025-09-21 06:30:13', '2025-10-02 05:24:15', NULL),
('01996afd-9d63-7265-9473-7d68b483925a', '01996adc-c3ca-712b-abc0-933c691ccfc8', 'Menghitung Bialangan Genap Ganjil', '<p>Buatlah algoritma pseudocode untuk <strong>menghitung bilangan genap dan ganjil </strong>dari angka <strong>1 - 20</strong>!</p><p><br>&nbsp;</p>', '\"[{\\\"variabel\\\":\\\"arr\\\",\\\"tipe_data\\\":\\\"int\\\"},{\\\"variabel\\\":\\\"i, ganjil, genap\\\",\\\"tipe_data\\\":\\\"int\\\"},{\\\"variabel\\\":null,\\\"tipe_data\\\":\\\"long\\\"}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":\\\"0\\\"},{\\\"langkah\\\":\\\"READ arr[] = {1,......,20}\\\",\\\"clue\\\":\\\"1\\\"},{\\\"langkah\\\":\\\"READ ganjil, genap=0\\\",\\\"clue\\\":\\\"0\\\"},{\\\"langkah\\\":\\\"FOR ( i=0; 20 > i; i++)\\\",\\\"clue\\\":\\\"0\\\"},{\\\"langkah\\\":\\\"IF (arr[i]%2 == 0)\\\",\\\"clue\\\":\\\"1\\\"},{\\\"langkah\\\":\\\"ELSE IF\\\",\\\"clue\\\":\\\"0\\\"},{\\\"langkah\\\":\\\"ENDIF\\\",\\\"clue\\\":\\\"0\\\"},{\\\"langkah\\\":\\\"PRINT(ganjil)\\\",\\\"clue\\\":\\\"0\\\"},{\\\"langkah\\\":\\\"PRINT(genap)\\\",\\\"clue\\\":\\\"0\\\"},{\\\"langkah\\\":\\\"PRINT (\\\\\\\"Bilangan genap \\\\\\\"+ genap)\\\",\\\"clue\\\":\\\"0\\\"},{\\\"langkah\\\":\\\"PRINT (\\\\\\\"Bilangan ganjil \\\\\\\" + ganjil)\\\",\\\"clue\\\":\\\"0\\\"},{\\\"langkah\\\":\\\"ENDFOR\\\",\\\"clue\\\":\\\"0\\\"},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":\\\"0\\\"}]\"', 4, 1, 'easy', '2025-09-21 06:37:09', '2025-10-02 05:24:15', NULL),
('01996b02-d6e9-734c-8cec-050b98e85bc1', '01996adc-c3ca-712b-abc0-933c691ccfc8', 'Perkalian Matriks', '<p>Buatlah algoritma pseudocode untuk mengalikan dua matriks dengan 3 baris dan 3 kolom.</p>', '\"[{\\\"variabel\\\":\\\"i,j,k\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"matriksA, matriksB\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"hasil\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":1},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"float\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"\\\",\\\"tipe_data\\\":\\\"double\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"READ matriksA = {{2,2,2},{3,3,3},{4,4,4}}\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"READ matriksB = {{2,2,2},{3,3,3},{4,4,4}}\\\",\\\"clue\\\":1,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"READ hasil[][]=[3][3]\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"READ i, j, k\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"FOR(i=0; 3>i; i++)\\\",\\\"clue\\\":1,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"FOR(j=0; 3>j; j++)\\\",\\\"clue\\\":1,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"hasil[i][j] = 0\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"FOR(k=0; 3>k; k++)\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"hasil[i][j] += matriksA[i][k]*matriksB[k][j]\\\",\\\"clue\\\":0,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"ENDFOR\\\",\\\"clue\\\":1,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"PRINT(hasil[i][j])\\\",\\\"clue\\\":1,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"ENDFOR\\\",\\\"clue\\\":1,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"ENDFOR\\\",\\\"clue\\\":1,\\\"konversi\\\":1},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 5, 1, 'easy', '2025-09-21 06:42:52', '2025-10-03 11:15:40', NULL),
('41328240-54a8-11f1-914b-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', 'Antrian Loket Karcis Bioskop', '<p>Sebuah bioskop membuka satu loket karcis. Tiga orang datang berurutan: Rina, Doni, lalu Yudi. Setelah ketiganya mengantri, petugas ingin mengetahui siapa yang berada paling depan antrian dan berapa total orang yang sedang mengantri.</p>\r\n<p>Tentukan siapa yang berada di posisi FRONT antrian dan berapa SIZE antrian setelah ketiga orang tersebut masuk.</p>', '\"[{\\\"variabel\\\":\\\"antrian\\\",\\\"tipe_data\\\":\\\"Queue\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Deklarasikan antrian sebagai Queue kosong\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"ENQUEUE(Rina) -> antrian=[Rina]\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"ENQUEUE(Doni) -> antrian=[Rina,Doni]\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"ENQUEUE(Yudi) -> antrian=[Rina,Doni,Yudi]\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT FRONT(antrian) -> Rina\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT SIZE(antrian) -> 3\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"FIFO: Rina masuk pertama maka Rina berada di depan dan keluar pertama\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 1, 1, 'easy', '2026-05-21 00:01:45', '2026-05-21 00:01:45', NULL),
('4132be1e-54a8-11f1-914b-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', 'Antrian Pasien Klinik', '<p>Sebuah klinik menerima tiga pasien secara berurutan dengan nomor antrian 101, 102, dan 103. Resepsionis ingin menampilkan nomor pasien yang berada paling depan (FRONT), paling belakang (REAR), dan total pasien yang sedang mengantri.</p>\r\n<p>Tentukan nilai FRONT, REAR, dan SIZE dari antrian tersebut.</p>', '\"[{\\\"variabel\\\":\\\"antrian\\\",\\\"tipe_data\\\":\\\"Queue\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Deklarasikan antrian kosong\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"ENQUEUE(101) -> antrian=[101], front=101, rear=101\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"ENQUEUE(102) -> antrian=[101,102], front=101, rear=102\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"ENQUEUE(103) -> antrian=[101,102,103], front=101, rear=103\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT FRONT -> 101\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT REAR  -> 103\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT SIZE  -> 3\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 2, 1, 'easy', '2026-05-21 00:01:45', '2026-05-21 00:01:45', NULL),
('4132c385-54a8-11f1-914b-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', 'Antrian Pengambilan Obat', '<p>Apotek rumah sakit mencatat antrian pengambilan obat satu per satu. Pasien pertama bernama Siti, kemudian Bagas, lalu Citra. Setiap kali seorang pasien masuk antrian, sistem langsung mencetak isi antrian beserta jumlahnya.</p>\r\n<p>Tentukan output yang dicetak sistem setelah setiap operasi ENQUEUE.</p>', '\"[{\\\"variabel\\\":\\\"antrian\\\",\\\"tipe_data\\\":\\\"Queue\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Deklarasikan antrian kosong\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"ENQUEUE(Siti) -> antrian=[Siti]\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT Antrian: [Siti] Ukuran: 1\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"ENQUEUE(Bagas) -> antrian=[Siti,Bagas]\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT Antrian: [Siti,Bagas] Ukuran: 2\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"ENQUEUE(Citra) -> antrian=[Siti,Bagas,Citra]\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT Antrian: [Siti,Bagas,Citra] Ukuran: 3\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Setiap ENQUEUE elemen masuk dari posisi REAR (belakang)\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 3, 1, 'easy', '2026-05-21 00:01:45', '2026-05-21 00:01:45', NULL),
('4132c5c4-54a8-11f1-914b-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', 'Loket Bank Belum Buka', '<p>Sebelum loket bank dibuka, sistem memeriksa apakah antrian kosong menggunakan fungsi ISEMPTY. Setelah loket dibuka, dua nasabah dengan nomor 201 dan 202 mendaftar. Sistem kembali memeriksa kondisi antrian, jumlah nasabah, dan nomor nasabah terdepan.</p>\r\n<p>Tentukan seluruh output yang dihasilkan sistem secara berurutan.</p>', '\"[{\\\"variabel\\\":\\\"antrian\\\",\\\"tipe_data\\\":\\\"Queue\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Deklarasikan antrian kosong\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT ISEMPTY(antrian) -> TRUE\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"ENQUEUE(201) -> antrian=[201]\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"ENQUEUE(202) -> antrian=[201,202]\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT ISEMPTY(antrian) -> FALSE\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT SIZE(antrian) -> 2\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT FRONT(antrian) -> 201\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"ISEMPTY=TRUE jika tidak ada elemen, FALSE jika ada elemen\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 4, 1, 'easy', '2026-05-21 00:01:45', '2026-05-21 00:01:45', NULL),
('4132c7da-54a8-11f1-914b-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', 'Antrian Wahana Taman Bermain', '<p>Sebuah wahana taman bermain menerima tiga pengunjung secara berurutan dengan nomor tiket 7, 8, dan 9. Petugas ingin mengetahui siapa yang paling depan, paling belakang, total pengunjung dalam antrian, dan apakah antrian sudah kosong.</p>\r\n<p>Tentukan nilai FRONT, REAR, SIZE, dan ISEMPTY dari antrian tersebut.</p>', '\"[{\\\"variabel\\\":\\\"antrian\\\",\\\"tipe_data\\\":\\\"Queue\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Deklarasikan antrian kosong\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"ENQUEUE(7) -> antrian=[7]\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"ENQUEUE(8) -> antrian=[7,8]\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"ENQUEUE(9) -> antrian=[7,8,9]\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT FRONT  : 7\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT REAR   : 9\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT SIZE   : 3\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT ISEMPTY: FALSE\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 5, 1, 'easy', '2026-05-21 00:01:45', '2026-05-21 00:01:45', NULL),
('4132cb0f-54a8-11f1-914b-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', 'Memanggil Pasien Pertama di Puskesmas', '<p>Puskesmas memiliki antrian tiga pasien: Hendra (depan), Lestari, dan Miko (belakang). Dokter memanggil satu pasien dari antrian menggunakan operasi DEQUEUE. Sistem mencatat pasien yang dipanggil, sisa antrian, pasien terdepan yang baru, dan jumlah antrian setelah pemanggilan.</p>\r\n<p>Tentukan nilai variabel yang menyimpan hasil DEQUEUE, sisa isi antrian, FRONT yang baru, dan SIZE yang baru.</p>', '\"[{\\\"variabel\\\":\\\"antrian\\\",\\\"tipe_data\\\":\\\"Queue\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"dipanggil\\\",\\\"tipe_data\\\":\\\"String\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"antrian=[Hendra,Lestari,Miko]\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"dipanggil=DEQUEUE -> dipanggil=Hendra, antrian=[Lestari,Miko]\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT Dipanggil  : Hendra\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT Sisa       : [Lestari,Miko]\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT FRONT baru : Lestari\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT SIZE baru  : 2\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"DEQUEUE mengambil elemen dari posisi FRONT (depan)\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 1, 1, 'medium', '2026-05-21 00:01:45', '2026-05-21 00:01:45', NULL),
('4132ce14-54a8-11f1-914b-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', 'Melayani Seluruh Antrian Kasir Supermarket', '<p>Kasir supermarket memiliki antrian lima pembeli dengan nomor 1 hingga 5, di mana nomor 1 berada paling depan. Kasir melayani pembeli satu per satu dari depan antrian hingga antrian benar-benar kosong. Setiap kali pembeli dilayani, sistem mencetak nomor pembeli yang dilayani beserta sisa antrian.</p>\r\n<p>Tentukan seluruh output yang dicetak sistem dari awal hingga akhir secara berurutan.</p>', '\"[{\\\"variabel\\\":\\\"antrian\\\",\\\"tipe_data\\\":\\\"Queue\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"pembeli\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"antrian=[1,2,3,4,5]\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Iterasi 1: pembeli=1, PRINT Dilayani:1 Sisa:4\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Iterasi 2: pembeli=2, PRINT Dilayani:2 Sisa:3\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Iterasi 3: pembeli=3, PRINT Dilayani:3 Sisa:2\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Iterasi 4: pembeli=4, PRINT Dilayani:4 Sisa:1\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Iterasi 5: pembeli=5, PRINT Dilayani:5 Sisa:0\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT Antrian telah kosong\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 2, 1, 'medium', '2026-05-21 00:01:45', '2026-05-21 00:01:45', NULL),
('4132d089-54a8-11f1-914b-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', 'Antrian Pendaftaran Lomba Bergantian', '<p>Panitia lomba membuka pendaftaran secara bertahap. Peserta A dan B mendaftar, lalu peserta A dipanggil untuk verifikasi berkas. Kemudian peserta C mendaftar, lalu peserta B dipanggil. Terakhir peserta D mendaftar. Sistem mencatat nilai peserta yang dipanggil di setiap tahap dan menampilkan isi antrian akhir.</p>\r\n<p>Telusuri setiap langkah. Tentukan siapa peserta pertama dan kedua yang dipanggil (variabel a dan b), serta siapa saja yang masih mengantri di akhir beserta jumlahnya.</p>', '\"[{\\\"variabel\\\":\\\"antrian\\\",\\\"tipe_data\\\":\\\"Queue\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"a\\\",\\\"tipe_data\\\":\\\"String\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"b\\\",\\\"tipe_data\\\":\\\"String\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"ENQUEUE(A) -> antrian=[A]\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"ENQUEUE(B) -> antrian=[A,B]\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"a=DEQUEUE -> a=A, antrian=[B]\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"ENQUEUE(C) -> antrian=[B,C]\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"b=DEQUEUE -> b=B, antrian=[C]\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"ENQUEUE(D) -> antrian=[C,D]\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT a         : A\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT b         : B\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT Isi akhir : [C,D]\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT SIZE      : 2\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 3, 0, 'medium', '2026-05-21 00:01:45', '2026-05-21 10:17:14', NULL),
('4132d2dd-54a8-11f1-914b-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', 'Membalik Urutan Antrian Peserta Ujian', '<p>Lima peserta ujian mengantri dengan urutan nomor 1 hingga 5, di mana nomor 1 berada paling depan. Panitia ingin membalik urutan antrian agar peserta yang terakhir datang dipanggil pertama. Tekniknya: semua peserta dipindahkan ke Stack satu per satu, lalu dikembalikan ke Queue dari Stack.</p>\r\n<p>Telusuri setiap langkah pemindahan. Tentukan isi antrian sebelum dan sesudah proses pembalikan dilakukan.</p>', '\"[{\\\"variabel\\\":\\\"antrian\\\",\\\"tipe_data\\\":\\\"Queue\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"tumpukan\\\",\\\"tipe_data\\\":\\\"Stack\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"antrian=[1,2,3,4,5], tumpukan=[]\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT Sebelum: [1,2,3,4,5]\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Pindah ke Stack: DEQUEUE 1->PUSH, DEQUEUE 2->PUSH, dst\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"tumpukan=[1,2,3,4,5] top=5\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Kembalikan ke Queue: POP 5->ENQUEUE, POP 4->ENQUEUE, dst\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"antrian=[5,4,3,2,1]\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT Sesudah: [5,4,3,2,1]\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 4, 1, 'medium', '2026-05-21 00:01:45', '2026-05-21 00:01:45', NULL),
('4132d4eb-54a8-11f1-914b-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', 'Cek Palindrom Plat Nomor Kendaraan', '<p>Petugas parkir ingin mengecek apakah plat nomor kendaraan <strong>\"CIVIC\"</strong> merupakan palindrom (terbaca sama dari depan maupun belakang). Setiap karakter plat dimasukkan ke Queue dan Stack sekaligus, kemudian karakter hasil DEQUEUE dari Queue dibandingkan dengan hasil POP dari Stack satu per satu.</p>\r\n<p>Telusuri setiap langkah perbandingan dan tentukan apakah \"CIVIC\" merupakan palindrom.</p>', '\"[{\\\"variabel\\\":\\\"antrian\\\",\\\"tipe_data\\\":\\\"Queue\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"tumpukan\\\",\\\"tipe_data\\\":\\\"Stack\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"isPalindrom\\\",\\\"tipe_data\\\":\\\"boolean\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"kata=CIVIC\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"ENQUEUE+PUSH C,I,V,I,C\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"antrian=[C,I,V,I,C], tumpukan top=C\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Bandingkan: DEQUEUE=C vs POP=C -> sama\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Bandingkan: DEQUEUE=I vs POP=I -> sama\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Bandingkan: DEQUEUE=V vs POP=V -> sama\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Bandingkan: DEQUEUE=I vs POP=I -> sama\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Bandingkan: DEQUEUE=C vs POP=C -> sama\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"isPalindrom=TRUE\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT Palindrom: TRUE\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 5, 1, 'medium', '2026-05-21 00:01:45', '2026-05-21 00:01:45', NULL),
('4132d6e3-54a8-11f1-914b-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', 'Pencarian Nomor Antrian di Rumah Sakit', '<p>Sistem antrian rumah sakit menyimpan nomor pasien <strong>[11, 22, 33, 44, 55]</strong> dalam sebuah Queue. Petugas ingin mencari apakah pasien dengan nomor <strong>33</strong> ada di antrian menggunakan sequential search. Setiap elemen yang diperiksa dipindahkan ke Queue sementara agar antrian asli dapat dipulihkan setelah pencarian selesai.</p>\r\n<p>Telusuri setiap langkah pencarian dan tentukan apakah nomor 33 ditemukan serta kondisi antrian setelah proses selesai.</p>', '\"[{\\\"variabel\\\":\\\"antrian\\\",\\\"tipe_data\\\":\\\"Queue\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"sementara\\\",\\\"tipe_data\\\":\\\"Queue\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"ditemukan\\\",\\\"tipe_data\\\":\\\"boolean\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"elemen\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"antrian=[11,22,33,44,55], cari=33, ditemukan=FALSE\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Iterasi 1: elemen=11, 11!=33, ENQUEUE(sementara,11)\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Iterasi 2: elemen=22, 22!=33, ENQUEUE(sementara,22)\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Iterasi 3: elemen=33, 33=33, ditemukan=TRUE, ENQUEUE(sementara,33)\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Iterasi 4: elemen=44, 44!=33, ENQUEUE(sementara,44)\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Iterasi 5: elemen=55, 55!=33, ENQUEUE(sementara,55)\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Kembalikan sementara ke antrian\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT Ditemukan: TRUE\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT Antrian  : [11,22,33,44,55]\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 1, 1, 'hard', '2026-05-21 00:01:45', '2026-05-21 00:01:45', NULL),
('4132d8d2-54a8-11f1-914b-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', 'Mencari Stok Minimum di Gudang', '<p>Sistem gudang menyimpan data stok barang dalam antrian: <strong>[50, 20, 80, 10, 60]</strong> di mana 50 adalah data terdepan. Manajer gudang ingin mencari nilai stok paling sedikit menggunakan sequential search. Setiap elemen yang diperiksa disimpan ke Queue sementara agar data antrian dapat dikembalikan setelah pencarian selesai.</p>\r\n<p>Telusuri setiap langkah perbandingan. Tentukan nilai minimum stok dan kondisi antrian setelah proses selesai.</p>', '\"[{\\\"variabel\\\":\\\"antrian\\\",\\\"tipe_data\\\":\\\"Queue\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"sementara\\\",\\\"tipe_data\\\":\\\"Queue\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"minimum\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"elemen\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"antrian=[50,20,80,10,60], minimum=50\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Iterasi 1: elemen=50, 50<50 FALSE, minimum=50\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Iterasi 2: elemen=20, 20<50 TRUE, minimum=20\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Iterasi 3: elemen=80, 80<20 FALSE, minimum=20\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Iterasi 4: elemen=10, 10<20 TRUE, minimum=10\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Iterasi 5: elemen=60, 60<10 FALSE, minimum=10\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Kembalikan sementara ke antrian\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT Minimum: 10\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT Antrian: [50,20,80,10,60]\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 2, 1, 'hard', '2026-05-21 00:01:45', '2026-05-21 00:01:45', NULL),
('4132db18-54a8-11f1-914b-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', 'Menghitung Frekuensi Kehadiran Siswa', '<p>Sistem absensi mencatat ID kelas siswa yang hadir dalam satu sesi: <strong>[2, 5, 2, 3, 2, 5, 4]</strong>. Wali kelas ingin menghitung berapa kali siswa dengan ID kelas <strong>2</strong> hadir menggunakan sequential search. Setiap data yang diperiksa dipindahkan ke Queue sementara agar data absensi dapat dipulihkan setelah penghitungan selesai.</p>\r\n<p>Telusuri setiap langkah dan tentukan berapa kali ID 2 muncul serta kondisi antrian setelah proses selesai.</p>', '\"[{\\\"variabel\\\":\\\"antrian\\\",\\\"tipe_data\\\":\\\"Queue\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"sementara\\\",\\\"tipe_data\\\":\\\"Queue\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"frekuensi\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"elemen\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"antrian=[2,5,2,3,2,5,4], cari=2, frekuensi=0\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Iterasi 1: elemen=2, 2=2 TRUE, frekuensi=1\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Iterasi 2: elemen=5, 5=2 FALSE\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Iterasi 3: elemen=2, 2=2 TRUE, frekuensi=2\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Iterasi 4: elemen=3, 3=2 FALSE\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Iterasi 5: elemen=2, 2=2 TRUE, frekuensi=3\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Iterasi 6: elemen=5, 5=2 FALSE\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Iterasi 7: elemen=4, 4=2 FALSE\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Kembalikan sementara ke antrian\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT Frekuensi 2 : 3\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT Antrian     : [2,5,2,3,2,5,4]\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 3, 1, 'hard', '2026-05-21 00:01:45', '2026-05-21 00:01:45', NULL),
('4132dd2c-54a8-11f1-914b-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', 'Cari Nomor Paket lalu Balik Antrian Pengiriman', '<p>Sistem logistik menyimpan antrian nomor paket: <strong>[301, 302, 303, 304, 305]</strong>. Petugas ingin mencari apakah paket <strong>303</strong> ada di antrian sambil memindahkan setiap paket ke Stack. Setelah pencarian selesai, semua paket di Stack dikembalikan ke Queue menggunakan POP dan ENQUEUE.</p>\r\n<p>Telusuri setiap langkah. Tentukan apakah paket 303 ditemukan dan tunjukkan isi antrian akhir.</p>', '\"[{\\\"variabel\\\":\\\"antrian\\\",\\\"tipe_data\\\":\\\"Queue\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"tumpukan\\\",\\\"tipe_data\\\":\\\"Stack\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"ditemukan\\\",\\\"tipe_data\\\":\\\"boolean\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"elemen\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"antrian=[301,302,303,304,305], cari=303, ditemukan=FALSE\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Iterasi 1: DEQUEUE=301, 301!=303, PUSH(301)\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Iterasi 2: DEQUEUE=302, 302!=303, PUSH(302)\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Iterasi 3: DEQUEUE=303, 303=303, ditemukan=TRUE, PUSH(303)\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Iterasi 4: DEQUEUE=304, 304!=303, PUSH(304)\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Iterasi 5: DEQUEUE=305, 305!=303, PUSH(305)\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"tumpukan top=305\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"POP=305,304,303,302,301 -> ENQUEUE ke antrian\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"antrian=[305,304,303,302,301] urutan terbalik karena Stack LIFO\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT Ditemukan: TRUE\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT Antrian  : [305,304,303,302,301]\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 4, 1, 'hard', '2026-05-21 00:01:45', '2026-05-21 00:01:45', NULL),
('4132e212-54a8-11f1-914b-e4a8dfe60766', '019863c4-59f9-7319-9104-08267fc3c551', 'Mencari Skor Tertinggi di Antrian Turnamen', '<p>Sistem turnamen menyimpan skor peserta dalam antrian: <strong>[75, 90, 60, 95, 80]</strong> di mana 75 adalah skor terdepan. Panitia ingin mencari skor tertinggi beserta posisinya menggunakan sequential search, sambil memindahkan setiap skor ke Stack. Setelah selesai, semua skor dikembalikan dari Stack ke Queue.</p>\r\n<p>Telusuri setiap langkah. Tentukan skor tertinggi, posisinya, dan isi antrian setelah proses selesai.</p>', '\"[{\\\"variabel\\\":\\\"antrian\\\",\\\"tipe_data\\\":\\\"Queue\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"tumpukan\\\",\\\"tipe_data\\\":\\\"Stack\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"maksimum\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"posisi\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"index\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"antrian=[75,90,60,95,80], maksimum=75, posisi=1, index=1\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Iterasi 1: elemen=75, 75>75 FALSE, PUSH(75), index=2\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Iterasi 2: elemen=90, 90>75 TRUE, maksimum=90, posisi=2, PUSH(90), index=3\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Iterasi 3: elemen=60, 60>90 FALSE, PUSH(60), index=4\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Iterasi 4: elemen=95, 95>90 TRUE, maksimum=95, posisi=4, PUSH(95), index=5\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Iterasi 5: elemen=80, 80>95 FALSE, PUSH(80), index=6\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"POP=80,95,60,90,75 -> ENQUEUE ke antrian\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"antrian=[80,95,60,90,75]\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT Maksimum : 95\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT Posisi   : 4\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT Antrian  : [80,95,60,90,75]\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 5, 1, 'hard', '2026-05-21 00:01:45', '2026-05-21 00:01:45', NULL),
('8cc7e7e1-5442-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', 'Menyambung Tiga Gerbong Kereta', '<p>Sebuah kereta barang dirangkai menggunakan konsep Single Linked List. Gerbong pertama (head) memiliki beban 10 ton. Kemudian disambungkan gerbong kedua dengan 20 ton, dan gerbong ketiga 30 ton.</p>\r\n<p>Buat simpul untuk ketiga gerbong tersebut lalu cetak beban pada gerbong pertama dan gerbong terakhir secara berurutan.</p>', '\"[{\\\"variabel\\\":\\\"head\\\",\\\"tipe_data\\\":\\\"Node\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Buat node head dengan nilai 10\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Sambungkan head.next dengan node baru bernilai 20\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Sambungkan head.next.next dengan node baru bernilai 30\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT nilai dari head (Depan)\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT nilai dari head.next.next (Belakang)\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 1, 1, 'easy', '2026-05-20 11:53:43', '2026-05-20 08:19:28', '2026-05-20 08:19:28'),
('8cc80cd2-5442-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', 'Menghitung Total Gerbong Kereta', '<p>Rangkaian gerbong kereta (SLL) berisi daftar kode barang: \"A\", \"B\", dan \"C\". Petugas ingin menghitung berapa total gerbong yang ada dalam rangkaian tersebut menggunakan perulangan.</p>\r\n<p>Tentukan total jumlah gerbong dengan menelusuri Linked List dari depan hingga akhir.</p>', '\"[{\\\"variabel\\\":\\\"head\\\",\\\"tipe_data\\\":\\\"Node\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"count\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Buat node A, B, C dan sambungkan menjadi A -> B -> C\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Set count = 0, Node sementara = head\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"LAKUKAN SELAMA sementara tidak kosong:\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"  tambah count dengan 1\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"  pindahkan sementara ke node selanjutnya (sementara = sementara.next)\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT jumlah gerbong\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 2, 1, 'easy', '2026-05-20 11:53:43', '2026-05-20 08:19:28', '2026-05-20 08:19:28'),
('8cc8168a-5442-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', 'Menambah Gerbong di Paling Depan', '<p>Sebuah rangkaian gerbong SLL saat ini memiliki isi \"B\" lalu \"C\". Kepala stasiun memerintahkan untuk menyisipkan gerbong baru berisi \"A\" tepat di posisi paling depan (menjadi head baru).</p>\r\n<p>Sisipkan gerbong \"A\" di depan \"B\", kemudian cetak seluruh isi rangkaian dari depan ke belakang.</p>', '\"[{\\\"variabel\\\":\\\"head\\\",\\\"tipe_data\\\":\\\"Node\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"baru\\\",\\\"tipe_data\\\":\\\"Node\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Buat SLL awal: head = B, head.next = C\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Buat node baru = A\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Sambungkan node baru ke head awal (baru.next = head)\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Ubah head menjadi node baru (head = baru)\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Telusuri dan PRINT semua isi SLL\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 3, 1, 'easy', '2026-05-20 11:53:43', '2026-05-20 08:19:28', '2026-05-20 08:19:28'),
('8cc81a7f-5442-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', 'Navigasi Playlist Lagu Maju dan Mundur', '<p>Sebuah aplikasi musik menggunakan Double Linked List (DLL) untuk menyimpan playlist. Terdapat dua lagu: \"Lagu1\" dan \"Lagu2\". Lagu dapat diputar ke lagu selanjutnya (next) atau kembali ke lagu sebelumnya (prev).</p>\r\n<p>Buatlah DLL untuk kedua lagu tersebut, lalu cetak urutan maju dan urutan mundur dengan memanfaatkan pointer next dan prev.</p>', '\"[{\\\"variabel\\\":\\\"lagu1\\\",\\\"tipe_data\\\":\\\"DNode\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"lagu2\\\",\\\"tipe_data\\\":\\\"DNode\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Buat DNode l1 (Lagu1) dan l2 (Lagu2)\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"l1.next = l2\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"l2.prev = l1\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT Maju: l1 lalu l1.next\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT Mundur: l2 lalu l2.prev\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 4, 1, 'easy', '2026-05-20 11:53:43', '2026-05-20 08:19:28', '2026-05-20 08:19:28'),
('8cc81d75-5442-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', 'Menampilkan Seluruh Daftar Pesanan Makanan', '<p>Sebuah restoran mencatat pesanan Sate, Soto, dan Bakso ke dalam Single Linked List secara berurutan. Pelayan ingin melihat semua daftar pesanan yang masuk dari pesanan pertama hingga terakhir.</p>\r\n<p>Lakukan traversal (penelusuran) pada LinkedList dan cetak setiap pesanan ke layar.</p>', '\"[{\\\"variabel\\\":\\\"head\\\",\\\"tipe_data\\\":\\\"Node\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"tmp\\\",\\\"tipe_data\\\":\\\"Node\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Buat SLL: Sate -> Soto -> Bakso\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Set node sementara = head\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"LAKUKAN SELAMA sementara tidak kosong:\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"  PRINT data pada node sementara\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"  sementara = sementara.next\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 5, 1, 'easy', '2026-05-20 11:53:43', '2026-05-20 08:19:28', '2026-05-20 08:19:28'),
('8cc82068-5442-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', 'Mencari Buku di Rak Perpustakaan', '<p>Rak buku perpustakaan menyimpan ID buku dalam Single Linked List dengan urutan: 101, 102, dan 103. Pustakawan ingin mengecek apakah ID buku <strong>102</strong> tersedia di rak tersebut.</p>\r\n<p>Telusuri SLL dari awal. Jika ditemukan, ubah status menjadi TRUE, lalu cetak hasil penemuannya.</p>', '\"[{\\\"variabel\\\":\\\"head\\\",\\\"tipe_data\\\":\\\"Node\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"ada\\\",\\\"tipe_data\\\":\\\"boolean\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Buat SLL dengan urutan 101 -> 102 -> 103\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Tentukan target yang dicari = 102\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Set boolean ada = false, sementara = head\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"LAKUKAN penelusuran sampai node habis:\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"  JIKA nilai node == target MAKA ada = true\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"  pindah ke node berikutnya\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT status ditemukan (ada)\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 1, 1, 'medium', '2026-05-20 11:53:43', '2026-05-20 08:19:28', '2026-05-20 08:19:28'),
('8cc82353-5442-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', 'Menghapus Pasien Pertama dari Antrian', '<p>Antrian klinik (SLL) berisi nomor pasien 1, 2, dan 3. Pasien nomor 1 telah selesai diperiksa, sehingga petugas harus menghapus pasien pertama dari depan (menghapus head).</p>\r\n<p>Hapus elemen paling depan SLL tersebut, lalu cetak sisa antrian.</p>', '\"[{\\\"variabel\\\":\\\"head\\\",\\\"tipe_data\\\":\\\"Node\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Buat antrian 1 -> 2 -> 3\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"JIKA head tidak kosong MAKA:\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"  Ubah head ke elemen berikutnya (head = head.next)\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Lakukan penelusuran untuk PRINT semua sisa antrian\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 2, 1, 'medium', '2026-05-20 11:53:43', '2026-05-20 08:19:28', '2026-05-20 08:19:28'),
('8cc826fd-5442-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', 'Melepas Gerbong Terakhir Kereta', '<p>Rangkaian Double Linked List menyimpan nilai gerbong 10 <-> 20 <-> 30. Karena beban terlalu berat, petugas mekanik memotong dan melepas gerbong paling belakang (tail = 30).</p>\r\n<p>Temukan gerbong terakhir, putus sambungannya, lalu cetak isi dari depan ke belakang.</p>', '\"[{\\\"variabel\\\":\\\"head\\\",\\\"tipe_data\\\":\\\"DNode\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"temp\\\",\\\"tipe_data\\\":\\\"DNode\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Buat DLL: 10 <-> 20 <-> 30\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Telusuri sampai menemukan node terakhir (temp.next == null)\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Putus sambungan dari node sebelum terakhir (temp.prev.next = null)\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Telusuri dari head untuk PRINT sisa gerbong\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 3, 1, 'medium', '2026-05-20 11:53:43', '2026-05-20 08:19:28', '2026-05-20 08:19:28'),
('8cc82d5c-5442-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', 'Menyisipkan Peserta di Tengah Barisan', '<p>Barisan Single Linked List awalnya berisi \"Budi\" yang menyambung ke \"Doni\". Tiba-tiba \"Caca\" datang dan petugas menyisipkan Caca tepat di antara Budi dan Doni.</p>\r\n<p>Lakukan proses *Insert After* pada node Budi, lalu cetak urutan barisan yang baru.</p>', '\"[{\\\"variabel\\\":\\\"head\\\",\\\"tipe_data\\\":\\\"Node\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"caca\\\",\\\"tipe_data\\\":\\\"Node\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Buat SLL: head(Budi) -> node(Doni)\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Buat node baru Caca\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Sambungkan next dari Caca ke Doni (caca.next = head.next)\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Sambungkan next dari Budi ke Caca (head.next = caca)\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Telusuri dan PRINT seluruh barisan baru\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 4, 1, 'medium', '2026-05-20 11:53:43', '2026-05-20 08:19:28', '2026-05-20 08:19:28');
INSERT INTO `soal` (`id`, `id_level`, `judul`, `soal`, `kunci_tipe_data`, `kunci_algoritma`, `order`, `status`, `difficulty`, `created_at`, `updated_at`, `deleted_at`) VALUES
('8cc8324c-5442-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', 'Menghitung Total Belanjaan di Kasir', '<p>Kasir menyimpan riwayat harga belanja pelanggan di Single Linked List dengan data: 5000, 10000, dan 15000. Kasir ingin menghitung jumlah keseluruhan belanjaan secara otomatis.</p>\r\n<p>Telusuri elemen dari depan, jumlahkan nilainya ke dalam satu variabel, lalu cetak totalnya.</p>', '\"[{\\\"variabel\\\":\\\"head\\\",\\\"tipe_data\\\":\\\"Node\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"total\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Buat SLL berisi: 5000 -> 10000 -> 15000\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Set total = 0, node sementara = head\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"LAKUKAN SELAMA sementara tidak kosong:\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"  tambahkan nilai pada node sementara ke variabel total\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"  pindah ke node berikutnya\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT total akhir belanjaan\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 5, 1, 'medium', '2026-05-20 11:53:43', '2026-05-20 08:19:28', '2026-05-20 08:19:28'),
('8cc837c8-5442-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', 'Mencari Skor Peserta Tertinggi', '<p>Panitia lomba menyimpan daftar skor (80, 95, 75) ke dalam Single Linked List. Untuk mencari pemenang, panitia perlu membandingkan semua skor secara iteratif.</p>\r\n<p>Telusuri seluruh SLL, tentukan nilai skor paling tinggi, dan cetak skor maksimum tersebut.</p>', '\"[{\\\"variabel\\\":\\\"head\\\",\\\"tipe_data\\\":\\\"Node\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"maksimum\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Buat SLL berisi skor: 80 -> 95 -> 75\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Set maksimum = nilai head (80), lalu pindah cek ke node berikutnya\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"LAKUKAN SELAMA node belum habis:\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"  JIKA nilai node sekarang > maksimum MAKA maksimum = nilai node sekarang\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"  pindah ke node berikutnya\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT nilai maksimum\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 1, 1, 'hard', '2026-05-20 11:53:43', '2026-05-20 08:19:28', '2026-05-20 08:19:28'),
('8cc83d1d-5442-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', 'Membalik Urutan Antrian Pemain', '<p>Tiga peserta masuk SLL dengan urutan 1 -> 2 -> 3. Petugas ingin membalik urutan (Reverse) sehingga yang terakhir menjadi yang pertama (3 -> 2 -> 1) hanya dengan mengubah manipulasi pointer \"next\" dari setiap Node.</p>\r\n<p>Balik urutan SLL tersebut, ubah head menjadi node bernilai 3, lalu cetak urutan barunya.</p>', '\"[{\\\"variabel\\\":\\\"head\\\",\\\"tipe_data\\\":\\\"Node\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"prev\\\",\\\"tipe_data\\\":\\\"Node\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"curr\\\",\\\"tipe_data\\\":\\\"Node\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Buat SLL awal: 1 -> 2 -> 3\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Set Node prev = null, curr = head, next = null\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"LAKUKAN SELAMA curr tidak kosong:\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"  simpan alamat next (next = curr.next)\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"  balik arah sambungan (curr.next = prev)\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"  geser prev dan curr maju (prev = curr, curr = next)\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Ubah head menjadi prev\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Telusuri dan PRINT hasil SLL yang dibalik\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 2, 1, 'hard', '2026-05-20 11:53:43', '2026-05-20 08:19:28', '2026-05-20 08:19:28'),
('8cc84233-5442-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', 'Menyisipkan Data di Tengah Double Linked List', '<p>Double Linked List menyimpan dua node: 10 (head) yang langsung menyambung ke 30 (tail). Buatlah program untuk menyisipkan node bernilai 20 agar berada pas di tengah-tengah antara 10 dan 30.</p>\r\n<p>Sambungkan dengan benar pointer next dan prev, lalu cetak urutannya.</p>', '\"[{\\\"variabel\\\":\\\"head\\\",\\\"tipe_data\\\":\\\"DNode\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"baru\\\",\\\"tipe_data\\\":\\\"DNode\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Buat DNode l1(10) dan l3(30). Sambungkan l1 <-> l3\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Buat node baru l2 dengan nilai 20\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Sambungkan l2.next ke l1.next (menuju 30)\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Sambungkan l2.prev ke l1 (menuju 10)\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Ubah prev dari 30 menjadi l2 (l1.next.prev = l2)\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Ubah next dari 10 menjadi l2 (l1.next = l2)\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT seluruh DLL dari head\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 3, 1, 'hard', '2026-05-20 11:53:43', '2026-05-20 08:19:28', '2026-05-20 08:19:28'),
('8cc84bcc-5442-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', 'Mencabut Berkas Rusak di Tengah Urutan', '<p>SLL menyimpan ID berkas: 5 -> 10 -> 15. Berkas ber-ID <strong>10</strong> dianggap rusak dan harus dihapus. Kita harus menelusuri dari awal untuk mencari node 10, mencatat node sebelumnya, dan menyambungkan pointer melewati node yang rusak.</p>\r\n<p>Lakukan logika penghapusan dengan traversal dan tracking node, lalu cetak isi SLL setelahnya.</p>', '\"[{\\\"variabel\\\":\\\"head\\\",\\\"tipe_data\\\":\\\"Node\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"hapus\\\",\\\"tipe_data\\\":\\\"int\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Buat SLL: 5 -> 10 -> 15\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Set node prev = null, node temp = head, ID hapus = 10\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"LAKUKAN SELAMA temp belum habis dan nilai temp != 10:\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"  prev = temp, temp = temp.next (maju mencari node 10)\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"JIKA node ditemukan, lompati node tersebut (prev.next = temp.next)\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT sisa berkas di SLL\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 4, 1, 'hard', '2026-05-20 11:53:43', '2026-05-20 08:19:28', '2026-05-20 08:19:28'),
('8cc8560b-5442-11f1-a937-e4a8dfe60766', '019de356-abfa-717d-958c-e9311c2712f3', 'Memeriksa Struktur Palindrom Sederhana', '<p>Sebuah kata disimpan dalam DLL huruf demi huruf: \"A\" <-> \"B\" <-> \"A\". Program harus mengecek apakah susunan kata ini merupakan palindrom dengan cara membandingkan node paling depan dan paling belakang yang bergerak ke arah tengah bersilangan.</p>\r\n<p>Tentukan apakah struktur tersebut merupakan palindrom dan cetak hasil boolean-nya.</p>', '\"[{\\\"variabel\\\":\\\"head\\\",\\\"tipe_data\\\":\\\"DNode\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"tail\\\",\\\"tipe_data\\\":\\\"DNode\\\",\\\"konversi\\\":0},{\\\"variabel\\\":\\\"isPal\\\",\\\"tipe_data\\\":\\\"boolean\\\",\\\"konversi\\\":0}]\"', '\"[{\\\"langkah\\\":\\\"START\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Buat DNode n1(A) <-> n2(B) <-> n3(A)\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"Set head = n1, tail = n3, boolean isPalindrom = true\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"LAKUKAN SELAMA head dan tail belum saling silang:\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"  JIKA head.data != tail.data MAKA isPalindrom = false\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"  head = head.next (maju dari kiri)\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"  tail = tail.prev (mundur dari kanan)\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"PRINT hasil isPalindrom\\\",\\\"clue\\\":0,\\\"konversi\\\":0},{\\\"langkah\\\":\\\"END\\\",\\\"clue\\\":0,\\\"konversi\\\":0}]\"', 5, 1, 'hard', '2026-05-20 11:53:43', '2026-05-20 08:19:28', '2026-05-20 08:19:28');

-- --------------------------------------------------------

--
-- Table structure for table `ujian`
--

CREATE TABLE `ujian` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_soal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_mahasiswa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `waktu` int DEFAULT NULL,
  `status` tinyint DEFAULT NULL COMMENT '0: salah,\r\n1: benar',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `ujian_kode`
--

CREATE TABLE `ujian_kode` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_bank_soal_konversi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_mahasiswa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jawaban` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `output` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `nilai` int DEFAULT NULL,
  `waktu` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ujian_konversi`
--

CREATE TABLE `ujian_konversi` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_soal_konversi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_mahasiswa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jawaban` json DEFAULT NULL,
  `output` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `nilai` int DEFAULT NULL,
  `waktu` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `avatar`, `password`, `is_admin`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
('b1bc1c75-6956-4b33-b585-3dc5edad9333', 'Dosen Admin', 'dosen@gmail.com', NULL, 'avatar6.webp', '$2y$12$YIlhfZzT1ZXlHi2EGRSKSO6uqWiGnA1cxj8b7iyipn.nVqSnZdtSG', 1, NULL, '2025-07-28 01:14:05', '2026-01-18 05:33:20', NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_bank_soal_konversi`
-- (See below for the actual view)
--
CREATE TABLE `v_bank_soal_konversi` (
`created_at` timestamp
,`deleted_at` timestamp
,`difficulty` enum('easy','medium','hard')
,`id` varchar(255)
,`id_level` varchar(255)
,`id_soal` varchar(255)
,`jawaban` text
,`judul_soal` varchar(255)
,`level_name` varchar(255)
,`output` text
,`soal_name` text
,`status` int
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_history_confidence`
-- (See below for the actual view)
--
CREATE TABLE `v_history_confidence` (
`created_at` timestamp
,`deleted_at` timestamp
,`id` varchar(255)
,`id_level` varchar(255)
,`id_mahasiswa` varchar(255)
,`id_soal` varchar(255)
,`id_ujian` varchar(255)
,`judul_soal` varchar(255)
,`level_name` varchar(255)
,`name` varchar(255)
,`nim` varchar(255)
,`status_confidence` int
,`status_jawaban` int
,`updated_at` timestamp
,`waktu` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_history_jawaban`
-- (See below for the actual view)
--
CREATE TABLE `v_history_jawaban` (
`algoritma` varchar(255)
,`created_at` timestamp
,`deleted_at` timestamp
,`id` varchar(255)
,`id_kelas` varchar(255)
,`id_level` varchar(255)
,`id_mahasiswa` varchar(255)
,`id_soal` varchar(255)
,`index_algoritma` int
,`index_tipe_data` int
,`judul_soal` varchar(255)
,`kelas_name` varchar(255)
,`level_name` varchar(255)
,`name` varchar(255)
,`nim` varchar(255)
,`status` enum('benar','salah')
,`tipe_data` varchar(255)
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_konversi`
-- (See below for the actual view)
--
CREATE TABLE `v_konversi` (
`bobot` int
,`created_at` timestamp
,`deleted_at` timestamp
,`id` varchar(255)
,`id_level` varchar(255)
,`id_soal` varchar(255)
,`jawaban` json
,`judul_soal` varchar(255)
,`konversi_output` text
,`level_name` varchar(255)
,`order` int
,`output` text
,`soal_name` text
,`status` int
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_label_skor`
-- (See below for the actual view)
--
CREATE TABLE `v_label_skor` (
`created_at` timestamp
,`deleted_at` timestamp
,`id` varchar(255)
,`id_kelas` varchar(255)
,`id_level` varchar(255)
,`id_mahasiswa` varchar(255)
,`id_soal` varchar(255)
,`label` varchar(255)
,`skor` int
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_log_data`
-- (See below for the actual view)
--
CREATE TABLE `v_log_data` (
`created_at` timestamp
,`deleted_at` timestamp
,`id` varchar(255)
,`id_kelas` varchar(255)
,`id_level` varchar(255)
,`id_mahasiswa` varchar(255)
,`id_soal` varchar(255)
,`index` varchar(255)
,`itemText` text
,`judul` varchar(255)
,`name` varchar(255)
,`nim` varchar(255)
,`timer_second` int
,`type` varchar(255)
,`updated_at` timestamp
,`variabel` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_mahasiswa`
-- (See below for the actual view)
--
CREATE TABLE `v_mahasiswa` (
`angkatan` varchar(255)
,`avatar` varchar(255)
,`created_at` timestamp
,`deleted_at` timestamp
,`email` varchar(255)
,`id` varchar(255)
,`id_kelas` varchar(255)
,`id_user` varchar(255)
,`jenis_kelamin` char(1)
,`kelas_name` varchar(255)
,`name` varchar(255)
,`nim` varchar(255)
,`open_panduan` smallint
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_pseudo_konversicode`
-- (See below for the actual view)
--
CREATE TABLE `v_pseudo_konversicode` (
`attempt_index` bigint unsigned
,`created_at` timestamp
,`difficulty` varchar(6)
,`durasi` int
,`event_index` bigint unsigned
,`id_konversi` varchar(255)
,`id_level` varchar(255)
,`id_mahasiswa` varchar(255)
,`id_soal` varchar(255)
,`jenis_soal` varchar(8)
,`langkah` bigint
,`pair_index` bigint unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_soal`
-- (See below for the actual view)
--
CREATE TABLE `v_soal` (
`created_at` timestamp
,`deleted_at` timestamp
,`id` varchar(255)
,`id_level` varchar(255)
,`judul` varchar(255)
,`level_name` varchar(255)
,`soal` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_ujian`
-- (See below for the actual view)
--
CREATE TABLE `v_ujian` (
`created_at` timestamp
,`deleted_at` timestamp
,`id` varchar(255)
,`id_kelas` varchar(255)
,`id_level` varchar(255)
,`id_mahasiswa` varchar(255)
,`id_soal` varchar(255)
,`judul_soal` varchar(255)
,`level_name` varchar(255)
,`name` varchar(255)
,`nim` varchar(255)
,`status` tinyint
,`updated_at` timestamp
,`waktu` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_ujian_kode`
-- (See below for the actual view)
--
CREATE TABLE `v_ujian_kode` (
`created_at` timestamp
,`deleted_at` timestamp
,`id` varchar(255)
,`id_bank_soal_konversi` varchar(255)
,`id_kelas` varchar(255)
,`id_level` varchar(255)
,`id_mahasiswa` varchar(255)
,`id_soal` varchar(255)
,`id_user` varchar(255)
,`jawaban` text
,`judul_soal` varchar(255)
,`kelas_name` varchar(255)
,`level_name` varchar(255)
,`name` varchar(255)
,`nilai` int
,`nim` varchar(255)
,`output` text
,`updated_at` timestamp
,`waktu` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_ujian_konversi`
-- (See below for the actual view)
--
CREATE TABLE `v_ujian_konversi` (
`created_at` timestamp
,`deleted_at` timestamp
,`id` varchar(255)
,`id_kelas` varchar(255)
,`id_level` varchar(255)
,`id_mahasiswa` varchar(255)
,`id_soal` varchar(255)
,`id_soal_konversi` varchar(255)
,`id_user` varchar(255)
,`jawaban` json
,`judul_soal` varchar(255)
,`kelas_name` varchar(255)
,`level_name` varchar(255)
,`name` varchar(255)
,`nilai` int
,`nim` varchar(255)
,`output` text
,`updated_at` timestamp
,`waktu` int
);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank_soal_konversi`
--
ALTER TABLE `bank_soal_konversi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bank_soal_konversi_id_level_index` (`id_level`),
  ADD KEY `bank_soal_konversi_order_index` (`order`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`) USING BTREE;

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`) USING BTREE;

--
-- Indexes for table `debug_konversi`
--
ALTER TABLE `debug_konversi`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `id_level_fkey` (`id_level`) USING BTREE,
  ADD KEY `id_soal` (`id_soal`) USING BTREE,
  ADD KEY `id_soal_konversi` (`id_soal_konversi`) USING BTREE,
  ADD KEY `id_mahasiswa` (`id_mahasiswa`) USING BTREE,
  ADD KEY `id_ujian_konversi` (`id_ujian_konversi`) USING BTREE;

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`) USING BTREE;

--
-- Indexes for table `guide`
--
ALTER TABLE `guide`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `history_confidence`
--
ALTER TABLE `history_confidence`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `id_level` (`id_level`) USING BTREE,
  ADD KEY `id_soal` (`id_soal`) USING BTREE,
  ADD KEY `id_mahasiswa` (`id_mahasiswa`) USING BTREE,
  ADD KEY `history_confidence_ibfk_4` (`id_ujian`) USING BTREE;

--
-- Indexes for table `history_jawaban`
--
ALTER TABLE `history_jawaban`
  ADD PRIMARY KEY (`id` DESC) USING BTREE,
  ADD KEY `id_level` (`id_level`) USING BTREE,
  ADD KEY `id_soal` (`id_soal`) USING BTREE,
  ADD KEY `id_mahasiswa` (`id_mahasiswa`) USING BTREE;

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `jobs_queue_index` (`queue`) USING BTREE;

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `konversi`
--
ALTER TABLE `konversi`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `id_level_fkey` (`id_level`) USING BTREE;

--
-- Indexes for table `label_skor`
--
ALTER TABLE `label_skor`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `id_soal` (`id_soal`) USING BTREE,
  ADD KEY `id_mahasiswa` (`id_mahasiswa`) USING BTREE,
  ADD KEY `id_level` (`id_level`) USING BTREE;

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `log_data`
--
ALTER TABLE `log_data`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `id_soal` (`id_soal`) USING BTREE,
  ADD KEY `id_mahasiswa` (`id_mahasiswa`) USING BTREE;

--
-- Indexes for table `log_ujian_kode`
--
ALTER TABLE `log_ujian_kode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `id_users_fkey` (`id_user`) USING BTREE,
  ADD KEY `id_kelas_fkey` (`id_kelas`) USING BTREE;

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `nilai_test`
--
ALTER TABLE `nilai_test`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `id_mahasiswa` (`id_mahasiswa`) USING BTREE,
  ADD KEY `id_level` (`id_level`) USING BTREE;

--
-- Indexes for table `nyawa`
--
ALTER TABLE `nyawa`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `id_mahasiswa` (`id_mahasiswa`) USING BTREE,
  ADD KEY `id_user` (`id_user`) USING BTREE;

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`) USING BTREE;

--
-- Indexes for table `pencapaian`
--
ALTER TABLE `pencapaian`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `id_level_fkey` (`id_level`) USING BTREE,
  ADD KEY `id_mahasiswa` (`id_mahasiswa`) USING BTREE,
  ADD KEY `category` (`category`) USING BTREE;

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `sessions_user_id_index` (`user_id`) USING BTREE,
  ADD KEY `sessions_last_activity_index` (`last_activity`) USING BTREE;

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `soal`
--
ALTER TABLE `soal`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `id_level_fkey` (`id_level`) USING BTREE;

--
-- Indexes for table `ujian`
--
ALTER TABLE `ujian`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `id_level_fkey` (`id_level`) USING BTREE,
  ADD KEY `id_soal` (`id_soal`) USING BTREE,
  ADD KEY `id_mahasiswa` (`id_mahasiswa`) USING BTREE;

--
-- Indexes for table `ujian_kode`
--
ALTER TABLE `ujian_kode`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ujian_kode_id_bank_soal_konversi_foreign` (`id_bank_soal_konversi`),
  ADD KEY `ujian_kode_id_mahasiswa_foreign` (`id_mahasiswa`),
  ADD KEY `ujian_kode_id_level_foreign` (`id_level`);

--
-- Indexes for table `ujian_konversi`
--
ALTER TABLE `ujian_konversi`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `id_level_fkey` (`id_level`) USING BTREE,
  ADD KEY `id_mahasiswa` (`id_mahasiswa`) USING BTREE,
  ADD KEY `ujian_konversi_ibfk_2` (`id_soal_konversi`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

-- --------------------------------------------------------

--
-- Structure for view `v_bank_soal_konversi`
--
DROP TABLE IF EXISTS `v_bank_soal_konversi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_bank_soal_konversi`  AS SELECT `bsk`.`id` AS `id`, `bsk`.`id_level` AS `id_level`, `l`.`name` AS `level_name`, `bsk`.`id_soal` AS `id_soal`, `s`.`judul` AS `judul_soal`, `s`.`soal` AS `soal_name`, `bsk`.`jawaban` AS `jawaban`, `bsk`.`output` AS `output`, `bsk`.`difficulty` AS `difficulty`, `bsk`.`created_at` AS `created_at`, `bsk`.`updated_at` AS `updated_at`, `bsk`.`deleted_at` AS `deleted_at`, `s`.`status` AS `status` FROM ((`bank_soal_konversi` `bsk` left join `level` `l` on((`bsk`.`id_level` = `l`.`id`))) left join `soal` `s` on((`bsk`.`id_soal` = `s`.`id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_history_confidence`
--
DROP TABLE IF EXISTS `v_history_confidence`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_history_confidence`  AS SELECT `history_confidence`.`id` AS `id`, `history_confidence`.`id_level` AS `id_level`, `level`.`name` AS `level_name`, `history_confidence`.`id_soal` AS `id_soal`, `soal`.`judul` AS `judul_soal`, `history_confidence`.`id_mahasiswa` AS `id_mahasiswa`, `history_confidence`.`id_ujian` AS `id_ujian`, `mahasiswa`.`nim` AS `nim`, `mahasiswa`.`name` AS `name`, `history_confidence`.`status_jawaban` AS `status_jawaban`, `history_confidence`.`status_confidence` AS `status_confidence`, `ujian`.`waktu` AS `waktu`, `history_confidence`.`created_at` AS `created_at`, `history_confidence`.`updated_at` AS `updated_at`, `history_confidence`.`deleted_at` AS `deleted_at` FROM ((((`history_confidence` left join `level` on((`history_confidence`.`id_level` = `level`.`id`))) left join `soal` on((`history_confidence`.`id_soal` = `soal`.`id`))) left join `mahasiswa` on((`history_confidence`.`id_mahasiswa` = `mahasiswa`.`id`))) left join `ujian` on((`history_confidence`.`id_ujian` = `ujian`.`id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_history_jawaban`
--
DROP TABLE IF EXISTS `v_history_jawaban`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_history_jawaban`  AS SELECT `history_jawaban`.`id` AS `id`, `history_jawaban`.`id_level` AS `id_level`, `level`.`name` AS `level_name`, `history_jawaban`.`id_soal` AS `id_soal`, `soal`.`judul` AS `judul_soal`, `history_jawaban`.`id_mahasiswa` AS `id_mahasiswa`, `mahasiswa`.`nim` AS `nim`, `mahasiswa`.`name` AS `name`, `mahasiswa`.`id_kelas` AS `id_kelas`, `kelas`.`name` AS `kelas_name`, `history_jawaban`.`index_tipe_data` AS `index_tipe_data`, `history_jawaban`.`tipe_data` AS `tipe_data`, `history_jawaban`.`index_algoritma` AS `index_algoritma`, `history_jawaban`.`algoritma` AS `algoritma`, `history_jawaban`.`status` AS `status`, `history_jawaban`.`created_at` AS `created_at`, `history_jawaban`.`updated_at` AS `updated_at`, `history_jawaban`.`deleted_at` AS `deleted_at` FROM ((((`history_jawaban` left join `level` on((`history_jawaban`.`id_level` = `level`.`id`))) left join `soal` on((`history_jawaban`.`id_soal` = `soal`.`id`))) left join `mahasiswa` on((`history_jawaban`.`id_mahasiswa` = `mahasiswa`.`id`))) left join `kelas` on((`mahasiswa`.`id_kelas` = `kelas`.`id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_konversi`
--
DROP TABLE IF EXISTS `v_konversi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_konversi`  AS SELECT `konversi`.`id` AS `id`, `konversi`.`id_level` AS `id_level`, `level`.`name` AS `level_name`, `konversi`.`id_soal` AS `id_soal`, `soal`.`judul` AS `judul_soal`, `soal`.`soal` AS `soal_name`, `konversi`.`jawaban` AS `jawaban`, `konversi`.`output` AS `output`, `konversi`.`output` AS `konversi_output`, `konversi`.`bobot` AS `bobot`, `konversi`.`created_at` AS `created_at`, `konversi`.`updated_at` AS `updated_at`, `konversi`.`deleted_at` AS `deleted_at`, `soal`.`status` AS `status`, `soal`.`order` AS `order` FROM ((`konversi` left join `level` on((`konversi`.`id_level` = `level`.`id`))) left join `soal` on((`konversi`.`id_soal` = `soal`.`id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_label_skor`
--
DROP TABLE IF EXISTS `v_label_skor`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_label_skor`  AS SELECT `label_skor`.`id` AS `id`, `label_skor`.`id_level` AS `id_level`, `label_skor`.`id_soal` AS `id_soal`, `label_skor`.`id_mahasiswa` AS `id_mahasiswa`, `mahasiswa`.`id_kelas` AS `id_kelas`, `label_skor`.`label` AS `label`, `label_skor`.`skor` AS `skor`, `label_skor`.`created_at` AS `created_at`, `label_skor`.`updated_at` AS `updated_at`, `label_skor`.`deleted_at` AS `deleted_at` FROM (`label_skor` left join `mahasiswa` on((`label_skor`.`id_mahasiswa` = `mahasiswa`.`id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_log_data`
--
DROP TABLE IF EXISTS `v_log_data`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_log_data`  AS SELECT `log_data`.`id` AS `id`, `log_data`.`id_soal` AS `id_soal`, `soal`.`id_level` AS `id_level`, `soal`.`judul` AS `judul`, `log_data`.`id_mahasiswa` AS `id_mahasiswa`, `mahasiswa`.`nim` AS `nim`, `mahasiswa`.`name` AS `name`, `mahasiswa`.`id_kelas` AS `id_kelas`, `log_data`.`index` AS `index`, `log_data`.`itemText` AS `itemText`, `log_data`.`timer_second` AS `timer_second`, `log_data`.`type` AS `type`, `log_data`.`variabel` AS `variabel`, `log_data`.`created_at` AS `created_at`, `log_data`.`updated_at` AS `updated_at`, `log_data`.`deleted_at` AS `deleted_at` FROM ((`log_data` left join `soal` on((`log_data`.`id_soal` = `soal`.`id`))) left join `mahasiswa` on((`log_data`.`id_mahasiswa` = `mahasiswa`.`id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_mahasiswa`
--
DROP TABLE IF EXISTS `v_mahasiswa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_mahasiswa`  AS SELECT `mahasiswa`.`id` AS `id`, `mahasiswa`.`id_user` AS `id_user`, `mahasiswa`.`id_kelas` AS `id_kelas`, `kelas`.`name` AS `kelas_name`, `kelas`.`angkatan` AS `angkatan`, `mahasiswa`.`nim` AS `nim`, `mahasiswa`.`name` AS `name`, `users`.`email` AS `email`, `mahasiswa`.`jenis_kelamin` AS `jenis_kelamin`, `users`.`avatar` AS `avatar`, `mahasiswa`.`open_panduan` AS `open_panduan`, `mahasiswa`.`created_at` AS `created_at`, `mahasiswa`.`updated_at` AS `updated_at`, `mahasiswa`.`deleted_at` AS `deleted_at` FROM ((`mahasiswa` left join `kelas` on((`mahasiswa`.`id_kelas` = `kelas`.`id`))) left join `users` on((`mahasiswa`.`id_user` = `users`.`id`))) WHERE (`mahasiswa`.`deleted_at` is null) ;

-- --------------------------------------------------------

--
-- Structure for view `v_pseudo_konversicode`
--
DROP TABLE IF EXISTS `v_pseudo_konversicode`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_pseudo_konversicode`  AS SELECT `base`.`id_mahasiswa` AS `id_mahasiswa`, `base`.`id_level` AS `id_level`, `base`.`id_soal` AS `id_soal`, `base`.`id_konversi` AS `id_konversi`, `base`.`jenis_soal` AS `jenis_soal`, `base`.`difficulty` AS `difficulty`, `base`.`langkah` AS `langkah`, `base`.`durasi` AS `durasi`, `base`.`created_at` AS `created_at`, `base`.`attempt_index` AS `attempt_index`, `base`.`pair_index` AS `pair_index`, `base`.`event_index` AS `event_index` FROM (select `u`.`id_mahasiswa` AS `id_mahasiswa`,`u`.`id_level` AS `id_level`,`s`.`id` AS `id_soal`,NULL AS `id_konversi`,'pseudo' AS `jenis_soal`,`s`.`difficulty` AS `difficulty`,count(`ld`.`id`) AS `langkah`,`u`.`waktu` AS `durasi`,`u`.`created_at` AS `created_at`,row_number() OVER (PARTITION BY `u`.`id_mahasiswa`,`u`.`id_level`,`s`.`id` ORDER BY `u`.`created_at` )  AS `attempt_index`,row_number() OVER (PARTITION BY `u`.`id_mahasiswa`,`u`.`id_level` ORDER BY `u`.`created_at` )  AS `pair_index`,row_number() OVER (PARTITION BY `u`.`id_mahasiswa`,`u`.`id_level` ORDER BY `u`.`created_at` )  AS `event_index` from ((`ujian` `u` join `soal` `s` on((`s`.`id` = `u`.`id_soal`))) left join `log_data` `ld` on(((`ld`.`id_soal` = `s`.`id`) and (`ld`.`id_mahasiswa` = `u`.`id_mahasiswa`)))) group by `u`.`id_mahasiswa`,`u`.`id_level`,`s`.`id`,`s`.`difficulty`,`u`.`waktu`,`u`.`created_at` union all select `uk`.`id_mahasiswa` AS `id_mahasiswa`,`uk`.`id_level` AS `id_level`,`bsk`.`id_soal` AS `id_soal`,`bsk`.`id` AS `id_konversi`,'konversi' AS `jenis_soal`,`bsk`.`difficulty` AS `difficulty`,count(`lk`.`id`) AS `langkah`,`uk`.`waktu` AS `durasi`,`uk`.`created_at` AS `created_at`,row_number() OVER (PARTITION BY `uk`.`id_mahasiswa`,`uk`.`id_level`,`bsk`.`id_soal` ORDER BY `uk`.`created_at` )  AS `attempt_index`,row_number() OVER (PARTITION BY `uk`.`id_mahasiswa`,`uk`.`id_level` ORDER BY `uk`.`created_at` )  AS `pair_index`,row_number() OVER (PARTITION BY `uk`.`id_mahasiswa`,`uk`.`id_level` ORDER BY `uk`.`created_at` )  AS `event_index` from ((`ujian_kode` `uk` join `bank_soal_konversi` `bsk` on((`bsk`.`id` = `uk`.`id_bank_soal_konversi`))) left join `log_ujian_kode` `lk` on(((`lk`.`id_bank_soal_konversi` = `bsk`.`id`) and (`lk`.`id_mahasiswa` = `uk`.`id_mahasiswa`)))) group by `uk`.`id_mahasiswa`,`uk`.`id_level`,`bsk`.`id_soal`,`bsk`.`id`,`bsk`.`difficulty`,`uk`.`waktu`,`uk`.`created_at`) AS `base` ORDER BY `base`.`created_at` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `v_soal`
--
DROP TABLE IF EXISTS `v_soal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_soal`  AS SELECT `s`.`id` AS `id`, `s`.`judul` AS `judul`, `s`.`soal` AS `soal`, `s`.`id_level` AS `id_level`, `l`.`name` AS `level_name`, `s`.`created_at` AS `created_at`, `s`.`deleted_at` AS `deleted_at` FROM (`soal` `s` left join `level` `l` on((`s`.`id_level` = `l`.`id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_ujian`
--
DROP TABLE IF EXISTS `v_ujian`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_ujian`  AS SELECT `ujian`.`id` AS `id`, `ujian`.`id_level` AS `id_level`, `level`.`name` AS `level_name`, `ujian`.`id_soal` AS `id_soal`, `soal`.`judul` AS `judul_soal`, `ujian`.`id_mahasiswa` AS `id_mahasiswa`, `mahasiswa`.`id_kelas` AS `id_kelas`, `mahasiswa`.`nim` AS `nim`, `mahasiswa`.`name` AS `name`, `ujian`.`waktu` AS `waktu`, `ujian`.`status` AS `status`, `ujian`.`created_at` AS `created_at`, `ujian`.`updated_at` AS `updated_at`, `ujian`.`deleted_at` AS `deleted_at` FROM (((`ujian` left join `level` on((`ujian`.`id_level` = `level`.`id`))) left join `soal` on((`ujian`.`id_soal` = `soal`.`id`))) left join `mahasiswa` on((`ujian`.`id_mahasiswa` = `mahasiswa`.`id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_ujian_kode`
--
DROP TABLE IF EXISTS `v_ujian_kode`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_ujian_kode`  AS SELECT `uk`.`id` AS `id`, `uk`.`id_level` AS `id_level`, `uk`.`id_bank_soal_konversi` AS `id_bank_soal_konversi`, `bsk`.`id_soal` AS `id_soal`, `uk`.`id_mahasiswa` AS `id_mahasiswa`, `m`.`id_user` AS `id_user`, `m`.`id_kelas` AS `id_kelas`, `l`.`name` AS `level_name`, `k`.`name` AS `kelas_name`, `s`.`judul` AS `judul_soal`, `m`.`nim` AS `nim`, `m`.`name` AS `name`, `uk`.`jawaban` AS `jawaban`, `uk`.`output` AS `output`, `uk`.`nilai` AS `nilai`, `uk`.`waktu` AS `waktu`, `uk`.`created_at` AS `created_at`, `uk`.`updated_at` AS `updated_at`, `uk`.`deleted_at` AS `deleted_at` FROM (((((`ujian_kode` `uk` left join `bank_soal_konversi` `bsk` on((`uk`.`id_bank_soal_konversi` = `bsk`.`id`))) left join `soal` `s` on((`bsk`.`id_soal` = `s`.`id`))) left join `mahasiswa` `m` on((`uk`.`id_mahasiswa` = `m`.`id`))) left join `kelas` `k` on((`m`.`id_kelas` = `k`.`id`))) join `level` `l` on((`uk`.`id_level` = `l`.`id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_ujian_konversi`
--
DROP TABLE IF EXISTS `v_ujian_konversi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_ujian_konversi`  AS SELECT `ujian_konversi`.`id` AS `id`, `ujian_konversi`.`id_level` AS `id_level`, `ujian_konversi`.`id_soal_konversi` AS `id_soal_konversi`, `konversi`.`id_soal` AS `id_soal`, `ujian_konversi`.`id_mahasiswa` AS `id_mahasiswa`, `mahasiswa`.`id_user` AS `id_user`, `mahasiswa`.`id_kelas` AS `id_kelas`, `level`.`name` AS `level_name`, `kelas`.`name` AS `kelas_name`, `soal`.`judul` AS `judul_soal`, `mahasiswa`.`nim` AS `nim`, `mahasiswa`.`name` AS `name`, `ujian_konversi`.`jawaban` AS `jawaban`, `ujian_konversi`.`output` AS `output`, `ujian_konversi`.`nilai` AS `nilai`, `ujian_konversi`.`waktu` AS `waktu`, `ujian_konversi`.`created_at` AS `created_at`, `ujian_konversi`.`updated_at` AS `updated_at`, `ujian_konversi`.`deleted_at` AS `deleted_at` FROM (((((`ujian_konversi` left join `konversi` on((`ujian_konversi`.`id_soal_konversi` = `konversi`.`id`))) left join `soal` on((`konversi`.`id_soal` = `soal`.`id`))) left join `mahasiswa` on((`ujian_konversi`.`id_mahasiswa` = `mahasiswa`.`id`))) left join `kelas` on((`mahasiswa`.`id_kelas` = `kelas`.`id`))) join `level` on((`ujian_konversi`.`id_level` = `level`.`id`))) ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `debug_konversi`
--
ALTER TABLE `debug_konversi`
  ADD CONSTRAINT `debug_konversi_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `level` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `debug_konversi_ibfk_2` FOREIGN KEY (`id_soal`) REFERENCES `soal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `debug_konversi_ibfk_3` FOREIGN KEY (`id_soal_konversi`) REFERENCES `konversi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `debug_konversi_ibfk_4` FOREIGN KEY (`id_mahasiswa`) REFERENCES `mahasiswa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `debug_konversi_ibfk_5` FOREIGN KEY (`id_ujian_konversi`) REFERENCES `ujian_konversi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `history_confidence`
--
ALTER TABLE `history_confidence`
  ADD CONSTRAINT `history_confidence_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `level` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `history_confidence_ibfk_2` FOREIGN KEY (`id_soal`) REFERENCES `soal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `history_confidence_ibfk_3` FOREIGN KEY (`id_mahasiswa`) REFERENCES `mahasiswa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `history_jawaban`
--
ALTER TABLE `history_jawaban`
  ADD CONSTRAINT `history_jawaban_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `level` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `history_jawaban_ibfk_2` FOREIGN KEY (`id_soal`) REFERENCES `soal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `history_jawaban_ibfk_3` FOREIGN KEY (`id_mahasiswa`) REFERENCES `mahasiswa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `konversi`
--
ALTER TABLE `konversi`
  ADD CONSTRAINT `konversi_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `level` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `label_skor`
--
ALTER TABLE `label_skor`
  ADD CONSTRAINT `label_skor_ibfk_1` FOREIGN KEY (`id_soal`) REFERENCES `soal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `label_skor_ibfk_2` FOREIGN KEY (`id_mahasiswa`) REFERENCES `mahasiswa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `label_skor_ibfk_3` FOREIGN KEY (`id_level`) REFERENCES `level` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `log_data`
--
ALTER TABLE `log_data`
  ADD CONSTRAINT `log_data_ibfk_1` FOREIGN KEY (`id_soal`) REFERENCES `soal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `log_data_ibfk_2` FOREIGN KEY (`id_mahasiswa`) REFERENCES `mahasiswa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `id_kelas_fkey` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_users_fkey` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `nilai_test`
--
ALTER TABLE `nilai_test`
  ADD CONSTRAINT `nilai_test_ibfk_2` FOREIGN KEY (`id_mahasiswa`) REFERENCES `mahasiswa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nilai_test_ibfk_3` FOREIGN KEY (`id_level`) REFERENCES `level` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `nyawa`
--
ALTER TABLE `nyawa`
  ADD CONSTRAINT `nyawa_ibfk_1` FOREIGN KEY (`id_mahasiswa`) REFERENCES `mahasiswa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nyawa_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pencapaian`
--
ALTER TABLE `pencapaian`
  ADD CONSTRAINT `pencapaian_ibfk_1` FOREIGN KEY (`id_mahasiswa`) REFERENCES `mahasiswa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `soal`
--
ALTER TABLE `soal`
  ADD CONSTRAINT `id_level_fkey` FOREIGN KEY (`id_level`) REFERENCES `level` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ujian`
--
ALTER TABLE `ujian`
  ADD CONSTRAINT `ujian_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `level` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ujian_ibfk_2` FOREIGN KEY (`id_soal`) REFERENCES `soal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ujian_ibfk_3` FOREIGN KEY (`id_mahasiswa`) REFERENCES `mahasiswa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ujian_kode`
--
ALTER TABLE `ujian_kode`
  ADD CONSTRAINT `ujian_kode_id_bank_soal_konversi_foreign` FOREIGN KEY (`id_bank_soal_konversi`) REFERENCES `bank_soal_konversi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ujian_kode_id_level_foreign` FOREIGN KEY (`id_level`) REFERENCES `level` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ujian_kode_id_mahasiswa_foreign` FOREIGN KEY (`id_mahasiswa`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ujian_konversi`
--
ALTER TABLE `ujian_konversi`
  ADD CONSTRAINT `ujian_konversi_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `level` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ujian_konversi_ibfk_2` FOREIGN KEY (`id_soal_konversi`) REFERENCES `konversi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ujian_konversi_ibfk_3` FOREIGN KEY (`id_mahasiswa`) REFERENCES `mahasiswa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
