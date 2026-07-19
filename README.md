# 💼 Job Tracker - Panduan Setup untuk Pemula (Beginner-Friendly Guide)

Selamat datang! Aplikasi **Job Tracker** ini dirancang untuk membantumu mencatat, mengelola, dan memantau status lamaran pekerjaanmu dalam satu dashboard yang modern (gelap/dark mode). Tidak perlu lagi mengecek email satu per satu atau mencatat manual di Excel!

Aplikasi ini menggunakan teknologi **React (Frontend)**, **Express Node.js (Backend)**, dan **MySQL (Database)**.

---

## 🛠️ Persiapan Awal (Yang Harus Di-install)

Sebelum menjalankan aplikasi, pastikan kamu sudah menginstall 2 software gratis berikut di komputermu:

1. **Node.js (versi 18 ke atas)**:
   - Berfungsi untuk menjalankan server JavaScript di komputermu.
   - Download dan install dari [https://nodejs.org/](https://nodejs.org/) (pilih versi **LTS**).
2. **MySQL Server & MySQL Workbench**:
   - Berfungsi sebagai tempat penyimpanan data lamaran pekerjaanmu (Database).
   - Download dan install dari [https://dev.mysql.com/downloads/installer/](https://dev.mysql.com/downloads/installer/).
   - **Penting**: Saat install MySQL, ingat-ingat **Password Root** yang kamu buat!

---

## ⚙️ Langkah-Langkah Setup Aplikasi (Step-by-Step)

Ikuti langkah-langkah di bawah ini secara berurutan untuk menjalankan aplikasi pertama kali:

### Langkah 1: Buat Database di MySQL
1. Buka aplikasi **MySQL Workbench** yang sudah kamu install.
2. Hubungkan ke database lokalmu (biasanya bernama *Local Instance*).
3. Buka tab query baru, lalu ketik perintah berikut untuk membuat database kosong:
   ```sql
   CREATE DATABASE job_tracker;
   ```
4. Klik tombol **Petir** di menu atas untuk menjalankan perintah tersebut. Database bernama `job_tracker` sekarang sudah berhasil dibuat!

---

### Langkah 2: Konfigurasi File Koneksi Database (`.env`)
Aplikasi perlu tahu username & password MySQL milikmu agar bisa menyimpan data lamaran.
1. Buka folder **`backend/`**.
2. Cari file bernama **`.env`** (jika belum ada, salin file `.env.example` lalu ubah namanya menjadi `.env`).
3. Buka file `.env` tersebut menggunakan Notepad atau VS Code.
4. Ubah baris `DATABASE_URL` sesuai dengan password MySQL milikmu.
   - Format: `mysql://USER:PASSWORD@localhost:PORT/DATABASE`
   - Contoh jika password MySQL kamu adalah `rahasia123`:
     ```env
     DATABASE_URL="mysql://root:rahasia123@localhost:3306/job_tracker"
     ```
5. Simpan file `.env` tersebut.

---

### Langkah 3: Install Semua Kebutuhan Aplikasi (Dependencies)
1. Buka terminal komputermu (Command Prompt / PowerShell / Git Bash) di folder utama **`job-tracker/`**.
2. Jalankan perintah berikut untuk menginstall library yang dibutuhkan secara otomatis:
   ```bash
   npm run install:all
   ```
3. Tunggu hingga proses install selesai (pastikan koneksi internetmu aktif).

---

### Langkah 4: Sinkronisasi Database (Database Migration)
Langkah ini berguna untuk membuat tabel-tabel database (seperti tabel User, Lamaran Kerja, dan Catatan Log) secara otomatis.
1. Di terminal yang sama, masuk ke folder backend:
   ```bash
   cd backend
   ```
2. Jalankan perintah migrasi database berikut:
   ```bash
   npx prisma migrate dev --name init
   ```
3. Jika ditanya untuk membuat client, biarkan berjalan sampai selesai. Database kamu sekarang sudah siap digunakan!

---

### Langkah 5: Jalankan Aplikasi!
1. Kembali ke folder utama aplikasi:
   ```bash
   cd ..
   ```
2. Jalankan aplikasi frontend dan backend sekaligus dengan perintah:
   ```bash
   npm run dev
   ```
3. Aplikasi sudah aktif! Buka browsermu dan akses alamat berikut:
   - **Aplikasi (Frontend)**: [http://localhost:3000](http://localhost:3000) (Ini halaman visual dashboard-nya!)
   - **Server (Backend API)**: [http://localhost:5000](http://localhost:5000)

---

## 💡 Fitur Keren & Cara Penggunaan

- **Registrasi & Login**: Buat akun barumu terlebih dahulu di halaman utama untuk mulai menggunakan dashboard.
- **Papan Kanban (Visual Board)**: Kamu bisa menggeser (drag-and-drop) kartu lamaran kerja dari kolom *Wishlist* ke *Applied*, *Interviewing*, *Offer*, atau *Rejected* secara langsung.
- **Pemisahan Tipe & Lokasi**: Kamu bisa mengatur lokasi kerja (misal: Jakarta), cara kerja (Remote, Hybrid, On-site), dan status lamaran secara terpisah.
- **Format Gaji Otomatis**: Ketik nominal gaji, dan sistem akan otomatis memberi titik/koma ribuan sesuai mata uang yang kamu pilih (misal: IDR Rp 4.000.000 atau USD $1,500).
- **Loker Kadaluarsa**: Masukkan tanggal batas waktu (deadline). Jika melewati batas waktu tersebut, sistem akan memberi label merah **Expired** secara otomatis pada list view.
- **Catatan / Log Lamaran**: Klik tombol **Detail** pada lamaran kerja untuk menambah catatan perkembangan lamaran (misal: "Interview user tanggal 25", "Mengerjakan take home test").

---

## 🛠️ Mengatasi Masalah (Troubleshooting)

### 1. Muncul error `EPERM: operation not permitted` saat setup prisma
- **Penyebab**: Windows mengunci file generator database karena server development (`npm run dev`) sedang berjalan di background.
- **Solusi**:
  1. Hentikan server development dengan menekan tombol **Ctrl + C** di terminal.
  2. Jalankan perintah `npx prisma generate` di dalam folder `backend/`.
  3. Jalankan kembali aplikasi dengan `npm run dev`.

### 2. Gagal terhubung ke MySQL
- **Penyebab**: Password atau port database pada file `.env` salah.
- **Solusi**: Cek kembali password MySQL kamu saat instalasi pertama kali, lalu sesuaikan port-nya (default: `3306`).
