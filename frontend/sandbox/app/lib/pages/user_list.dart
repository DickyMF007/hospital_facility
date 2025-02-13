import 'package:flutter/material.dart'; // Mengimpor paket material dari Flutter

import '../components/navbar.dart'; // Mengimpor komponen Navbar
import 'user_form.dart'; // Mengimpor halaman form pengguna

class UserListPage extends StatefulWidget { // Mendefinisikan kelas UserListPage sebagai StatefulWidget
  const UserListPage({super.key}); // Konstruktor untuk UserListPage

  @override
  State<UserListPage> createState() => _UserListPageState(); // Membuat state untuk UserListPage
}

class _UserListPageState extends State<UserListPage> { // Mendefinisikan state untuk UserListPage
  final List<Map<String, dynamic>> users = [ // Daftar pengguna yang akan ditampilkan
    {
      'id': '1', // ID pengguna
      'name': 'John Doe', // Nama pengguna
      'email': 'john.doe@example.com', // Email pengguna
      'role': 'Admin', // Peran pengguna
    },
    {
      'id': '2',
      'name': 'Jane Smith',
      'email': 'jane.smith@example.com',
      'role': 'Doctor',
    },
    {
      'id': '3',
      'name': 'Bob Johnson',
      'email': 'bob.johnson@example.com',
      'role': 'Nurse',
    },
  ];

  // Menghapus pengguna berdasarkan ID mereka
  void deleteUser(String id) {
    setState(() { // Memperbarui state
      users.removeWhere((user) => user['id'] == id); // Menghapus pengguna dari daftar
    });
    ScaffoldMessenger.of(context).showSnackBar( // Menampilkan snackbar untuk konfirmasi penghapusan
      const SnackBar(content: Text('User deleted successfully')), // Pesan snackbar
    );
  }

  // Memperbarui pengguna dengan data yang diberikan
  void updateUser(Map<String, dynamic> updatedUser) {
    setState(() { // Memperbarui state
      final index = users.indexWhere((user) => user['id'] == updatedUser['id']); // Mencari indeks pengguna
      if (index != -1) { // Jika pengguna ditemukan
        users[index] = updatedUser; // Memperbarui data pengguna
      }
    });
    ScaffoldMessenger.of(context).showSnackBar( // Menampilkan snackbar untuk konfirmasi pembaruan
      const SnackBar(content: Text('User updated successfully')), // Pesan snackbar
    );
  }

  @override
  Widget build(BuildContext context) { // Membangun UI untuk daftar pengguna
    return Scaffold( // Menggunakan Scaffold untuk struktur halaman
      appBar: AppBar( // Membuat AppBar
        backgroundColor: Theme.of(context).colorScheme.inversePrimary, // Mengatur warna latar belakang
        title: const Text('Users'), // Judul AppBar
        actions: [ // Menambahkan aksi di AppBar
          IconButton( // Tombol untuk menambahkan pengguna baru
            icon: const Icon(Icons.add), // Ikon tambah
            onPressed: () async { // Fungsi yang dijalankan saat tombol ditekan
              final newUser = await Navigator.push( // Navigasi ke halaman form pengguna
                context,
                MaterialPageRoute(
                  builder: (context) => const UserFormPage(), // Halaman form pengguna
                ),
              );
              
              if (newUser != null) { // Jika pengguna baru ditambahkan
                setState(() { // Memperbarui state
                  users.add(newUser); // Menambahkan pengguna baru ke daftar
                });
                if (mounted) { // Memastikan widget masih terpasang
                  ScaffoldMessenger.of(context).showSnackBar( // Menampilkan snackbar untuk konfirmasi penambahan
                    const SnackBar(content: Text('User added successfully')), // Pesan snackbar
                  );
                }
              }
            },
          ),
        ],
      ),
      body: ListView.builder( // Membangun daftar pengguna
        itemCount: users.length, // Jumlah item dalam daftar
        itemBuilder: (context, index) { // Fungsi untuk membangun setiap item
          final user = users[index]; // Mengambil pengguna berdasarkan indeks
          return Card( // Menggunakan Card untuk setiap item
            margin: const EdgeInsets.symmetric( // Mengatur margin untuk Card
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: ListTile( // Menggunakan ListTile untuk menampilkan informasi pengguna
              leading: const CircleAvatar( // Avatar lingkaran untuk pengguna
                child: Icon(Icons.person), // Ikon pengguna
              ),
              title: Text(user['name']), // Menampilkan nama pengguna
              subtitle: Text('Email: ${user['email']} - Role: ${user['role']}'), // Menampilkan email dan peran pengguna
              trailing: Row( // Menambahkan tombol edit dan delete di sebelah kanan
                mainAxisSize: MainAxisSize.min, // Mengatur ukuran baris
                children: [
                  IconButton( // Tombol untuk mengedit pengguna
                    icon: const Icon(Icons.edit), // Ikon edit
                    onPressed: () async { // Fungsi yang dijalankan saat tombol ditekan
                      final updatedUser = await Navigator.push( // Navigasi ke halaman form pengguna dengan data pengguna
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserFormPage(user: user), // Halaman form pengguna dengan data pengguna
                        ),
                      );
                      
                      if (updatedUser != null) { // Jika pengguna diperbarui
                        updateUser(updatedUser); // Memperbarui pengguna
                      }
                    },
                  ),
                  IconButton( // Tombol untuk menghapus pengguna
                    icon: const Icon(Icons.delete), // Ikon hapus
                    onPressed: () { // Fungsi yang dijalankan saat tombol ditekan
                      showDialog( // Menampilkan dialog konfirmasi
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog( // Menggunakan AlertDialog untuk konfirmasi
                            title: const Text('Delete User'), // Judul dialog
                            content: const Text('Are you sure you want to delete this user?'), // Konten dialog
                            actions: [ // Aksi di dialog
                              TextButton( // Tombol untuk membatalkan
                                onPressed: () => Navigator.pop(context), // Menutup dialog
                                child: const Text('Cancel'), // Teks tombol
                              ),
                              TextButton( // Tombol untuk menghapus
                                onPressed: () {
                                  Navigator.pop(context); // Menutup dialog
                                  deleteUser(user['id']); // Menghapus pengguna
                                },
                                child: const Text('Delete'), // Teks tombol
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const Navbar(), // Menambahkan Navbar di bagian bawah
    );
  }
}