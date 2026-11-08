# Catatan Keputusan Data

| Aspek | Keputusan | Alasan (Merujuk pada Kebutuhan) |
| :--- | :--- | :--- |
| **Model Field** | Hanya menggunakan 3 field utama (`id`, `judulBuku`, `namaPeminjam`). | Untuk MVP, data ini adalah yang paling esensial bagi Pustakawan (Persona 2) untuk mencatat sirkulasi tanpa memperumit form input (F-03). |
| **Operasi CRUD** | Form *Create* dan *Update* disatukan dalam satu *Dialog*, sedangkan *Delete* dipisah dengan dialog konfirmasi. | Mempercepat alur interaksi pengguna (NF-01 Kinerja) karena tidak perlu berpindah halaman, serta mencegah penghapusan data secara tidak sengaja. |
| **Kunci Data (ID)** | Menggunakan `DateTime.now().toString()`. | Merupakan cara paling sederhana dan aman pada lingkungan data statis (lokal) untuk memastikan setiap baris memiliki kunci identifikasi yang mutlak unik. |
| **Keputusan Persistensi** | Menggunakan variabel `List` pada *State* yang akan hilang jika aplikasi di- *restart*. | Sesuai dengan batasan "MVP Data Lokal". Persistensi permanen (seperti SQLite/API) belum diperlukan di fase MVP awal karena fokus saat ini adalah validasi logika interaksi CRUD di antarmuka. |