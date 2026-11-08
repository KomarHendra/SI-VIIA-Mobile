# Laporan Progress Project UTS (Milestone M4)

| | |
|:--|:--|
| **Nama** | Komarudin Anshar Rahendra |
| **NIM** | 230660221110 |
| **Kelas** | SI-VIIA |
| **Domain SI** | Sistem Informasi Perpustakaan |
| **Judul Aplikasi** | Aplikasi Perpustakaan Digital (DigiLib) |
| **Tautan Repository** | https://github.com/KomarHendra/SI-VIIA-Mobile/tree/main/tugas-8 |

---

## 1. Ringkasan Eksekutif Project
Aplikasi Perpustakaan Digital (DigiLib) dibangun untuk memecahkan masalah sirkulasi administrasi perpustakaan, khususnya kendala mahasiswa yang sering membuang waktu datang secara fisik ke perpustakaan hanya untuk mendapati bahwa buku referensi tugas yang mereka cari sedang dipinjam oleh orang lain, serta masalah kelupaan dalam pengembalian buku. 

Pengguna aplikasi ini utamanya adalah mahasiswa aktif (peminjam) dan petugas sirkulasi. Solusi ini dibangun berbasis aplikasi perangkat bergerak (mobile) karena ponsel memungkinkan mahasiswa mengakses ketersediaan katalog *real-time* dari mana pun, mendukung pengiriman *push-notification* sebagai pengingat batas waktu pengembalian, serta mempercepat otorisasi peminjaman berbasis pindaian cepat antar muka di meja pustakawan.

## 2. Ketercapaian Milestone (M1 s.d. M3)

| Milestone | Deliverable | Status (Selesai / Sebagian) | Catatan / Bukti |
|:----------|:------------|:----------------------------|:----------------|
| M1: Kebutuhan | Dokumen kebutuhan + User Flow | Selesai | File `dokumen-kebutuhan.md` di folder `tugas-4/` |
| M2: UI/UX | Wireframe + Navigasi | Selesai | File `wireframe.png` & `navigation-flow.md` di `tugas-5/` & `tugas-6/` |
| M3: MVP Awal | Model data + CRUD lokal | Selesai | File `crud-lokal.dart` dan laporan di `tugas-7/` |

## 3. Matriks Kebutuhan ke Implementasi

| ID Kebutuhan | Deskripsi Kebutuhan | Prioritas MoSCoW | Halaman Pemenuh | Operasi Data Terkait |
|:-------------|:-------------------|:----------------:|:----------------|:---------------------|
| F-01 | Mahasiswa mencari/melihat ketersediaan katalog | Must | Halaman Katalog Buku | Read |
| F-02 | Mahasiswa melihat daftar pinjaman aktif | Must | Halaman Pinjaman Saya | Read |
| F-05 | Mahasiswa mengajukan reservasi/peminjaman | Should (Must untuk MVP ini) | Dialog Form Reservasi | Create |
| F-03/04| Mengubah status verifikasi / pengembalian | Must | Dialog Edit / Halaman Admin| Update |
| NF/Ops | Menghapus riwayat atau membatalkan reservasi | Could | Halaman Pinjaman Saya | Delete |

## 4. Tangkapan Layar Aplikasi Berjalan
*(Gambar-gambar di bawah direferensikan dari aset praktik CRUD tugas 7 dan navigasi tugas 6)*
1. Halaman utama / daftar data `screenshot-daftar.png`
2. Halaman form pengisian data dengan validasi `screenshot-form.png`
3. Dialog konfirmasi aksi (ubah/hapus) `screenshot-hapus.png`

## 5. Kendala dan Solusi Teknis
| No. | Kendala | Cara Mengatasinya |
|:---:|:---|:---|
| 1 | **Unbounded Height pada UI**: Aplikasi mengalami *crash* UI (*RenderFlex overflow*) ketika menyusun `ListView.builder` statis bersamaan dengan *widget* lain di dalam *Column*. | Membungkus `ListView.builder` dengan widget `Expanded` agar list menempati sisa bidang secara terukur, tidak meminta tinggi layar tak terhingga. |
| 2 | **Handling Error Pengiriman Arguments Route**: Terdapat potensi *null check operator exception* saat navigasi detail dilakukan, karena ada kemungkinan rute dijalankan tanpa mengirim `Map` parameter buku yang valid. | Menambahkan validasi `if (args == null || args is! Map)` untuk memastikan *arguments* memiliki nilai sebelum membangun `Text` Halaman Detail. |

## 6. Rencana Pengembangan Milestone M5 (REST API)
Pada pertemuan selanjutnya, data `List<Buku>` yang bersifat lokal statis (*in-memory*) akan digantikan menjadi *dynamic data*. Aplikasi akan mengambil katalog buku (*GET request*) langsung dari URL REST API (Sistem Informasi Perpustakaan Backend), lalu data Reservasi Peminjaman (*Create*) akan dikirim balik menggunakan metode HTTP POST dalam format JSON. Dibutuhkan pustaka HTTP Flutter dan model asinkron (*Future/async/await*).

## 7. Refleksi Pembelajaran Tengah Semester
Selama tengah semester ini, tantangan terbesar adalah beradaptasi dari sekadar membuat tampilan (UI) menjadi memikirkan aliran logika state. Memahami fungsi `setState` dalam siklus hidup `StatefulWidget` menyadarkan saya bahwa dalam arsitektur Flutter, layar UI bertindak sebagai respons (*reflection*) pasif dari data, bukan tempat penyimpanan data itu sendiri. Menyelaraskan antara interaksi pengguna, mutasi memori (*List CRUD*), dan perubahan antarmuka memaksa saya berlatih menyusun hierarki komponen (Widget Tree) yang terstruktur agar kode tetap modular.

## 8. Deklarasi Penggunaan AI
Deklarasi penggunaan AI: Google Gemini — membantu memberikan masukan (feedback) pemformatan *Markdown* dan pendamping dalam penjelasan (*troubleshoot*) kesalahan kompilasi teknis untuk validasi form serta pengelolaan variabel bertipe *null-safe* Dart (*type checking arguments*); perumusan analisis keputusan, kasus operasional sistem informasi, dan verifikasi struktur kode dilakukan mandiri oleh penulis.