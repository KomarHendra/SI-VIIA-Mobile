import 'package:flutter/material.dart';

void main() {
  runApp(const AplikasiMVP());
}

// 1. MODEL DATA
class Reservasi {
  String id;
  String judulBuku;
  String namaPeminjam;

  Reservasi({
    required this.id,
    required this.judulBuku,
    required this.namaPeminjam,
  });

  @override
  String toString() {
    return 'Reservasi(id: $id, judulBuku: $judulBuku, namaPeminjam: $namaPeminjam)';
  }
}

class AplikasiMVP extends StatelessWidget {
  const AplikasiMVP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DigiLib CRUD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal)),
      home: const HalamanCRUD(),
    );
  }
}

// 2. STATEFUL WIDGET UNTUK DAFTAR & CRUD
class HalamanCRUD extends StatefulWidget {
  const HalamanCRUD({super.key});

  @override
  State<HalamanCRUD> createState() => _HalamanCRUDState();
}

class _HalamanCRUDState extends State<HalamanCRUD> {
  // State: List untuk menyimpan data lokal
  List<Reservasi> daftarReservasi = [];

  // Controller form
  final _judulController = TextEditingController();
  final _namaController = TextEditingController();

  @override
  void dispose() {
    _judulController.dispose();
    _namaController.dispose();
    super.dispose();
  }

  // Fungsi TAMPILKAN FORM (Untuk Tambah & Ubah)
  void _tampilkanFormDialog({Reservasi? dataLama}) {
    // Jika dataLama ada, berarti mode Ubah (Update). Jika tidak, mode Tambah (Create).
    if (dataLama != null) {
      _judulController.text = dataLama.judulBuku;
      _namaController.text = dataLama.namaPeminjam;
    } else {
      _judulController.clear();
      _namaController.clear();
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(dataLama == null ? 'Tambah Reservasi' : 'Ubah Reservasi'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _judulController,
                decoration: const InputDecoration(labelText: 'Judul Buku'),
              ),
              TextField(
                controller: _namaController,
                decoration: const InputDecoration(labelText: 'Nama Peminjam'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal'),
            ),
            FilledButton(
              onPressed: () {
                // Aksi CREATE & UPDATE dibungkus setState
                setState(() {
                  if (dataLama == null) {
                    // CREATE: Tambah objek baru ke dalam List
                    daftarReservasi.add(
                      Reservasi(
                        id: DateTime.now().toString(),
                        judulBuku: _judulController.text,
                        namaPeminjam: _namaController.text,
                      ),
                    );
                  } else {
                    // UPDATE: Ganti data pada objek yang sudah ada
                    dataLama.judulBuku = _judulController.text;
                    dataLama.namaPeminjam = _namaController.text;
                  }
                });
                Navigator.pop(context);
              },
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  // Fungsi HAPUS DATA dengan Konfirmasi
  void _konfirmasiHapus(Reservasi data) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Konfirmasi Hapus'),
          content: Text('Yakin ingin menghapus reservasi buku "${data.judulBuku}"?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal'),
            ),
            FilledButton(
              style: FilledButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                // Aksi DELETE dibungkus setState
                setState(() {
                  daftarReservasi.remove(data);
                });
                Navigator.pop(context);
              },
              child: const Text('Hapus'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manajemen Reservasi Lokal'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // READ: Menampilkan data dengan ListView.builder
      body: daftarReservasi.isEmpty
          ? const Center(child: Text('Belum ada data reservasi.'))
          : ListView.builder(
              itemCount: daftarReservasi.length,
              itemBuilder: (context, index) {
                final reservasi = daftarReservasi[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.book)),
                    title: Text(reservasi.judulBuku, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('Peminjam: ${reservasi.namaPeminjam}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Tombol UPDATE
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => _tampilkanFormDialog(dataLama: reservasi),
                        ),
                        // Tombol DELETE
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _konfirmasiHapus(reservasi),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      // Tombol CREATE
      floatingActionButton: FloatingActionButton(
        onPressed: () => _tampilkanFormDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }
}