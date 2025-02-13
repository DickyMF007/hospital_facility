import 'package:flutter/material.dart'; // Mengimpor paket material dari Flutter

import 'pages/home_page.dart'; // Mengimpor halaman utama
import 'pages/item_list.dart'; // Mengimpor halaman daftar item
import 'pages/login_page.dart'; // Mengimpor halaman login
import 'pages/patient_list.dart' as patient; // Mengimpor halaman daftar pasien dengan alias 'patient'
import 'pages/profile_page.dart'; // Import the new profile page
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
      initialRoute: '/login', // Menentukan rute awal aplikasi
      routes: { // Mendefinisikan rute aplikasi
        '/login': (context) => const LoginPage(), // Rute untuk halaman login
        '/': (context) => const HomePage(), // Rute untuk halaman utama
        '/users': (context) => const UserListPage(), // Rute untuk halaman daftar pengguna
        '/patients': (context) => const patient.PatientListPage(), // Rute untuk halaman daftar pasien
        '/items': (context) => const ItemListPage(), // Rute untuk halaman daftar item
        '/profile': (context) => ProfilePage(), // Add the profile route
      },
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/profile':
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => ProfilePage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0); // Start from the right
                const end = Offset.zero; // End at the current position
                const curve = Curves.easeInOut; // Transition curve

                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
              transitionDuration: const Duration(milliseconds: 300), // Duration of the transition
            );
          // Add more cases for other routes if needed
          default:
            return null; // Return null for unknown routes
        }
      },
    );
  }
}
