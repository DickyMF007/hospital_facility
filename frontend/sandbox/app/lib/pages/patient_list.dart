import 'package:flutter/material.dart'; // Mengimpor paket material dari Flutter

import '../components/navbar.dart'; // Mengimpor komponen Navbar
import 'patient_form.dart'; // Mengimpor halaman formulir pasien

class PatientListPage extends StatefulWidget { // Mendefinisikan kelas PatientListPage sebagai StatefulWidget
  const PatientListPage({super.key}); // Konstruktor untuk PatientListPage

  @override
  State<PatientListPage> createState() => _PatientListPageState(); // Mengembalikan state untuk PatientListPage
}

class _PatientListPageState extends State<PatientListPage> { // Mendefinisikan state untuk PatientListPage
  final List<Map<String, dynamic>> patients = [ // Daftar pasien yang disimpan dalam bentuk list
    {
      'id': '1', // ID pasien
      'name': 'John Doe', // Nama pasien
      'age': 45, // Usia pasien
      'condition': 'Hypertension', // Kondisi pasien
    },
    {
      'id': '2', // ID pasien
      'name': 'Jane Smith', // Nama pasien
      'age': 32, // Usia pasien
      'condition': 'Diabetes', // Kondisi pasien
    },
    {
      'id': '3', // ID pasien
      'name': 'Bob Johnson', // Nama pasien
      'age': 58, // Usia pasien
      'condition': 'Arthritis', // Kondisi pasien
    },
  ];

  // Menghapus pasien berdasarkan ID mereka
  void deletePatient(String id) {
    setState(() { // Memperbarui state
      patients.removeWhere((patient) => patient['id'] == id); // Menghapus pasien dari daftar
    });
    ScaffoldMessenger.of(context).showSnackBar( // Menampilkan snackbar untuk konfirmasi penghapusan
      const SnackBar(content: Text('Patient deleted successfully')), // Pesan snackbar
    );
  }

  // Memperbarui pasien dengan data yang diberikan
  void updatePatient(Map<String, dynamic> updatedPatient) {
    setState(() { // Memperbarui state
      final index = patients.indexWhere((patient) => patient['id'] == updatedPatient['id']); // Mencari indeks pasien
      if (index != -1) { // Jika pasien ditemukan
        patients[index] = updatedPatient; // Memperbarui data pasien
      }
    });
    ScaffoldMessenger.of(context).showSnackBar( // Menampilkan snackbar untuk konfirmasi pembaruan
      const SnackBar(content: Text('Patient updated successfully')), // Pesan snackbar
    );
  }

  @override
  Widget build(BuildContext context) { // Membangun UI untuk daftar pasien
    return Scaffold( // Menggunakan Scaffold untuk struktur halaman
      appBar: AppBar( // Membuat AppBar
        backgroundColor: Theme.of(context).colorScheme.inversePrimary, // Mengatur warna latar belakang AppBar
        title: const Text('Patients'), // Judul AppBar
        actions: [ // Menambahkan aksi di AppBar
          IconButton( // Tombol untuk menambahkan pasien baru
            icon: const Icon(Icons.add), // Ikon tambah
            onPressed: () async { // Fungsi yang dijalankan saat tombol ditekan
              final newPatient = await Navigator.push( // Navigasi ke halaman formulir pasien
                context,
                MaterialPageRoute(
                  builder: (context) => const PatientFormPage(), // Halaman formulir pasien
                ),
              );
              
              if (newPatient != null) { // Jika pasien baru ditambahkan
                setState(() { // Memperbarui state
                  patients.add(newPatient); // Menambahkan pasien baru ke daftar
                });
                if (mounted) { // Memastikan widget masih terpasang
                  ScaffoldMessenger.of(context).showSnackBar( // Menampilkan snackbar untuk konfirmasi penambahan
                    const SnackBar(content: Text('Patient added successfully')), // Pesan snackbar
                  );
                }
              }
            },
          ),
        ],
      ),
      body: ListView.builder( // Membangun daftar pasien
        itemCount: patients.length, // Jumlah item dalam daftar
        itemBuilder: (context, index) { // Fungsi untuk membangun setiap item
          final patient = patients[index]; // Mengambil data pasien berdasarkan indeks
          return Card( // Menggunakan Card untuk setiap item
            margin: const EdgeInsets.symmetric( // Mengatur margin untuk Card
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: ListTile( // Menggunakan ListTile untuk menampilkan informasi pasien
              leading: const CircleAvatar( // Menampilkan avatar lingkaran
                child: Icon(Icons.person), // Ikon untuk avatar
              ),
              title: Text(patient['name']), // Menampilkan nama pasien
              subtitle: Text('Age: ${patient['age']} - ${patient['condition']}'), // Menampilkan usia dan kondisi pasien
              trailing: Row( // Menambahkan tombol aksi di sebelah kanan
                mainAxisSize: MainAxisSize.min, // Mengatur ukuran baris
                children: [
                  IconButton( // Tombol untuk mengedit pasien
                    icon: const Icon(Icons.edit), // Ikon edit
                    onPressed: () async { // Fungsi yang dijalankan saat tombol ditekan
                      final updatedPatient = await Navigator.push( // Navigasi ke halaman formulir pasien dengan data pasien
                        context,
                        MaterialPageRoute(
                          builder: (context) => PatientFormPage(patient: patient), // Halaman formulir pasien dengan data pasien
                        ),
                      );
                      
                      if (updatedPatient != null) { // Jika pasien diperbarui
                        updatePatient(updatedPatient); // Memperbarui data pasien
                      }
                    },
                  ),
                  IconButton( // Tombol untuk menghapus pasien
                    icon: const Icon(Icons.delete), // Ikon hapus
                    onPressed: () { // Fungsi yang dijalankan saat tombol ditekan
                      showDialog( // Menampilkan dialog konfirmasi
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog( // Menggunakan AlertDialog untuk konfirmasi
                            title: const Text('Delete Patient'), // Judul dialog
                            content: const Text('Are you sure you want to delete this patient?'), // Konten dialog
                            actions: [ // Aksi dalam dialog
                              TextButton( // Tombol untuk membatalkan
                                onPressed: () => Navigator.pop(context), // Menutup dialog
                                child: const Text('Cancel'), // Teks tombol
                              ),
                              TextButton( // Tombol untuk menghapus
                                onPressed: () {
                                  Navigator.pop(context); // Menutup dialog
                                  deletePatient(patient['id']); // Menghapus pasien
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