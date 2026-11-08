# Tes Konsep UTS — Komarudin Anshar Rahendra (230660221110)

## Soal 1 — Konsep Aplikasi Bergerak dalam SI
Karakteristik aplikasi bergerak yang menjadikan solusi mobile lebih tepat dibandingkan web desktop untuk pengajuan surat:
1. **Karakteristik**: Portabilitas dan Aksesibilitas (Kapan Saja & Di Mana Saja).
   **Contoh penerapan**: Mahasiswa tidak perlu berada di depan laptop atau datang ke loket. Mereka dapat mengajukan surat keterangan aktif kuliah langsung dari ponsel mereka saat sedang berada di kantin atau di perjalanan menggunakan jaringan seluler.
2. **Karakteristik**: Fitur Perangkat Keras Bawaan (Kamera & Penyimpanan Lokal).
   **Contoh penerapan**: Mahasiswa dapat langsung memfoto dokumen pendukung (misalnya KTM atau slip SPP) menggunakan kamera ponsel pintar dan melampirkannya di formulir pengajuan tanpa harus melakukan pemindaian (scanning) yang rumit.
3. **Karakteristik**: Pemberitahuan Langsung (Push Notifications).
   **Contoh penerapan**: Saat surat keterangan mahasiswa telah selesai dicetak dan ditandatangani, sistem dapat mengirimkan notifikasi *real-time* ke ponsel mahasiswa agar segera diambil, yang jauh lebih efektif daripada harus mengecek status web secara manual atau menunggu email.

## Soal 2 — Dasar Pemrograman Dart
Fungsi kode:
- `List<String> daftarSurat = []`: Mendeklarasikan sebuah variabel bertipe *List* (kumpulan data/array) yang khusus menampung teks (*String*) dan menginisialisasinya sebagai senarai kosong. Ini digunakan sebagai tempat penyimpanan data (in-memory) dari surat-surat.
- `Parameter String jenis`: Parameter input dari fungsi `tambahSurat` yang menerima nilai teks (*String*) yang mewakili nama/jenis surat yang akan ditambahkan oleh pengguna.
- `jenis.isEmpty`: Properti (getter) bawaan Dart untuk memeriksa apakah *String* `jenis` bernilai kosong (tidak ada karakter sama sekali). Digunakan untuk memvalidasi input.
- `return` pada kondisi error: Digunakan untuk menghentikan eksekusi fungsi `tambahSurat` seketika jika input kosong. Hal ini mencegah baris kode di bawahnya (penambahan ke list) dieksekusi.
- `daftarSurat.add(jenis)`: Fungsi (*method*) bawaan List di Dart untuk memasukkan elemen baru (`jenis`) ke bagian paling akhir dari senarai `daftarSurat`.
- `Perulangan for`: Mekanisme perulangan yang berjalan dari indeks 0 hingga batas akhir panjang *List*, digunakan untuk mencetak setiap nama surat yang ada di dalam *List* satu per satu ke terminal.

**Kesalahan umum bila validasi `isEmpty` dihapus**: 
Aplikasi akan mengizinkan string kosong ("") masuk ke dalam database/list. Akibatnya, saat fungsi `tampilkanSurat` dipanggil, antarmuka hanya akan menampilkan nomor urut kosong yang mengganggu tampilan UI/UX dan bisa memicu celah *error* jika data tersebut dikirim ke *backend*.

## Soal 3 — Struktur Flutter dan Widget
Fungsi widget:
- `MaterialApp`: *Widget* akar (*root*) yang mengatur tema (*ThemeData*), konfigurasi dasar aplikasi bergaya Material Design, dan mendefinisikan rute navigasi.
- `Scaffold`: Kanvas utama halaman yang menyediakan kerangka tata letak visual dasar Material seperti *AppBar*, *Body*, *FloatingActionButton*, atau *BottomNavigationBar*.
- `AppBar`: Bagian *header* di atas halaman yang biasanya berisi judul aplikasi/halaman, tombol kembali, atau aksi-aksi tingkat atas lainnya.
- `Column`: *Widget layout* yang menyusun *widget-widget* anak (children) di dalamnya secara berurutan dari atas ke bawah (vertikal).
- `Text`: *Widget* untuk menampilkan string teks di layar dengan dukungan pengaturan gaya (*style*).
- `ListView.builder`: *Widget* yang membuat daftar bergulir (scrollable list) secara efisien karena hanya merender (membangun) item yang saat itu terlihat di layar (lazy loading).

