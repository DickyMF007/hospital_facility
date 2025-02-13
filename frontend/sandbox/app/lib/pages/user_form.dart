import 'package:flutter/material.dart'; // Mengimpor paket material Flutter untuk UI

import '../components/navbar.dart'; // Mengimpor komponen Navbar

class UserFormPage extends StatefulWidget { // Mendefinisikan kelas UserFormPage sebagai StatefulWidget
  final Map<String, dynamic>? user; // Mendeklarasikan parameter user yang bersifat opsional
  const UserFormPage({super.key, this.user}); // Konstruktor untuk UserFormPage

  @override
  State<UserFormPage> createState() => _UserFormPageState(); // Membuat state untuk UserFormPage
}

class _UserFormPageState extends State<UserFormPage> { // Mendefinisikan state untuk UserFormPage
  final _formKey = GlobalKey<FormState>(); // Kunci untuk mengelola status formulir
  final _nameController = TextEditingController(); // Kontroler untuk field nama
  final _emailController = TextEditingController(); // Kontroler untuk field email
  final _roleController = TextEditingController(); // Kontroler untuk field peran

  @override
  void initState() { // Metode yang dipanggil saat state diinisialisasi
    super.initState(); // Memanggil metode inisialisasi dari superclass
    // Menginisialisasi field formulir dengan data pengguna jika mengedit pengguna yang ada
    if (widget.user != null) { // Memeriksa apakah ada data pengguna
      _nameController.text = widget.user!['name']; // Mengisi field nama dengan data pengguna
      _emailController.text = widget.user!['email']; // Mengisi field email dengan data pengguna
      _roleController.text = widget.user!['role']; // Mengisi field peran dengan data pengguna
    }
  }

  // Metode untuk memvalidasi dan mengirimkan data formulir
  void _submitForm() { // Mendefinisikan metode untuk mengirimkan formulir
    if (_formKey.currentState!.validate()) { // Memeriksa apakah formulir valid
      final userData = { // Membuat peta data pengguna
        'id': widget.user?['id'] ?? DateTime.now().millisecondsSinceEpoch.toString(), // Mengambil ID pengguna atau membuat ID baru
        'name': _nameController.text, // Mengambil nama dari kontroler
        'email': _emailController.text, // Mengambil email dari kontroler
        'role': _roleController.text, // Mengambil peran dari kontroler
      };

      Navigator.pop(context, userData); // Menutup halaman dan mengembalikan data pengguna
    }
  }

  @override
  Widget build(BuildContext context) { // Metode untuk membangun UI
    // Membangun UI untuk formulir pengguna
    return Scaffold( // Menggunakan Scaffold untuk struktur dasar halaman
      appBar: AppBar( // Membuat AppBar di bagian atas
        backgroundColor: Theme.of(context).colorScheme.inversePrimary, // Mengatur warna latar belakang AppBar
        title: Text(widget.user == null ? 'Add User' : 'Edit User'), // Menampilkan judul berdasarkan apakah pengguna baru atau yang diedit
      ),
      body: Padding( // Menambahkan padding di sekitar formulir
        padding: const EdgeInsets.all(16.0), // Mengatur padding
        child: Form( // Membuat widget Form
          key: _formKey, // Mengaitkan kunci formulir
          child: Column( // Menggunakan kolom untuk menyusun widget
            children: [
              TextFormField( // Membuat field input untuk nama
                controller: _nameController, // Mengaitkan kontroler
                decoration: const InputDecoration( // Mengatur dekorasi field
                  labelText: 'Name', // Label untuk field
                  border: OutlineInputBorder(), // Mengatur border field
                ),
                validator: (value) { // Validator untuk memeriksa input
                  if (value == null || value.isEmpty) { // Memeriksa apakah input kosong
                    return 'Please enter a name'; // Mengembalikan pesan kesalahan
                  }
                  return null; // Mengembalikan null jika valid
                },
              ),
              const SizedBox(height: 16), // Menambahkan jarak antara field
              TextFormField( // Membuat field input untuk email
                controller: _emailController, // Mengaitkan kontroler
                decoration: const InputDecoration( // Mengatur dekorasi field
                  labelText: 'Email', // Label untuk field
                  border: OutlineInputBorder(), // Mengatur border field
                ),
                keyboardType: TextInputType.emailAddress, // Mengatur jenis keyboard untuk email
                validator: (value) { // Validator untuk memeriksa input
                  if (value == null || value.isEmpty) { // Memeriksa apakah input kosong
                    return 'Please enter an email'; // Mengembalikan pesan kesalahan
                  }
                  if (!value.contains('@')) { // Memeriksa apakah email valid
                    return 'Please enter a valid email'; // Mengembalikan pesan kesalahan
                  }
                  return null; // Mengembalikan null jika valid
                },
              ),
              const SizedBox(height: 16), // Menambahkan jarak antara field
              TextFormField( // Membuat field input untuk peran
                controller: _roleController, // Mengaitkan kontroler
                decoration: const InputDecoration( // Mengatur dekorasi field
                  labelText: 'Role', // Label untuk field
                  border: OutlineInputBorder(), // Mengatur border field
                ),
                validator: (value) { // Validator untuk memeriksa input
                  if (value == null || value.isEmpty) { // Memeriksa apakah input kosong
                    return 'Please enter a role'; // Mengembalikan pesan kesalahan
                  }
                  return null; // Mengembalikan null jika valid
                },
              ),
              const SizedBox(height: 24), // Menambahkan jarak sebelum tombol
              ElevatedButton( // Membuat tombol untuk mengirimkan formulir
                onPressed: _submitForm, // Mengaitkan fungsi submit
                child: Text(widget.user == null ? 'Create User' : 'Update User'), // Menampilkan teks tombol berdasarkan konteks
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Navbar(), // Menambahkan Navbar di bagian bawah
    );
  }

  @override
  void dispose() { // Metode untuk membersihkan sumber daya
    // Menghapus kontroler untuk membebaskan sumber daya
    _nameController.dispose(); // Menghapus kontroler nama
    _emailController.dispose(); // Menghapus kontroler email
    _roleController.dispose(); // Menghapus kontroler peran
    super.dispose(); // Memanggil metode dispose dari superclass
  }
}