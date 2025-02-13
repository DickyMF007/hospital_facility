import 'package:flutter/material.dart'; // Mengimpor paket material dari Flutter untuk menggunakan widget material.

import '../components/navbar.dart'; // Mengimpor komponen Navbar dari direktori komponen.

class ItemFormPage extends StatefulWidget { // Mendefinisikan kelas ItemFormPage yang merupakan StatefulWidget.
  final Map<String, dynamic>? item; // Mendeklarasikan variabel item yang dapat berisi data item yang ada.
  const ItemFormPage({super.key, this.item}); // Konstruktor untuk ItemFormPage, menerima item sebagai parameter.

  @override
  State<ItemFormPage> createState() => _ItemFormPageState(); // Mengembalikan state untuk ItemFormPage.
}

class _ItemFormPageState extends State<ItemFormPage> { // Mendefinisikan state untuk ItemFormPage.
  final _formKey = GlobalKey<FormState>(); // Kunci untuk mengelola status form.
  final _nameController = TextEditingController(); // Kontroler untuk field nama.
  final _descriptionController = TextEditingController(); // Kontroler untuk field deskripsi.
  final _quantityController = TextEditingController(); // Kontroler untuk field kuantitas.

  @override
  void initState() { // Metode yang dipanggil saat state diinisialisasi.
    super.initState(); // Memanggil metode initState dari superclass.
    // Memeriksa apakah item ada, jika ada, mengisi kontroler dengan data item.
    if (widget.item != null) {
      _nameController.text = widget.item!['name']; // Mengisi kontroler nama dengan nama item.
      _descriptionController.text = widget.item!['description']; // Mengisi kontroler deskripsi dengan deskripsi item.
      _quantityController.text = widget.item!['quantity'].toString(); // Mengisi kontroler kuantitas dengan kuantitas item.
    }
  }

  // Metode untuk memvalidasi dan mengirimkan data form.
  void _submitForm() {
    if (_formKey.currentState!.validate()) { // Memeriksa apakah form valid.
      final itemData = { // Membuat map untuk menyimpan data item.
        'id': widget.item?['id'] ?? DateTime.now().millisecondsSinceEpoch.toString(), // Mengambil ID item atau membuat ID baru.
        'name': _nameController.text, // Mengambil nama dari kontroler.
        'description': _descriptionController.text, // Mengambil deskripsi dari kontroler.
        'quantity': int.parse(_quantityController.text), // Mengambil kuantitas dari kontroler dan mengonversinya ke int.
      };

      Navigator.pop(context, itemData); // Menutup halaman dan mengembalikan data item.
    }
  }

  @override
  Widget build(BuildContext context) { // Metode untuk membangun UI.
    // Membangun UI untuk form item.
    return Scaffold( // Menggunakan Scaffold untuk struktur dasar halaman.
      appBar: AppBar( // Membuat AppBar di bagian atas halaman.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary, // Mengatur warna latar belakang AppBar.
        title: Text(widget.item == null ? 'Add Item' : 'Edit Item'), // Menampilkan judul berdasarkan apakah item ada atau tidak.
      ),
      body: Padding( // Menambahkan padding di sekitar form.
        padding: const EdgeInsets.all(16.0), // Mengatur padding menjadi 16 piksel di semua sisi.
        child: Form( // Membuat form untuk input data.
          key: _formKey, // Mengaitkan kunci form.
          child: Column( // Menggunakan kolom untuk menyusun widget secara vertikal.
            children: [
              TextFormField( // Field untuk input nama.
                controller: _nameController, // Mengaitkan kontroler nama.
                decoration: const InputDecoration( // Mengatur dekorasi untuk field.
                  labelText: 'Name', // Label untuk field.
                  border: OutlineInputBorder(), // Mengatur border field.
                ),
                validator: (value) { // Validator untuk memeriksa input.
                  if (value == null || value.isEmpty) { // Memeriksa apakah input kosong.
                    return 'Please enter a name'; // Mengembalikan pesan kesalahan jika kosong.
                  }
                  return null; // Mengembalikan null jika valid.
                },
              ),
              const SizedBox(height: 16), // Menambahkan jarak antara field.
              TextFormField( // Field untuk input deskripsi.
                controller: _descriptionController, // Mengaitkan kontroler deskripsi.
                decoration: const InputDecoration( // Mengatur dekorasi untuk field.
                  labelText: 'Description', // Label untuk field.
                  border: OutlineInputBorder(), // Mengatur border field.
                ),
                validator: (value) { // Validator untuk memeriksa input.
                  if (value == null || value.isEmpty) { // Memeriksa apakah input kosong.
                    return 'Please enter a description'; // Mengembalikan pesan kesalahan jika kosong.
                  }
                  return null; // Mengembalikan null jika valid.
                },
              ),
              const SizedBox(height: 16), // Menambahkan jarak antara field.
              TextFormField( // Field untuk input kuantitas.
                controller: _quantityController, // Mengaitkan kontroler kuantitas.
                decoration: const InputDecoration( // Mengatur dekorasi untuk field.
                  labelText: 'Quantity', // Label untuk field.
                  border: OutlineInputBorder(), // Mengatur border field.
                ),
                keyboardType: TextInputType.number, // Mengatur keyboard untuk input angka.
                validator: (value) { // Validator untuk memeriksa input.
                  if (value == null || value.isEmpty) { // Memeriksa apakah input kosong.
                    return 'Please enter a quantity'; // Mengembalikan pesan kesalahan jika kosong.
                  }
                  if (int.tryParse(value) == null) { // Memeriksa apakah input dapat diubah menjadi int.
                    return 'Please enter a valid number'; // Mengembalikan pesan kesalahan jika tidak valid.
                  }
                  return null; // Mengembalikan null jika valid.
                },
              ),
              const SizedBox(height: 24), // Menambahkan jarak sebelum tombol.
              ElevatedButton( // Tombol untuk mengirim form.
                onPressed: _submitForm, // Mengaitkan fungsi submit saat tombol ditekan.
                child: Text(widget.item == null ? 'Create Item' : 'Update Item'), // Menampilkan teks tombol berdasarkan kondisi.
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Navbar(), // Menambahkan Navbar di bagian bawah halaman.
    );
  }

  @override
  void dispose() { // Metode untuk membersihkan sumber daya.
    // Menghapus kontroler untuk membebaskan sumber daya.
    _nameController.dispose(); // Menghapus kontroler nama.
    _descriptionController.dispose(); // Menghapus kontroler deskripsi.
    _quantityController.dispose(); // Menghapus kontroler kuantitas.
    super.dispose(); // Memanggil dispose dari superclass.
  }
}