# Tugas 6 — Navigation Flow dan Interaksi

**Identitas Mahasiswa**
- Nama: Komarudin Anshar Rahendra
- NPM: 230660221110
- Program Studi: Sistem Informasi
- Domain: Sistem Informasi Perpustakaan

## Daftar File
1. `navigation-flow.md`: Daftar route dan diagram alur navigasi aplikasi.
2. `catatan-keputusan-navigasi.md`: Alasan di balik keputusan pengiriman data dan validasi form.
3. `form-interaksi.dart`: Kode sumber implementasi navigasi dan formulir pada Flutter.
4. `screenshot-alur.png`: Bukti tangkapan layar saat halaman detail buku berhasil terbuka.
5. `screenshot-feedback.png`: Bukti tangkapan layar saat validasi berhasil dan SnackBar muncul.

## 6. Deklarasi Penggunaan AI
Dalam pengerjaan tugas ini, saya menggunakan AI (Google Gemini) untuk membantu menyusun struktur `ModalRoute.of(context)?.settings.arguments` guna memastikan *null safety* dan *type checking* berjalan dengan aman saat mengirim data antar rute. Selain itu, AI membantu merapikan sintaks diagram Mermaid agar sesuai dengan hierarki rute yang telah saya tentukan. Konsep formulir dan keputusan validasi adalah murni hasil rumusan studi kasus perpustakaan saya sendiri.

## 7. Refleksi
Bagian yang paling sulit dipertahankan konsistensinya adalah memastikan data yang dikirim melalui parameter `arguments` di kode Flutter benar-benar selaras dengan apa yang telah saya tulis di *Navigation Flow* dan catatan keputusan. Saya sempat kebingungan saat menentukan apakah data yang dilempar harus berupa *String* tunggal atau keseluruhan objek (*Map*), karena perubahan pada struktur data ini mewajibkan saya mengedit ulang diagram Mermaid dan pemeriksaan tipe cabang *null* di halaman tujuan. Selain itu, memastikan *controller* benar-benar dihancurkan (*dispose*) di siklus hidup *StatefulWidget* membutuhkan ketelitian ekstra agar aplikasi tidak mengalami kebocoran memori.