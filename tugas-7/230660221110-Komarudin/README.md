# Tugas 7 — MVP Awal dengan Data Lokal

**Identitas Mahasiswa**
- Nama: Komarudin Anshar Rahendra
- NPM: 230660221110
- Program Studi: Sistem Informasi
- Domain: Sistem Informasi Perpustakaan

## Daftar File
1. `model-data.md`: Daftar entitas data utama dan penjelasan field.
2. `crud-lokal.dart`: Kode sumber implementasi Model Data dan operasi CRUD pada Flutter.
3. `catatan-keputusan-data.md`: Tabel landasan keputusan arsitektur data.
4. `screenshot-daftar.png`: Tangkapan layar beranda setelah data berhasil ditambahkan (Create/Read).
5. `screenshot-hapus.png`: Tangkapan layar ketika dialog konfirmasi penghapusan (Delete) muncul.

## 6. Deklarasi Penggunaan AI
Dalam pengerjaan tugas ini, AI (Google Gemini) digunakan sebagai referensi untuk menstrukturkan pemanggilan fungsi `setState` pada operasi *Update* dan *Delete* di dalam `ListView.builder`. AI juga membantu menyederhanakan alur form *Create* dan *Update* agar dapat menggunakan satu fungsi `AlertDialog` yang sama guna menghindari duplikasi kode (*boilerplate*). Keputusan logika bisnis, field model, dan pencocokan dengan dokumen kebutuhan sepenuhnya dianalisis secara mandiri.

## 7. Refleksi
Bagian yang paling sulit dipertahankan konsistensinya adalah menyesuaikan alur *Update* (penggantian objek) antara *State* di dalam `List` dengan tampilan *Form* pengguna. Ketika pengguna menekan tombol *Edit*, saya harus merancang logika agar *controller form* membaca nilai dari objek yang tepat, lalu memastikan bahwa aksi *Simpan* menimpa data yang lama, bukan menambah objek baru. Selain itu, membungkus setiap operasi mutasi data ke dalam blok `setState` menuntut kehati-hatian agar UI (`ListView.builder`) tidak gagal merender (*re-render*) pembaruan data secara *real-time*.