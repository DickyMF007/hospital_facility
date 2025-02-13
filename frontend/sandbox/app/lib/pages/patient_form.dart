import 'package:flutter/material.dart'; // Mengimpor paket material dari Flutter untuk UI

import '../components/navbar.dart'; // Mengimpor komponen Navbar

// Kelas untuk halaman formulir pasien
class PatientFormPage extends StatefulWidget {
  final Map<String, dynamic>? patient; // Menyimpan data pasien jika ada
  const PatientFormPage({super.key, this.patient}); // Konstruktor untuk inisialisasi

  @override
  State<PatientFormPage> createState() => _PatientFormPageState(); // Membuat state untuk halaman ini
}

// State untuk halaman formulir pasien
class _PatientFormPageState extends State<PatientFormPage> {
  final _formKey = GlobalKey<FormState>(); // Kunci untuk formulir
  final _nameController = TextEditingController(); // Kontroler untuk nama pasien
  final _ageController = TextEditingController(); // Kontroler untuk usia pasien
  final _conditionController = TextEditingController(); // Kontroler untuk kondisi medis pasien

  @override
  void initState() {
    super.initState(); // Memanggil metode initState dari superclass
    // Menginisialisasi field formulir dengan data pasien jika sedang mengedit pasien yang ada
    if (widget.patient != null) {
      _nameController.text = widget.patient!['name']; // Mengisi nama pasien
      _ageController.text = widget.patient!['age'].toString(); // Mengisi usia pasien
      _conditionController.text = widget.patient!['condition']; // Mengisi kondisi medis pasien
    }
  }

  // Memvalidasi dan mengirimkan data formulir
  void _submitForm() {
    if (_formKey.currentState!.validate()) { // Memeriksa apakah formulir valid
      final patientData = { // Membuat peta data pasien
        'id': widget.patient?['id'] ?? DateTime.now().millisecondsSinceEpoch.toString(), // ID pasien
        'name': _nameController.text, // Nama pasien
        'age': int.parse(_ageController.text), // Usia pasien
        'condition': _conditionController.text, // Kondisi medis pasien
      };

      Navigator.pop(context, patientData); // Kembali ke halaman sebelumnya dengan data pasien
    }
  }

  @override
  Widget build(BuildContext context) {
    // Membangun UI untuk formulir pasien
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary, // Warna latar belakang AppBar
        title: Text(widget.patient == null ? 'Add Patient' : 'Edit Patient'), // Judul halaman
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding di sekitar formulir
        child: Form(
          key: _formKey, // Mengaitkan kunci formulir
          child: Column(
            children: [
              TextFormField(
                controller: _nameController, // Mengaitkan kontroler untuk nama
                decoration: const InputDecoration(
                  labelText: 'Name', // Label untuk field nama
                  border: OutlineInputBorder(), // Border untuk field
                ),
                validator: (value) { // Validator untuk field nama
                  if (value == null || value.isEmpty) { // Memeriksa apakah nama kosong
                    return 'Please enter a name'; // Pesan kesalahan
                  }
                  return null; // Valid
                },
              ),
              const SizedBox(height: 16), // Jarak antara field
              TextFormField(
                controller: _ageController, // Mengaitkan kontroler untuk usia
                decoration: const InputDecoration(
                  labelText: 'Age', // Label untuk field usia
                  border: OutlineInputBorder(), // Border untuk field
                ),
                keyboardType: TextInputType.number, // Menampilkan keyboard angka
                validator: (value) { // Validator untuk field usia
                  if (value == null || value.isEmpty) { // Memeriksa apakah usia kosong
                    return 'Please enter an age'; // Pesan kesalahan
                  }
                  if (int.tryParse(value) == null) { // Memeriksa apakah usia valid
                    return 'Please enter a valid number'; // Pesan kesalahan
                  }
                  return null; // Valid
                },
              ),
              const SizedBox(height: 16), // Jarak antara field
              TextFormField(
                controller: _conditionController, // Mengaitkan kontroler untuk kondisi medis
                decoration: const InputDecoration(
                  labelText: 'Medical Condition', // Label untuk field kondisi medis
                  border: OutlineInputBorder(), // Border untuk field
                ),
                validator: (value) { // Validator untuk field kondisi medis
                  if (value == null || value.isEmpty) { // Memeriksa apakah kondisi kosong
                    return 'Please enter a medical condition'; // Pesan kesalahan
                  }
                  return null; // Valid
                },
              ),
              const SizedBox(height: 24), // Jarak sebelum tombol
              ElevatedButton(
                onPressed: _submitForm, // Memanggil fungsi untuk mengirim formulir
                child: Text(widget.patient == null ? 'Create Patient' : 'Update Patient'), // Teks tombol
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Navbar(), // Menambahkan Navbar di bagian bawah
    );
  }

  @override
  void dispose() {
    // Menghapus kontroler untuk membebaskan sumber daya
    _nameController.dispose(); // Menghapus kontroler nama
    _ageController.dispose(); // Menghapus kontroler usia
    _conditionController.dispose(); // Menghapus kontroler kondisi medis
    super.dispose(); // Memanggil metode dispose dari superclass
  }
}