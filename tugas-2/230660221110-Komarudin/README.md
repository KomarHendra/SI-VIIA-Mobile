# Tugas 2 — Modul Hitung Nilai

Repositori ini berisi pengerjaan Tugas 2 Pemrograman Aplikasi Bergerak (PAB) untuk Modul Hitung Nilai menggunakan bahasa pemrograman Dart. Domain Sistem Informasi yang digunakan adalah **Sistem Informasi Perpustakaan**.

## 👤 Identitas Mahasiswa

* **Nama:** Komarudin Anshar Rahendra
* **NPM:** 230660221110
* **Program Studi:** Sistem Informasi
* **Fakultas:** Teknologi Informasi, Universitas Sebelas April (UNSAP)

---

## 1. Kode Sumber (`hitung_nilai.dart`)

Skema penilaian pada modul ini disesuaikan dengan domain perpustakaan, di mana studi kasus yang diangkat adalah penilaian untuk mata kuliah / program **"Literasi dan Pemanfaatan Perpustakaan"**.

```dart
void main() {
  // Nama mata kuliah disesuaikan dengan domain perpustakaan
  String mataKuliah = "Literasi dan Pemanfaatan Perpustakaan";

  // Deklarasi List<Map<String, Object>> berisi 5 komponen penilaian
  List<Map<String, Object>> komponenPenilaian = [
    {"nama": "Kehadiran Orientasi", "nilai": 95.0},
    {"nama": "Tugas 1 (Pencarian Katalog)", "nilai": 88.0},
    {"nama": "Tugas 2 (Review Jurnal Digital)", "nilai": 85.0},
    {"nama": "UTS (Praktik Peminjaman)", "nilai": 78.0},
    {"nama": "UAS (Proyek Literasi Informasi)", "nilai": 90.0},
  ];

  // Menampilkan Header
  print("=== HASIL PENILAIAN MAHASISWA ===");
  print("Mata Kuliah : $mataKuliah\n");
  print("Daftar Komponen Penilaian:");

  // Menampilkan daftar komponen menggunakan perulangan
  for (var komponen in komponenPenilaian) {
    print("- ${komponen['nama']} : ${komponen['nilai']}");
  }

  // Memanggil fungsi
  double rataRata = hitungRataRata(komponenPenilaian);
  String hasilPredikat = predikat(rataRata);

  // Menampilkan hasil akhir
  print("\nNilai Rata-rata : ${rataRata.toStringAsFixed(2)}");
  print("Predikat Akhir  : $hasilPredikat");
}

// Fungsi untuk menghitung rata-rata dari List<Map>
double hitungRataRata(List<Map<String, Object>> komponen) {
  double totalNilai = 0;
  for (var item in komponen) {
    // Menggunakan (as num).toDouble() agar aman jika nilai berupa integer
    totalNilai += (item["nilai"] as num).toDouble();
  }
  return totalNilai / komponen.length;
}

// Fungsi untuk menentukan predikat berdasarkan rentang nilai
// Aturan Predikat:
// 85.0 - 100.0 : A (Sangat Baik)
// 70.0 - 84.99 : B (Baik)
// 55.0 - 69.99 : C (Cukup)
// 40.0 - 54.99 : D (Kurang)
// 0.0  - 39.99 : E (Gagal)
String predikat(double nilai) {
  if (nilai >= 85.0) {
    return "A (Sangat Baik)";
  } else if (nilai >= 70.0) {
    return "B (Baik)";
  } else if (nilai >= 55.0) {
    return "C (Cukup)";
  } else if (nilai >= 40.0) {
    return "D (Kurang)";
  } else {
    return "E (Gagal)";
  }
}
```

---

## 2. Hasil Keluaran (Output)

Eksekusi program dilakukan melalui terminal dengan perintah `dart run hitung_nilai.dart`. Berikut adalah hasil keluaran (output) saat program dijalankan:

```text
=== HASIL PENILAIAN MAHASISWA ===
Mata Kuliah : Literasi dan Pemanfaatan Perpustakaan

Daftar Komponen Penilaian:
- Kehadiran Orientasi : 95.0
- Tugas 1 (Pencarian Katalog) : 88.0
- Tugas 2 (Review Jurnal Digital) : 85.0
- UTS (Praktik Peminjaman) : 78.0
- UAS (Proyek Literasi Informasi) : 90.0

Nilai Rata-rata : 87.20
Predikat Akhir  : A (Sangat Baik)
```

---

## 3. Refleksi

Sintaks yang paling sering saya salahgunakan di Dart adalah penempatan tanda titik koma (`;`) di akhir pernyataan dan kebingungan antara penggunaan kurung siku `[]` untuk *List* dengan kurung kurawal `{}` untuk *Map*. Hal ini terjadi karena kebiasaan dari bahasa pemrograman lain yang terkadang tidak mewajibkan titik koma atau memiliki aturan deklarasi *array* yang sedikit berbeda. Selain itu, saya terkadang keliru saat melakukan *type casting* (seperti `as double`) ketika mengambil nilai dari *dynamic typing* seperti `Object`, karena Dart sangat ketat (*type-safe*) terhadap keamanan tipe data.