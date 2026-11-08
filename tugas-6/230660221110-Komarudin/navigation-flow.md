# Navigation Flow - Aplikasi Perpustakaan Digital

## 1. Daftar Route
| Nama Route | Layar (Screen) | Kebutuhan yang Dipenuhi | `initialRoute` |
| :--- | :--- | :--- | :--- |
| `/` | `HalamanKatalog` | F-01: Pencarian / Melihat Katalog Buku | Ya |
| `/detail` | `HalamanDetail` | F-05: Melihat detail dan ketersediaan | Tidak |
| `/reservasi` | `HalamanFormReservasi` | F-05: Mengajukan reservasi buku | Tidak |

## 2. Diagram Navigation Flow (Tugas *Must Have*: Reservasi Buku)
```mermaid
graph TD
    A([Mulai Aplikasi]) --> B[Halaman Katalog /]
    B -->|Pilih Buku pushNamed /detail, args: dataBuku| C[Halaman Detail /detail]
    C -->|Klik Reservasi pushNamed /reservasi, args: judul| D[Halaman Form Reservasi /reservasi]
    D -->|Isi Form & Validasi Gagal| D
    D -->|Submit Sukses tampilkan SnackBar| E[Proses Reservasi]
    E -->|Kembali pop| C
    C -->|Kembali pop| B

3. Alasan Pemilihan initialRoute
Route / (Halaman Katalog) dipilih sebagai initialRoute karena langkah paling masuk akal bagi pengguna perpustakaan saat membuka aplikasi adalah melihat daftar buku yang tersedia terlebih dahulu, sebelum mereka dapat melakukan aksi lain seperti melihat detail atau mengisi formulir peminjaman/reservasi.