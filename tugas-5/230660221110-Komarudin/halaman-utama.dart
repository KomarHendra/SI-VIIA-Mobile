import 'package:flutter/material.dart';

void main() {
  runApp(const AplikasiPerpustakaan());
}

class AplikasiPerpustakaan extends StatelessWidget {
  const AplikasiPerpustakaan({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DigiLib UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Menggunakan ColorScheme.fromSeed dan Material 3 sesuai instruksi
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const HalamanUtama(),
    );
  }
}

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  // Data statis. 
  // TIPS: Hapus semua isi di dalam kurung siku [] untuk melihat "Keadaan Kosong" (Empty State).
  final List> daftarPinjaman = [
    {"judul": "Pemrograman Flutter Dasar", "tenggat": "12 Nov 2026", "status": "Aktif"},
    {"judul": "Data Science dengan Python", "tenggat": "05 Nov 2026", "status": "Terlambat"},
    {"judul": "Sistem Informasi Manajemen", "tenggat": "15 Nov 2026", "status": "Aktif"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pinjaman Saya'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // Kondisi if-else (ternary) untuk menampilkan keadaan kosong atau daftar data
      body: daftarPinjaman.isEmpty 
          ? _buildEmptyState() 
          : _buildListPinjaman(),
          
      // Aksi Utama
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.search),
        label: const Text('Cari Buku Baru'),
      ),
    );
  }

  // Widget untuk Keadaan Kosong (Empty State)
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.library_books, size: 80, color: Colors.grey.shade400),
          const SizedBox(height: 16),
          Text(
            'Belum ada buku yang dipinjam.',
            style: TextStyle(fontSize: 18, color: Colors.grey.shade600, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text('Silakan cari dan reservasi buku terlebih dahulu.'),
        ],
      ),
    );
  }

  // Widget untuk Daftar Pinjaman (ListTile di dalam Card)
  Widget _buildListPinjaman() {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: daftarPinjaman.length,
      itemBuilder: (context, index) {
        final pinjaman = daftarPinjaman[index];
        final bool isTerlambat = pinjaman['status'] == 'Terlambat';

        return Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              child: const Icon(Icons.book),
            ),
            title: Text(
              pinjaman['judul']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Tenggat: ${pinjaman['tenggat']}"),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                // Warna background status menggunakan Ternary
                color: isTerlambat ? Colors.red.shade100 : Colors.green.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                pinjaman['status']!,
                style: TextStyle(
                  // Warna teks status menggunakan Ternary
                  color: isTerlambat ? Colors.red.shade900 : Colors.green.shade900,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}