**Masalah bila ListView.builder di dalam Column tanpa Expanded**:
**Penyebab**: Terjadi *error* **Unbounded height** (RenderFlex overflow). `Column` menuntut anak-anaknya untuk memiliki batas tinggi yang jelas, namun `ListView` secara bawaan ingin meluas mengambil ruang tak terbatas secara vertikal, menyebabkan konflik tata letak di mesin Flutter.
**Perbaikan**: Bungkus `ListView.builder` dengan *widget* `Expanded()`, sehingga ia hanya mengambil "sisa" ruang vertikal kosong di dalam `Column` secara terukur.

## Soal 4 — Analisis Kebutuhan dan User Flow
Klasifikasi dan prioritas:

| No. | Permintaan | Fungsional/Nonfungsional | Prioritas MoSCoW | Alasan |
|:---:|:-----------|:-------------------------|:----------------:|:-------|
| 1 | "Saya ingin mengajukan surat keterangan aktif kuliah." | Fungsional | Must have | Merupakan fungsi bisnis utama (inti) dari aplikasi. Tanpa ini, aplikasi kehilangan tujuan utamanya. |
| 2 | "Saya ingin melihat status pengajuan saya." | Fungsional | Must have | Dibutuhkan untuk transparansi proses dan mencegah mahasiswa bolak-balik bertanya ke loket fisik (memecahkan masalah antrian). |
| 3 | "Saya ingin menerima notifikasi saat surat siap diambil." | Kebutuhan Nonfungsional (bisa diinterpretasikan Fungsional pendukung) | Should have | Sangat meningkatkan *User Experience* dan efisiensi, tetapi tanpa ini pun sistem inti (pengajuan & cek manual) tetap bisa beroperasi. |

**User flow untuk kebutuhan Must (Pengajuan Surat)**:
1. Mulai: Pengguna membuka aplikasi.
2. Halaman: Tampil Halaman Beranda.
3. Proses: Pengguna mengklik tombol "Ajukan Surat Baru".
4. Halaman: Tampil Formulir Pengajuan.
5. Proses: Pengguna memilih jenis "Surat Keterangan Aktif", mengisi data diri, lalu menekan "Kirim".
6. Keputusan: Sistem memvalidasi apakah data lengkap?
   - Jika Tidak: Kembali ke formulir dengan pesan *error*.
   - Jika Ya: Simpan ke *database* dan ubah status menjadi "Menunggu Verifikasi".
7. Halaman: Menampilkan halaman detail status (Selesai).

