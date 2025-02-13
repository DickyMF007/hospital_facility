import 'package:flutter/material.dart'; // Mengimpor paket material dari Flutter

import 'pages/home_page.dart'; // Mengimpor halaman utama
import 'pages/item_list.dart'; // Mengimpor halaman daftar item
import 'pages/patient_list.dart' as patient; // Mengimpor halaman daftar pasien dengan alias 'patient'
import 'pages/user_list.dart'; // Mengimpor halaman daftar pengguna

void main() {
  runApp(const MyApp()); // Menjalankan aplikasi dengan widget MyApp
}

class MyApp extends StatelessWidget { // Mendefinisikan kelas MyApp sebagai StatelessWidget
  const MyApp({super.key}); // Konstruktor untuk MyApp

  @override
  Widget build(BuildContext context) { // Metode untuk membangun UI
    return MaterialApp( // Mengembalikan widget MaterialApp
      title: 'Hospital Management', // Judul aplikasi
      theme: ThemeData( // Mengatur tema aplikasi
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue), // Mengatur skema warna dari seed
        useMaterial3: true, // Menggunakan Material Design 3
      ),
      initialRoute: '/', // Menentukan rute awal aplikasi
      routes: { // Mendefinisikan rute aplikasi
        '/': (context) => const HomePage(), // Rute untuk halaman utama
        '/users': (context) => const UserListPage(), // Rute untuk halaman daftar pengguna
        '/patients': (context) => const patient.PatientListPage(), // Rute untuk halaman daftar pasien
        '/items': (context) => const ItemListPage(), // Rute untuk halaman daftar item
      },
    );
  }
}
