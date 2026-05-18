# New Pseudolearn with Laravel 12 Metronics Bootstrap

## 📌 Deskripsi
**New Pseudolearn** adalah aplikasi pembelajaran interaktif berbasis web yang dikembangkan menggunakan **Laravel 12**, **PHP 8.2**, **Metronic 8.2.0**, dan **Bootstrap**.  
Proyek ini menggunakan **Service-Repository Pattern** dengan **Custom Core Components** seperti:
- `BaseModel`
- `BaseBuilder`
- `BaseResponse`

Tujuan utama aplikasi ini adalah menyediakan platform latihan pemrograman (pseudocode dan konversi program), pengelolaan soal, analisis data mahasiswa, serta sistem leaderboard.

---

## ✨ Fitur

### 👨‍💻 Admin
- Manajemen Level
- Manajemen Soal
- Konversi Program
- Data Mahasiswa
- Analisa Data (clustering & statistik)

### 🎓 Mahasiswa
- Dashboard
- Profil Mahasiswa
- Latihan Soal (Pseudocode & Konversi Program)
- Leaderboard
- Progress Tracking

---

## ⚙️ Tech Stack
- **Laravel 12**
- **PHP 8.2**
- **Metronic 8.2.0**
- **Bootstrap**
- **Service-Repository Pattern**
- **Custom Core Components**

---

## 🚀 Installation

### Prerequisites
Pastikan sudah menginstall:
- [PHP 8.2](https://www.php.net/downloads)
- [Composer](https://getcomposer.org/)
- [Node.js & npm](https://nodejs.org/)
- [MySQL](https://dev.mysql.com/downloads/)

### Langkah-langkah

```bash
# 1. Clone repository
git clone https://github.com/bintangsholu21/new-pseudolearn.git
cd new-pseudolearn

# 2. Install dependencies
composer install

# 3. Copy file .env
cp .env.example .env

# 4. Generate key
php artisan key:generate

# 5. Optimize
php artisan optimize

# 6. Jalankan server
php artisan serve
````

---

## 🗄️ Installation Database

1. Buka folder `db-backups`
2. Download file **`new_pseudolearn.sql`**
3. Buka database manager (contoh: phpMyAdmin, Navicat, DBeaver, dll)
4. Buat database baru dengan nama **`new_pseudolearn`**
5. Klik kanan pada database → pilih **Run SQL**
6. Import file `new_pseudolearn.sql`
7. Jalankan query hingga selesai

---

## 🏆 Kontribusi

Pull request sangat terbuka untuk pengembangan lebih lanjut.
Silakan buat branch baru dan ajukan PR.

---

## 📄 Lisensi

Proyek ini dikembangkan untuk tujuan pembelajaran dan riset.
Lisensi mengikuti [MIT License](LICENSE).
