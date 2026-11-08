# Tugas 4 — Dokumen Kebutuhan dan User Flow

**Identitas Mahasiswa**
- Nama: Komarudin Anshar Rahendra
- NPM: 230660221110
- Domain: Sistem Informasi Perpustakaan

---

## 1. Deskripsi Aplikasi
Aplikasi Perpustakaan Digital (DigiLib) adalah platform manajemen sirkulasi buku yang dirancang untuk mengatasi masalah mahasiswa yang sering membuang waktu datang ke perpustakaan hanya untuk mendapati buku yang dicari sedang dipinjam, serta sering lupa mengembalikan buku karena hilangnya kartu pinjam fisik. Solusi ini dibangun dalam bentuk aplikasi *mobile* karena mahasiswa selalu membawa ponsel cerdas mereka, memungkinkan akses katalog secara *real-time* dari mana saja, memfasilitasi notifikasi pengingat tenggat waktu secara langsung, dan mempercepat proses transaksi di meja sirkulasi melalui pemindaian kode QR di layar ponsel.

## 2. User Persona

**Persona 1 — Andi — Mahasiswa Peminjam**
| Komponen | Isi |
| :--- | :--- |
| Nama dan peran | Andi — Mahasiswa Peminjam |
| Tujuan | Mencari ketersediaan buku referensi tugas dan memantau jadwal pengembalian buku. |
| Kendala | Sering lupa tenggat waktu pengembalian buku dan kesulitan melacak lokasi fisik buku di rak perpustakaan. |
| Perangkat dan konteks | Smartphone Android, digunakan saat berada di area kampus, kos, atau saat sedang menyusun tugas. |
| Frekuensi penggunaan | 1–3 kali seminggu menjelang masa ujian atau pengumpulan tugas. |

**Persona 2 — Bu Rina — Pustakawan (Admin)**
| Komponen | Isi |
| :--- | :--- |
| Nama dan peran | Bu Rina — Pustakawan Sirkulasi |
| Tujuan | Memverifikasi transaksi peminjaman/pengembalian dan memperbarui status ketersediaan buku dengan cepat. |
| Kendala | Antrean panjang mahasiswa pada jam istirahat dan risiko kesalahan pencatatan denda secara manual. |
| Perangkat dan konteks | Tablet Android atau Ponsel, digunakan di belakang meja sirkulasi perpustakaan selama jam kerja. |
| Frekuensi penggunaan | Setiap hari kerja, sepanjang jam operasional perpustakaan. |

## 3. Kebutuhan Fungsional

| ID | Rumusan Kebutuhan | Terkait Persona |
| :--- | :--- | :--- |
| F-01 | Mahasiswa dapat mencari judul buku agar mengetahui status ketersediaannya. | Persona 1 |
| F-02 | Mahasiswa dapat melihat daftar pinjaman aktif untuk memantau batas waktu pengembalian. | Persona 1 |
| F-03 | Pustakawan dapat memverifikasi permintaan pinjaman agar buku berstatus dipinjam. | Persona 2 |
| F-04 | Pustakawan dapat memproses pengembalian agar stok buku kembali tersedia di sistem. | Persona 2 |
| F-05 | Mahasiswa dapat melakukan reservasi buku agar buku tidak diambil orang lain sebelum diambil fisik. | Persona 1 |
| F-06 | Mahasiswa dapat melihat riwayat peminjaman untuk referensi tugas di masa mendatang. | Persona 1 |
| F-07 | Mahasiswa dapat membayar denda keterlambatan melalui integrasi dompet digital agar proses lebih praktis. | Persona 1 |

## 4. Kebutuhan Nonfungsional

| ID | Kategori | Rumusan | Kriteria Terukur |
| :--- | :--- | :--- | :--- |
| NF-01 | Kinerja | Sistem merespons pencarian katalog buku dengan cepat tanpa jeda yang mengganggu. | Waktu muat daftar buku hasil pencarian maksimal 3 detik pada koneksi 4G. |
| NF-02 | Kegunaan | Antarmuka peminjaman dirancang ringkas agar mahasiswa mudah menggunakannya. | Proses reservasi buku selesai maksimal dalam 4 kali ketukan (klik) dari Halaman Beranda. |

## 5. Prioritas Fitur (MoSCoW)

| Prioritas | ID Kebutuhan | Alasan |
| :--- | :--- | :--- |
| Must have | F-01, F-02, F-03, F-04 | Merupakan fungsi inti (sirkulasi dasar) dari sebuah Sistem Informasi Perpustakaan. Tanpa fitur ini, aplikasi tidak bisa beroperasi. |
| Should have | F-05 | Sangat penting untuk efisiensi mahasiswa agar tidak kehabisan buku, namun sistem sirkulasi manual masih bisa berjalan tanpanya. |
| Could have | F-06 | Bermanfaat untuk pengalaman pengguna (membantu mengingat referensi lama), tetapi tidak mendesak untuk peluncuran versi pertama. |
| Won't have (saat ini) | F-07 | Memerlukan pihak ketiga (Payment Gateway) dan regulasi keuangan kampus yang kompleks, sehingga ditunda untuk rilis versi selanjutnya. |

## 6. Pemetaan Kebutuhan ke Antarmuka

| ID Kebutuhan | Rumusan (ringkas) | Prioritas | Halaman yang Memenuhi | Widget yang Direncanakan (P3) |
| :--- | :--- | :--- | :--- | :--- |
| F-01 | Pencarian katalog buku | Must | Halaman Katalog Buku | Scaffold, Column, TextField, ListView.builder, Card |
| F-02 | Daftar pinjaman aktif | Must | Halaman Pinjaman Saya | Scaffold, ListView, Card, Row, Text |
| F-03 | Verifikasi peminjaman | Must | Halaman Dashboard Admin | Scaffold, ListView.builder, ListTile, ElevatedButton |
| F-04 | Proses pengembalian | Must | Halaman Pengembalian | Scaffold, Padding, TextField, ElevatedButton |
| F-05 | Reservasi buku | Should | Halaman Detail Buku | Scaffold, Image, Padding, Column, ElevatedButton |
| F-06 | Riwayat peminjaman | Could | Halaman Riwayat | Scaffold, ListView.builder, ListTile |

---

## 7. User Flow

### Identitas Alur
| Aspek | Isi |
| :--- | :--- |
| Nama alur | Mengajukan Reservasi (Booking) Buku |
| Aktor | Mahasiswa Peminjam (Andi) |
| Tujuan alur | Buku berhasil dipesan dan statusnya diamankan untuk diambil secara fisik. |

