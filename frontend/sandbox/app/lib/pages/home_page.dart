import 'package:flutter/material.dart'; // Mengimpor paket material dari Flutter untuk menggunakan widget material.

import '../components/navbar.dart'; // Mengimpor komponen Navbar dari direktori components.
import 'item_list.dart'; // Ensure this import is present
import 'patient_list.dart'; // Ensure this import is present

class HomePage extends StatelessWidget { // Mendefinisikan kelas HomePage yang merupakan StatelessWidget.
  const HomePage({super.key}); // Konstruktor untuk HomePage, menggunakan super.key untuk mendukung key.

  @override
  Widget build(BuildContext context) { // Metode build yang membangun UI dari HomePage.
    // Builds the main UI of the HomePage
    return Scaffold( // Menggunakan Scaffold untuk struktur dasar halaman.
      appBar: AppBar( // Membuat AppBar di bagian atas halaman.
        title: const Text('Hospital Dashboard'), // Judul dari AppBar.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary, // Warna latar belakang AppBar diambil dari tema.
      ),
      body: SingleChildScrollView( // Menggunakan SingleChildScrollView untuk memungkinkan scroll pada konten.
        padding: const EdgeInsets.all(16.0), // Menambahkan padding di sekitar konten.
        child: Column( // Menggunakan Column untuk menyusun widget secara vertikal.
          crossAxisAlignment: CrossAxisAlignment.start, // Mengatur alignment widget di dalam Column.
          children: [
            const Text( // Menampilkan teks 'Overview'.
              'Overview',
              style: TextStyle( // Mengatur gaya teks.
                fontSize: 24, // Ukuran font.
                fontWeight: FontWeight.bold, // Menebalkan font.
              ),
            ),
            const SizedBox(height: 16), // Menambahkan jarak vertikal.
            // Statistics Cards
            Row( // Menggunakan Row untuk menyusun widget secara horizontal.
              children: [
                Expanded( // Menggunakan Expanded agar widget mengambil ruang yang tersedia.
                  child: _buildStatCard( // Memanggil metode untuk membangun kartu statistik.
                    context,
                    'Total Patients', // Judul kartu.
                    '127', // Nilai kartu.
                    Icons.personal_injury, // Ikon untuk kartu.
                    Colors.blue, // Warna untuk kartu.
                  ),
                ),
                const SizedBox(width: 16), // Menambahkan jarak horizontal.
                Expanded( // Menggunakan Expanded untuk kartu kedua.
                  child: _buildStatCard( // Memanggil metode untuk membangun kartu statistik.
                    context,
                    'Active Staff', // Judul kartu.
                    '48', // Nilai kartu.
                    Icons.people, // Ikon untuk kartu.
                    Colors.green, // Warna untuk kartu.
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16), // Menambahkan jarak vertikal.
            Row( // Baris kedua untuk kartu statistik.
              children: [
                Expanded( // Kartu ketiga.
                  child: _buildStatCard( // Memanggil metode untuk membangun kartu statistik.
                    context,
                    'Inventory Items', // Judul kartu.
                    '534', // Nilai kartu.
                    Icons.inventory, // Ikon untuk kartu.
                    Colors.orange, // Warna untuk kartu.
                  ),
                ),
                const SizedBox(width: 16), // Menambahkan jarak horizontal.
                Expanded( // Kartu keempat.
                  child: _buildStatCard( // Memanggil metode untuk membangun kartu statistik.
                    context,
                    'Departments', // Judul kartu.
                    '12', // Nilai kartu.
                    Icons.business, // Ikon untuk kartu.
                    Colors.purple, // Warna untuk kartu.
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32), // Menambahkan jarak vertikal.
            const Text( // Menampilkan teks 'Quick Actions'.
              'Quick Actions',
              style: TextStyle( // Mengatur gaya teks.
                fontSize: 24, // Ukuran font.
                fontWeight: FontWeight.bold, // Menebalkan font.
              ),
            ),
            const SizedBox(height: 16), // Menambahkan jarak vertikal.
            // Navigation Grid
            GridView.count( // Menggunakan GridView untuk menampilkan grid navigasi.
              shrinkWrap: true, // Mengatur agar GridView tidak mengambil ruang lebih dari yang diperlukan.
              physics: const NeverScrollableScrollPhysics(), // Menonaktifkan scroll pada GridView.
              crossAxisCount: 2, // Mengatur jumlah kolom dalam grid.
              mainAxisSpacing: 16, // Jarak vertikal antar item grid.
              crossAxisSpacing: 16, // Jarak horizontal antar item grid.
              childAspectRatio: 1.5, // Rasio aspek untuk item grid.
              children: [
                _buildNavCard( // Memanggil metode untuk membangun kartu navigasi.
                  context,
                  'Users', // Judul kartu.
                  Icons.people, // Ikon untuk kartu.
                  Colors.blue, // Warna untuk kartu.
                  () => Navigator.pushNamed(context, '/users'), // Aksi saat kartu ditekan.
                ),
                _buildNavCard( // Kartu kedua.
                  context,
                  'Patients', // Judul kartu.
                  Icons.personal_injury, // Ikon untuk kartu.
                  Colors.red, // Warna untuk kartu.
                  () => Navigator.pushNamed(context, '/patients'), // Aksi saat kartu ditekan.
                ),
                _buildNavCard( // Kartu ketiga.
                  context,
                  'Items', // Judul kartu.
                  Icons.inventory, // Ikon untuk kartu.
                  Colors.orange, // Warna untuk kartu.
                  () => Navigator.pushNamed(context, '/items'), // Aksi saat kartu ditekan.
                ),
                _buildNavCard( // Kartu keempat.
                  context,
                  'Reports', // Judul kartu.
                  Icons.bar_chart, // Ikon untuk kartu.
                  Colors.purple, // Warna untuk kartu.
                  () => Navigator.pushNamed(context, '/'), // Aksi saat kartu ditekan.
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Navbar(), // Menambahkan Navbar di bagian bawah halaman.
    );
  }

  // Builds a statistics card with title, value, icon, and color
  Widget _buildStatCard(BuildContext context, String title, String value, IconData icon, Color color) {
    return Card( // Menggunakan Card untuk membungkus konten kartu.
      elevation: 4, // Menambahkan efek bayangan pada kartu.
      child: Padding( // Menambahkan padding di dalam kartu.
        padding: const EdgeInsets.all(16.0), // Padding di semua sisi.
        child: Column( // Menggunakan Column untuk menyusun konten kartu secara vertikal.
          crossAxisAlignment: CrossAxisAlignment.start, // Mengatur alignment konten di dalam Column.
          children: [
            Icon(icon, color: color, size: 32), // Menampilkan ikon dengan warna dan ukuran yang ditentukan.
            const SizedBox(height: 8), // Menambahkan jarak vertikal.
            Text( // Menampilkan nilai kartu.
              value,
              style: const TextStyle( // Mengatur gaya teks.
                fontSize: 24, // Ukuran font.
                fontWeight: FontWeight.bold, // Menebalkan font.
              ),
            ),
            Text( // Menampilkan judul kartu.
              title,
              style: TextStyle( // Mengatur gaya teks.
                color: Colors.grey[600], // Warna teks.
                fontSize: 16, // Ukuran font.
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Builds a navigation card for quick actions
  Widget _buildNavCard(BuildContext context, String title, IconData icon, Color color, VoidCallback onTap) {
    return Card( // Menggunakan Card untuk membungkus konten kartu navigasi.
      elevation: 4, // Menambahkan efek bayangan pada kartu.
      child: InkWell( // Menggunakan InkWell untuk mendeteksi sentuhan pada kartu.
        onTap: onTap, // Menetapkan aksi saat kartu ditekan.
        child: Padding( // Menambahkan padding di dalam kartu.
          padding: const EdgeInsets.all(16.0), // Padding di semua sisi.
          child: Column( // Menggunakan Column untuk menyusun konten kartu secara vertikal.
            mainAxisAlignment: MainAxisAlignment.center, // Mengatur alignment konten di tengah.
            children: [
              Icon(icon, color: color, size: 32), // Menampilkan ikon dengan warna dan ukuran yang ditentukan.
              const SizedBox(height: 8), // Menambahkan jarak vertikal.
              Text( // Menampilkan judul kartu navigasi.
                title,
                style: const TextStyle( // Mengatur gaya teks.
                  fontSize: 18, // Ukuran font.
                  fontWeight: FontWeight.bold, // Menebalkan font.
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Creates a route with a book-like page transition
  Route _createRoute(String routeName) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        switch (routeName) {
          case '/patients':
            return const PatientListPage(); // Replace with your actual PatientList widget
          case '/items':
            return const ItemListPage(); // Replace with your actual ItemList widget
          case '/reports':
            return const HomePage(); // Replace with your actual ReportsPage widget
          default:
            return const HomePage(); // Fallback to HomePage
        }
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Start from the right
        const end = Offset.zero; // End at the center
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}