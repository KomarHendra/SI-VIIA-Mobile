# Tugas 5 — Prototype UI/UX

**Identitas Mahasiswa**
- Nama: Komarudin Anshar Rahendra
- NPM: 230660221110
- Program Studi: Sistem Informasi
- Domain: Sistem Informasi Perpustakaan

## Daftar File
1. `information-architecture.md`: Penjelasan struktur layar dan diagram IA.
2. `catatan-keputusan-ui.md`: Tabel alasan pengambilan keputusan UI.
3. `halaman-utama.dart`: Kode sumber UI menggunakan Flutter.
4. `wireframe.png`: Sketsa kasar (low-fidelity) dari antarmuka aplikasi.
5. `screenshot-halaman.png`: Tangkapan layar hasil eksekusi kode Flutter.

## 6. Deklarasi Penggunaan AI
Dalam pengerjaan tugas ini, saya menggunakan AI (Google Gemini) untuk membantu menstrukturkan kode *Material 3* pada Flutter, khususnya dalam menerapkan skenario *ternary operator* untuk pewarnaan dinamis pada widget status. AI juga digunakan untuk memvalidasi alur diagram *Information Architecture* agar sesuai dengan kebutuhan fungsional dari tugas sebelumnya. Seluruh data dan studi kasus tetap merupakan hasil perumusan pribadi.

## 7. Refleksi
Bagian yang paling sulit dipertahankan konsistensinya adalah menyesuaikan presisi jarak (*margin/padding*) antara sketsa kasar di *wireframe* dengan hasil kodingan nyata di Flutter dan catatan keputusan UI. Seringkali tata letak yang terlihat proporsional di *wireframe* menjadi terlalu padat saat diimplementasikan ke dalam widget `Card` dan `ListTile` bawaan *Material 3*. Hal ini memaksa saya untuk melakukan beberapa penyesuaian ulang pada kode agar desain tetap mengikuti prinsip hierarki visual yang saya tulis di catatan keputusan.