import 'package:flutter/material.dart'; // Mengimpor paket material dari Flutter

class LoginPage extends StatefulWidget { // Change to StatefulWidget
  const LoginPage({super.key}); // Constructor for LoginPage

  @override
  LoginPageState createState() => LoginPageState(); // Create state
}

class LoginPageState extends State<LoginPage> { // Create state class
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) { // Metode untuk membangun UI
    return Scaffold( // Menggunakan Scaffold untuk struktur halaman
      // appBar: AppBar(title: const Text('Login')), // Menambahkan AppBar
      backgroundColor: Colors.lightBlue[50], 
      body: Center( // Mengatur konten di tengah
        child: Padding( // Menambahkan padding
          padding: const EdgeInsets.all(16.0),
          child: Column( // Menggunakan Column untuk tata letak vertikal
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Hospital Facility',
                style: TextStyle(
                  fontSize: 40, // Ukuran font yang lebih besar
                  fontWeight: FontWeight.bold, // Ketebalan font
                  color: Colors.blue, // Warna font
                  shadows: <Shadow>[ // Menambahkan efek bayangan
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 3.0,
                      color: Colors.grey,
                    ),
                  ],
                  fontFamily: 'Roboto', // Menggunakan font Roboto (pastikan font ini tersedia)
                ),
              ),
              const SizedBox(height: 20), // Jarak antara judul dan input
              TextField(
                style: const TextStyle(backgroundColor: Colors.white),
                controller: _usernameController, // Set the controller
                decoration: const InputDecoration(
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person), // Menambahkan ikon
                  border: OutlineInputBorder(), // Mengubah border
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 16), // Jarak antara input
              TextField(
                style: const TextStyle(backgroundColor: Colors.white),
                controller: _passwordController, // Set the controller
                decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock), // Menambahkan ikon
                  border: OutlineInputBorder(), // Mengubah border
                  filled: true,
                  fillColor: Colors.white,
                ),
                obscureText: true, // Menyembunyikan teks password
              ),
              const SizedBox(height: 20), // Jarak antara input dan tombol
              ElevatedButton( // Tombol untuk login
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0), // Mengubah padding tombol
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)), // Membuat tombol melengkung
                  backgroundColor: Colors.white, // Change button color
                ),
                onPressed: () {
                  // Validate input fields
                  if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
                    // Show an error message if fields are empty
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Username and Password are required')),
                    );
                  } else {
                    // Navigate to the main page after login
                    Navigator.pushReplacementNamed(context, '/');
                  }
                },
                child: const Text('Login', style: TextStyle(fontSize: 18)), // Mengubah ukuran teks tombol
              ),
            ],
          ),
        ),
      ),
    );
  }
} 