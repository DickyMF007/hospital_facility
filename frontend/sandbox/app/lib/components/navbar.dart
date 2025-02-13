import 'package:flutter/material.dart'; // Mengimpor paket material dari Flutter

class Navbar extends StatelessWidget { // Mendefinisikan kelas Navbar yang merupakan StatelessWidget
  const Navbar({super.key}); // Konstruktor untuk Navbar

  @override
  Widget build(BuildContext context) { // Metode build untuk membangun widget
    // Mendapatkan nama rute saat ini untuk menyoroti tab yang aktif
    final String currentRoute = ModalRoute.of(context)?.settings.name ?? '/'; // Mengambil nama rute saat ini, jika tidak ada, gunakan '/'

    return BottomNavigationBar( // Mengembalikan widget BottomNavigationBar
      currentIndex: _getSelectedIndex(currentRoute), // Menentukan indeks yang dipilih berdasarkan rute saat ini
      type: BottomNavigationBarType.fixed, // Menetapkan tipe BottomNavigationBar
      onTap: (index) { // Menangani aksi tap pada item navigasi
        switch (index) { // Menggunakan switch untuk menentukan tindakan berdasarkan indeks yang dipilih
          case 0: // Kasus untuk indeks 0
            if (currentRoute != '/') { // Memeriksa apakah rute saat ini bukan '/'
              Navigator.pushNamed(context, '/'); // Navigasi ke rute '/'
            }
            break; // Keluar dari switch
          case 1: // Kasus untuk indeks 1
            if (currentRoute != '/users') { // Memeriksa apakah rute saat ini bukan '/users'
              Navigator.pushNamed(context, '/users'); // Navigasi ke rute '/users'
            }
            break; // Keluar dari switch
          case 2: // Kasus untuk indeks 2
            if (currentRoute != '/patients') { // Memeriksa apakah rute saat ini bukan '/patients'
              Navigator.pushNamed(context, '/patients'); // Navigasi ke rute '/patients'
            }
            break; // Keluar dari switch
          case 3: // Kasus untuk indeks 3
            if (currentRoute != '/items') { // Memeriksa apakah rute saat ini bukan '/items'
              Navigator.pushNamed(context, '/items'); // Navigasi ke rute '/items'
            }
            break; // Keluar dari switch
        }
      },
      items: const [ // Daftar item untuk BottomNavigationBar
        BottomNavigationBarItem( // Item pertama
          icon: Icon(Icons.home), // Ikon untuk item pertama
          label: 'Home', // Label untuk item pertama
        ),
        BottomNavigationBarItem( // Item kedua
          icon: Icon(Icons.person), // Ikon untuk item kedua
          label: 'Users', // Label untuk item kedua
        ),
        BottomNavigationBarItem( // Item ketiga
          icon: Icon(Icons.local_hospital), // Ikon untuk item ketiga
          label: 'Patients', // Label untuk item ketiga
        ),
        BottomNavigationBarItem( // Item keempat
          icon: Icon(Icons.inventory), // Ikon untuk item keempat
          label: 'Items', // Label untuk item keempat
        ),
      ],
    );
  }

  int _getSelectedIndex(String currentRoute) { // Metode untuk mendapatkan indeks yang dipilih berdasarkan rute saat ini
    switch (currentRoute) { // Menggunakan switch untuk menentukan indeks berdasarkan rute
      case '/': // Kasus untuk rute '/'
        return 0; // Mengembalikan indeks 0
      case '/users': // Kasus untuk rute '/users'
        return 1; // Mengembalikan indeks 1
      case '/patients': // Kasus untuk rute '/patients'
        return 2; // Mengembalikan indeks 2
      case '/items': // Kasus untuk rute '/items'
        return 3; // Mengembalikan indeks 3
      default: // Kasus default jika tidak ada yang cocok
        return 0; // Mengembalikan indeks 0
    }
  }
}