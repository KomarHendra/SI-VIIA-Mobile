# Model Data - Aplikasi Perpustakaan Digital

## 1. Daftar Entitas Data Utama
**Entitas: Reservasi Buku (Peminjaman)**

| Field (Atribut) | Tipe Data | Kebutuhan yang Dipenuhi |
| :--- | :--- | :--- |
| `id` | `String` | Kunci unik untuk membedakan setiap data reservasi (F-05). |
| `judulBuku` | `String` | Mengetahui buku apa yang sedang dipinjam/direservasi (F-01, F-05). |
| `namaPeminjam` | `String` | Identitas mahasiswa yang melakukan peminjaman untuk pendataan admin (F-03). |

## 2. Penjelasan Sumber Nilai Field
* **`id`**: Nilainya berasal dari **sistem** (dibuat secara otomatis menggunakan waktu/tanggal saat data disimpan, misal `DateTime.now().toString()`) agar selalu unik dan tidak terjadi duplikasi.
* **`judulBuku`**: Nilainya berasal dari **form input** pengguna, di mana pengguna mengetikkan judul buku yang ingin mereka reservasi.
* **`namaPeminjam`**: Nilainya berasal dari **form input** (isian profil/nama lengkap) saat pengguna mengajukan reservasi, digunakan pustakawan untuk verifikasi.