## Soal 5 — UI/UX Mobile
1. **Prinsip**: *Touch Targets* yang proporsional (Fitts's Law).
   **Keputusan desain**: Membungkus setiap jenis surat dalam `Card` atau `ListTile` dengan tinggi minimal 48dp dan memberikan batas tombol "Ajukan" yang besar.
   **Alasan**: Jari manusia relatif lebar. Interaksi sentuh pada perangkat mobile menuntut area tekan yang luas agar mahasiswa tidak salah ketuk saat berjalan terburu-buru.
2. **Prinsip**: Hierarki Visual yang Jelas.
   **Keputusan desain**: Nama surat dibuat *Bold* dan besar (16sp), sedangkan teks *status* dibuat lebih kecil (12sp) dan diberi warna kontras (Hijau untuk selesai, Kuning untuk proses).
   **Alasan**: Dalam sesi penggunaan yang singkat (melihat layar secara sekilas), mata mahasiswa akan tertuju pada judul, lalu dibantu warna untuk memproses informasi status dalam sepersekian detik.
3. **Prinsip**: Minimalisir Beban Kognitif (Reduksi Guliran).
   **Keputusan desain**: Menambahkan *widget TextField* di atas `ListView` yang berfungsi sebagai fitur Pencarian (*Search Filter*).
   **Alasan**: Menyajikan 20 baris item mengharuskan pengguna menggulir cukup panjang. Dengan pencarian, mahasiswa bisa langsung mengetik "Aktif", dan sistem akan menyaring data agar layar tidak padat.

## Soal 6 — Navigasi dan Interaksi
Metode navigasi dan kapan digunakan:
- `push`: Menumpuk rute (*route*) baru ke atas tumpukan navigasi secara langsung dengan membuat *MaterialPageRoute*. Digunakan ketika rute bersifat dinamis atau aplikasi berskala kecil tanpa perlu manajemen *routes* terpusat.
- `pushNamed`: Memanggil rute baru menggunakan pengenal (*String*) yang sudah didaftarkan pada properti `routes` di `MaterialApp`. Digunakan untuk menavigasi dari halaman Daftar ke Form Pengajuan (misal: `/form`) agar struktur kode lebih rapi pada aplikasi berskala besar.
- `pop`: Menghapus rute aktif (teratas) dari tumpukan dan kembali ke layar sebelumnya. Digunakan pada tombol "Batal" atau dipanggil otomatis setelah data berhasil disubmit di Form untuk kembali ke layar Daftar.

**Pengiriman data jenis surat ke halaman form**:
Data jenis surat dapat dikirim melalui argumen pada navigasi, contohnya: `Navigator.pushNamed(context, '/form', arguments: {'jenis': 'Surat Aktif'})`. Di Halaman Form, data tersebut ditangkap menggunakan `ModalRoute.of(context)!.settings.arguments`.

**Feedback setelah form dikirim**:
Setelah blok `formKey.currentState!.validate()` terpenuhi dan operasi penyimpanan dipanggil, aplikasi mengeksekusi `ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Berhasil!')))` untuk memunculkan notifikasi *pop-up* kecil (SnackBar) dari bawah layar.

## Soal 7 — Model Data dan State
- **Mengapa setiap field bersifat final**: Karena dalam kerangka Flutter, model data sering digunakan di dalam widget yang tidak dapat diubah (immutable). Mendeklarasikannya sebagai `final` mencegah mutasi data yang tidak terkontrol; jika data perlu diubah, kita membuat objek (instance) baru, yang menjamin prediktabilitas pembaruan UI.
- **Mengapa id wajib ada**: `id` dibutuhkan sebagai identitas unik tak tergantikan. Tanpa `id`, sistem akan kesulitan jika harus mengubah (*update*) atau menghapus (*delete*) data yang memiliki isi "jenis" dan "tanggal" yang kembar/identik.

- **Perbedaan StatelessWidget dan StatefulWidget**: `StatelessWidget` adalah tampilan statis yang tidak akan berubah (tidak menyimpan *state* dinamis) setelah di-render pertama kali. `StatefulWidget` memiliki objek *State* internal yang bisa berubah selama aplikasi berjalan dan bisa merender ulang tampilannya saat datanya berubah.
- **Halaman daftar menggunakan**: `StatefulWidget`.
- **Alasan**: Karena halaman daftar perlu memperbarui UI-nya (me-render ulang `ListView`) setiap kali pengguna melakukan aksi tambah pengajuan atau menghapus data pengajuan.

- **Fungsi setState**: Memberi tahu mesin Flutter bahwa ada variabel di dalam objek *State* yang nilainya berubah, sehingga metode `build()` harus dijalankan ulang untuk mencerminkan nilai data terbaru ke layar UI.
- **Apa yang terjadi bila data ditambah tanpa setState**: Objek di dalam kode (memori) berhasil ditambah (*List* bertambah panjang), tetapi antarmuka visual/tampilan (UI) aplikasi tidak akan berubah/bertambah sama sekali karena fungsi *build* tidak terpicu.

## Soal 8 — CRUD Lokal
| Operasi | Method List / Mekanisme |
|:--------|:------------------------|
| Create | Menggunakan method `List.add()` atau `List.insert()` di dalam blok `setState` untuk memasukkan objek pengajuan baru ke memori. |
| Read | Melakukan perulangan baca menggunakan `ListView.builder` yang mengambil nilai panjang via properti `List.length` dan mengakses data via indeks, misal `List[index]`. |
| Update | Mencari elemen target (via perulangan atau `indexWhere`) lalu menimpa properti objek lama atau menimpa isi di indeks tersebut dengan instance objek yang diperbarui. |
| Delete | Menggunakan method `List.remove(objek)`, `List.removeAt(index)`, atau `List.removeWhere((item) => item.id == id)`. |

**Mengapa id digunakan sebagai kunci update dan delete**: 
`id` selalu melekat pada satu objek spesifik di mana pun posisinya di dalam *List*, sedangkan `index` hanya menunjukkan "urutan posisi" saat ini.
**Konsekuensi bila index digunakan sebagai kunci**:
Jika ada operasi seperti pengurutan (Sorting) data dari terbaru ke terlama, atau pengguna menghapus baris 0, maka baris 1 akan bergeser menjadi baris 0. Jika program menggunakan *index*, aplikasi bisa saja menghapus atau mengubah data yang salah (salah target) karena posisinya sudah tergeser.

## Soal 9 — Persistensi Data Lokal
- **Perbedaan in-memory dan persistensi**: Penyimpanan *in-memory* (variabel List pada State) disimpan sementara di RAM; data akan hangus (hilang permanen) jika aplikasi ditutup (*force close*). Persistensi (contoh `shared_preferences`) menulis data tersebut secara fisik ke penyimpanan perangkat internal pengguna (Disk/Storage), sehingga data tetap utuh ketika aplikasi dibuka kembali.

- **Mengapa operasi shared_preferences asinkron (Future)**: Operasi baca-tulis file (*I/O disk*) memerlukan waktu pemrosesan yang lebih lama ketimbang memori. Mekanisme *asinkron/Future* mencegah aplikasi mengalami "macet" (UI Freeze) karena mesin aplikasi bisa mengeksekusi animasi grafis UI lain sambil menunggu proses simpan data selesai di latar belakang.
- **Apa yang terjadi bila await diabaikan**: Proses baca/tulis data belum selesai di latar belakang, namun eksekusi kode di baris bawahnya (misalnya kode untuk memuat/merender halaman) sudah berjalan. Ini bisa menyebabkan aplikasi merender data *null*/kosong (karena datanya belum siap) atau menyebabkan konflik penyimpanan (*race condition*).

- **Contoh situasi in-memory sudah cukup**: Untuk filter pencarian di Halaman Katalog (teks kata kunci "Surat A"). Teks ini tidak perlu diingat aplikasinya esok hari.
- **Contoh situasi persistensi mutlak diperlukan**: Menyimpan Token Autentikasi Login atau Tema Aplikasi (Dark Mode/Light Mode), agar mahasiswa tidak perlu *login* atau mengatur ulang tema setiap kali membuka aplikasi.

## Soal 10 — Integrasi Konsep Lintas Pertemuan
1. **Arsitektur**: Aplikasi Mobile Flutter bertindak sebagai klien antar-muka (*Frontend*). Aplikasi mengelola *State* memori sementara (List `Buku` via Provider/StatefulWidget) untuk responsivitas UI. Saat ada aksi peminjaman, data dikirim ke Backend REST API dari Sistem Informasi (via HTTP POST), di mana API bertugas menyimpan riwayat transaksi secara permanen ke Database institusi. *Shared Preferences* (penyimpanan lokal) digunakan di sisi klien mobile untuk menyimpan *token login* mahasiswa.

2. **Kebutuhan & Alur**:
   - **Kebutuhan Must Have**: (1) Mahasiswa dapat melihat daftar katalog buku. (2) Mahasiswa dapat melakukan pengajuan peminjaman (reservasi) buku.
   - **Alur**: Mahasiswa membuka aplikasi -> Masuk *initialRoute* Halaman Katalog (Read) -> Mengetik di kolom pencarian -> Memilih/klik "Buku Data Science" -> Sistem mengarahkan (`pushNamed`) ke Halaman Detail Buku -> Mahasiswa menekan FAB "Pinjam" -> Muncul dialog/Halaman Form -> Mahasiswa mengisi NPM -> Sistem memvalidasi -> Submit form -> Sistem `setState` menambahkan objek `Buku` ke dalam daftar pinjaman *State* -> Muncul SnackBar sukses -> Halaman kembali (`pop`) ke Katalog.

3. **Struktur Komponen**:
   - **Halaman Katalog (Utama)**: `Scaffold`, `AppBar`, `ListView.builder` (dengan `ListTile` dan `Card` yang berinteraksi via properti `onTap`), `FloatingActionButton`.
   - **Halaman Form Peminjaman**: `Scaffold`, `Form` (terikat `GlobalKey`), `TextFormField` (dengan fungsi `validator`), `FilledButton`.
   - **Navigasi**: Dikelola secara hierarkis menggunakan Map *routes* pada `MaterialApp` dengan rute `/` dan `/formPeminjaman`.

4. **Data & State**:
   - **Definisi Model**: 
     ```dart
     class Buku {
       final String id;
       final String judul;
       final String pengarang;
       final String status; 
     }
     ```
   - **Manajemen State**: Daftar dipertahankan pada `List<Buku> riwayatPeminjaman = []` di sebuah *StatefulWidget* tunggal atau pengelola State global. Aksi **Create** (meminjam) dilakukan dengan merangkai parameter form ke objek `Buku` baru, lalu dipanggil `riwayatPeminjaman.add(bukuBaru)` yang dibungkus `setState(() {})` untuk memperbarui UI. Aksi **Read** dicapai dengan melewatkan (*passing*) senarai `riwayatPeminjaman` ini ke dalam parameter pembangun `itemCount` pada `ListView.builder` yang akan merender kartu riwayat.