# Information Architecture (IA) - Aplikasi Perpustakaan Digital

## 1. Inventaris Layar
Berikut adalah daftar layar berdasarkan pemetaan kebutuhan fungsional (Tugas 4):
1. **Halaman Beranda / Katalog Buku** (Memenuhi F-01)
2. **Halaman Pinjaman Saya** (Memenuhi F-02, F-06)
3. **Halaman Detail Buku & Reservasi** (Memenuhi F-05)
4. **Halaman Dashboard Admin / Pustakawan** (Memenuhi F-03, F-04)

## 2. Diagram IA
```mermaid
graph TD
    A[Halaman Beranda / Katalog] --> B[Halaman Detail Buku]
    A --> C[Halaman Pinjaman Saya]
    C --> D[Halaman Riwayat Peminjaman]
    E[Dashboard Admin] --> F[Halaman Verifikasi Pinjaman]
    E --> G[Halaman Proses Pengembalian]

## 3. Alasan Pemilihan Layar Utama
Halaman Pinjaman Saya dipilih sebagai salah satu layar utama untuk di- prototype karena layar ini menyelesaikan masalah utama dari Persona 1 (Andi), yaitu sering lupa tenggat waktu pengembalian buku. Dengan menjadikan status peminjaman sebagai informasi yang paling cepat diakses, risiko denda akibat keterlambatan dapat diminimalisir.