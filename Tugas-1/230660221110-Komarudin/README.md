# Tugas 1 — Identifikasi Kebutuhan Aplikasi Bergerak

## 👤 Identitas Mahasiswa

* **Nama:** Komarudin Anshar Rahendra

* **NPM:** 230660221110

* **Program Studi:** Sistem Informasi 

* **Fakultas:** Teknologi Informasi

* **Perguruan Tinggi:** Universitas Sebelas April (UNSAP)

## 📌 Domain Sistem Informasi

**Domain:** Sistem Informasi Perpustakaan Digital Mobile

## 📄 Ringkasan Tugas

### 1. Deskripsi Sistem

Sistem Informasi Perpustakaan Digital Mobile dirancang untuk mahasiswa dan pustakawan kampus guna mengatasi kendala antrean panjang saat peminjaman manual, lamanya proses pencarian lokasi fisik buku di rak, serta seringnya keterlambatan pengembalian buku akibat lupa tanggal jatuh tempo. Solusi berbasis aplikasi *mobile* sangat tepat karena mengoptimalkan karakteristik ***portability***, di mana mahasiswa dapat mencari katalog buku, mengecek ketersediaan stok, dan mengajukan perpanjangan peminjaman secara *real-time* kapan saja dan di mana saja langsung dari smartphone. Selain itu, aplikasi ini memanfaatkan karakteristik ***context-awareness*** dengan mengintegrasikan sensor kamera perangkat untuk memindai kode *barcode/QR code* pada fisik buku secara langsung saat proses reservasi maupun peminjaman mandiri di area perpustakaan.

### 2. Diagram Arsitektur

Arsitektur alur komunikasi data antara **Aplikasi Mobile Flutter** $\rightarrow$ **HTTP Request** $\rightarrow$ **Backend SI** $\rightarrow$ **Database** $\rightarrow$ **HTTP Response** $\rightarrow$ **Aplikasi Mobile**.

```
graph LR
    A[Aplikasi Mobile Flutter] -->|HTTP Request / REST API| B[Backend API SI Perpustakaan]
    B -->|Query / SQL Read-Write| C[(Database MySQL/PostgreSQL)]
    C -->|Return Data JSON| B
    B -->|HTTP Response 200 OK| A

```

> **Berkas Diagram:** Kode sumber Mermaid tersimpan dalam repositori ini (`architecture_diagram.mmd`) beserta hasil ekspor gambarnya (`architecture_diagram.png`).

### 3. Tabel Kebutuhan System

| No | Permintaan Pengguna | Pengguna Target | Karakteristik Mobile | Fitur Aplikasi | Perkiraan Materi Pemenuh | 
| ----- | ----- | ----- | ----- | ----- | ----- | 
| **1** | Pengguna ingin mencari dan melihat katalog buku beserta status ketersediaannya secara cepat. | Mahasiswa | *Portability* | Pencarian & Katalog Buku Digital | Minggu 2 – Layouting & Widgets Dasar | 
| **2** | Pengguna ingin masuk ke akun pribadi untuk melihat riwayat peminjaman dan denda. | Mahasiswa & Pustakawan | *Personalization* | Autentikasi Login & Profil Pengguna | Minggu 4 – State Management & Form Handling | 
| **3** | Pengguna ingin memindai kode buku di rak untuk langsung melihat detail dan lokasi raknya. | Mahasiswa | *Context-awareness* (Kamera) | Pemindai Barcode / QR Code Buku | Minggu 6 – Device Hardware Integration | 
| **4** | Pengguna ingin mendapatkan peringatan otomatis sebelum masa peminjaman buku berakhir. | Mahasiswa | *Real-time Communication* | Push Notification Pengingat Tenggat | Minggu 7 – Local & Push Notifications | 
| **5** | Pengguna ingin menyimpan lokasi buku favorit ke daftar bacaan pribadi. | Mahasiswa | *Personalization* & *Offline Capability* | Bookmark & Riwayat Favorit (Local Storage) | Minggu 3 – Local Storage / Shared Preferences | 
| **6** | Pengguna ingin mengajukan perpanjangan durasi peminjaman buku secara mandiri tanpa harus ke loket. | Mahasiswa | *Portability* | Pengajuan Perpanjangan Mandiri via REST API | Minggu 5 – Networking & REST API Integration | 

### 4. Bukti Environment Siap

Path SDK Flutter yang dikonfigurasi: `C:\230660221110\flutter\bin`

* \[x\] **`flutter doctor -v` Sebelum Perbaikan:** Terlampir screenshot terminal saat mengalami `CommandNotFoundException` pada folder `docs/screenshots/flutter_doctor_before.png`.

* \[x\] **`flutter doctor -v` Sesudah Perbaikan:** Terlampir screenshot terminal terverifikasi centang hijau `[✓]` pada folder `docs/screenshots/flutter_doctor_after.png`.

* \[x\] **Aplikasi Counter Berjalan:** Terlampir screenshot running aplikasi `app_pertama` di target emulator/web pada `docs/screenshots/counter_app_running.png`.

### 5. Refleksi

Fitur perangkat yang paling relevan untuk domain Sistem Informasi Perpustakaan adalah **kamera (pemindaian barcode/QR code)** dan **notifikasi lokal/push notification**. Fitur kamera memungkinkan mahasiswa memindai kode unik buku secara *instant* langsung dari rak untuk mengecek ketersediaan atau melakukan peminjaman mandiri tanpa perlu memasukkan kode buku secara manual. Sementara itu, fitur notifikasi sangat krusial untuk mengirimkan pengingat otomatis tanggal jatuh tempo pengembalian ke bilah pemberitahuan ponsel pengguna, sehingga secara efektif mencegah keterlambatan pengembalian dan sanksi denda.