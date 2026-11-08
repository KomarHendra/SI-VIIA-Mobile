```markdown
# Catatan Keputusan Navigasi

| Komponen | Keputusan | Alasan (Berdasarkan Kebutuhan/Persona) |
| :--- | :--- | :--- |
| **Data yang Dikirim (Arguments)** | Mengirim *Map* berisi `judul` dan `penulis` dari `/` ke `/detail` lalu ke `/reservasi`. | Andi (Persona 1) perlu melihat judul buku yang ia pilih di setiap halaman agar yakin ia tidak salah memesan buku. |
| **Validator Field "Nama"** | Wajib diisi, tidak boleh kosong. | Admin (Bu Rina) butuh data nama peminjam yang valid untuk dicatat di sistem sirkulasi (F-03). |
| **Validator Field "NPM"** | Wajib diisi, minimal 10 karakter. | Sistem perpustakaan kampus mewajibkan identitas resmi mahasiswa untuk mencocokkan data reservasi. |
| **Feedback (SnackBar)** | Teks: *"Reservasi untuk [Judul Buku] berhasil diajukan!"* (Warna Hijau). | Memberikan konfirmasi visual yang jelas kepada mahasiswa bahwa tugasnya (mengamankan buku) telah selesai. |