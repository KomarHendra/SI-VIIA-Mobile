import 'package:flutter/material.dart';

void main() {
  runApp(const AplikasiPerpustakaan());
}

class AplikasiPerpustakaan extends StatelessWidget {
  const AplikasiPerpustakaan({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DigiLib Navigasi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      // Mendaftarkan Route
      initialRoute: '/',
      routes: {
        '/': (context) => const HalamanKatalog(),
        '/detail': (context) => const HalamanDetail(),
        '/reservasi': (context) => const HalamanFormReservasi(),
      },
    );
  }
}

// ==========================================
// 1. HALAMAN KATALOG (RUTE '/')
// ==========================================
class HalamanKatalog extends StatelessWidget {
  const HalamanKatalog({super.key});

  final daftarBuku = const [
    {"judul": "Pemrograman Flutter Dasar", "penulis": "Komarudin"},
    {"judul": "Data Science dengan Python", "penulis": "A. Rahendra"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Buku'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: daftarBuku.length,
        itemBuilder: (context, index) {
          final buku = daftarBuku[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(Icons.book),
              title: Text(buku['judul']!),
              subtitle: Text(buku['penulis']!),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigasi Maju dan Kirim Data
                Navigator.pushNamed(
                  context,
                  '/detail',
                  arguments: buku,
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// ==========================================
// 2. HALAMAN DETAIL (RUTE '/detail')
// ==========================================
class HalamanDetail extends StatelessWidget {
  const HalamanDetail({super.key});

  @override
  Widget build(BuildContext context) {
    // Menerima data dan pemeriksaan cabang null/tipe
    final args = ModalRoute.of(context)?.settings.arguments;
    
    if (args == null || args is! Map) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Data buku tidak ditemukan!')),
      );
    }

    final String judul = args['judul'] ?? 'Tidak ada judul';
    final String penulis = args['penulis'] ?? 'Tidak ada penulis';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Buku'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.menu_book, size: 100, color: Colors.teal),
            const SizedBox(height: 16),
            Text(judul, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text("Penulis: $penulis", style: const TextStyle(fontSize: 16)),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  // Lanjut ke Form Reservasi
                  Navigator.pushNamed(context, '/reservasi', arguments: args);
                },
                child: const Text('Ajukan Reservasi'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 3. HALAMAN FORM (RUTE '/reservasi')
// ==========================================
class HalamanFormReservasi extends StatefulWidget {
  const HalamanFormReservasi({super.key});

  @override
  State<HalamanFormReservasi> createState() => _HalamanFormReservasiState();
}

class _HalamanFormReservasiState extends State<HalamanFormReservasi> {
  // GlobalKey untuk validasi form
  final _formKey = GlobalKey<FormState>();
  
  // Controller untuk input
  final _namaController = TextEditingController();
  final _npmController = TextEditingController();

  // Membersihkan controller pada dispose
  @override
  void dispose() {
    _namaController.dispose();
    _npmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    final judulBuku = args?['judul'] ?? 'Buku';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Reservasi'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text('Meminjam: $judulBuku', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 16),
              
              // Field Nama
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(labelText: 'Nama Lengkap', border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Nama tidak boleh kosong';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              
              // Field NPM
              TextFormField(
                controller: _npmController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'NPM', border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'NPM tidak boleh kosong';
                  if (value.length < 10) return 'NPM minimal 10 digit';
                  return null;
                },
              ),
              const SizedBox(height: 24),
              
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    // Validasi Form
                    if (_formKey.currentState!.validate()) {
                      // Feedback SnackBar
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Reservasi $judulBuku berhasil!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                      // Navigasi Kembali (pop)
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Kirim Reservasi'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}