import 'package:flutter/material.dart'; // Mengimpor paket material dari Flutter untuk membangun UI.

import '../components/navbar.dart'; // Mengimpor komponen Navbar dari direktori components.
import 'item_form.dart'; // Mengimpor ItemFormPage dari file item_form.dart untuk menambah atau mengedit item.

class ItemListPage extends StatefulWidget { // Mendefinisikan kelas ItemListPage sebagai StatefulWidget.
  const ItemListPage({super.key}); // Konstruktor untuk ItemListPage.

  @override
  State<ItemListPage> createState() => _ItemListPageState(); // Mengembalikan state untuk ItemListPage.
}

class _ItemListPageState extends State<ItemListPage> { // Mendefinisikan state untuk ItemListPage.
  final List<Map<String, dynamic>> items = [ // Mendeklarasikan daftar item dengan tipe Map.
    {
      'id': '1', // ID item.
      'name': 'Laptop', // Nama item.
      'description': 'High-performance laptop', // Deskripsi item.
      'price': 999.99, // Harga item.
    },
    {
      'id': '2',
      'name': 'Smartphone',
      'description': 'Latest model smartphone',
      'price': 699.99,
    },
    {
      'id': '3',
      'name': 'Headphones',
      'description': 'Wireless noise-canceling headphones',
      'price': 199.99,
    },
  ];

  // Fungsi untuk menghapus item berdasarkan ID-nya.
  void deleteItem(String id) {
    setState(() { // Memanggil setState untuk memperbarui UI.
      items.removeWhere((item) => item['id'] == id); // Menghapus item dari daftar berdasarkan ID.
    });
    ScaffoldMessenger.of(context).showSnackBar( // Menampilkan snackbar untuk konfirmasi penghapusan.
      const SnackBar(content: Text('Item deleted successfully')), // Pesan snackbar.
    );
  }

  // Fungsi untuk memperbarui item dengan data yang diberikan.
  void updateItem(Map<String, dynamic> updatedItem) {
    setState(() { // Memanggil setState untuk memperbarui UI.
      final index = items.indexWhere((item) => item['id'] == updatedItem['id']); // Mencari indeks item yang akan diperbarui.
      if (index != -1) { // Jika item ditemukan.
        items[index] = updatedItem; // Memperbarui item di daftar.
      }
    });
    ScaffoldMessenger.of(context).showSnackBar( // Menampilkan snackbar untuk konfirmasi pembaruan.
      const SnackBar(content: Text('Item updated successfully')), // Pesan snackbar.
    );
  }

  @override
  Widget build(BuildContext context) { // Fungsi untuk membangun UI.
    return Scaffold( // Menggunakan Scaffold untuk struktur dasar halaman.
      appBar: AppBar( // Membuat AppBar di bagian atas.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary, // Mengatur warna latar belakang AppBar.
        title: const Text('Items'), // Judul AppBar.
        actions: [ // Menambahkan tombol aksi di AppBar.
          IconButton( // Tombol untuk menambah item baru.
            icon: const Icon(Icons.add), // Ikon tambah.
            onPressed: () async { // Fungsi yang dijalankan saat tombol ditekan.
              final newItem = await Navigator.push( // Navigasi ke ItemFormPage untuk menambah item baru.
                context,
                MaterialPageRoute(
                  builder: (context) => const ItemFormPage(), // Membangun ItemFormPage.
                ),
              );
              
              if (newItem != null) { // Jika item baru tidak null.
                setState(() { // Memanggil setState untuk memperbarui UI.
                  items.add(newItem); // Menambahkan item baru ke daftar.
                });
                if (mounted) { // Memastikan widget masih terpasang.
                  ScaffoldMessenger.of(context).showSnackBar( // Menampilkan snackbar untuk konfirmasi penambahan.
                    const SnackBar(content: Text('Item added successfully')), // Pesan snackbar.
                  );
                }
              }
            },
          ),
        ],
      ),
      body: ListView.builder( // Menggunakan ListView.builder untuk menampilkan daftar item.
        itemCount: items.length, // Mengatur jumlah item yang ditampilkan.
        itemBuilder: (context, index) { // Fungsi untuk membangun setiap item dalam daftar.
          final item = items[index]; // Mengambil item berdasarkan indeks.
          return Card( // Menggunakan Card untuk setiap item.
            margin: const EdgeInsets.symmetric( // Mengatur margin untuk Card.
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: ListTile( // Menggunakan ListTile untuk menampilkan informasi item.
              leading: const CircleAvatar( // Menampilkan avatar lingkaran di sebelah kiri.
                child: Icon(Icons.shopping_bag), // Ikon belanja.
              ),
              title: Text(item['name']), // Menampilkan nama item.
              subtitle: Text('${item['description']} - \$${item['price'].toStringAsFixed(2)}'), // Menampilkan deskripsi dan harga item.
              trailing: Row( // Menampilkan tombol edit dan delete di sebelah kanan.
                mainAxisSize: MainAxisSize.min, // Mengatur ukuran baris.
                children: [
                  IconButton( // Tombol untuk mengedit item.
                    icon: const Icon(Icons.edit), // Ikon edit.
                    onPressed: () async { // Fungsi yang dijalankan saat tombol ditekan.
                      final updatedItem = await Navigator.push( // Navigasi ke ItemFormPage untuk mengedit item.
                        context,
                        MaterialPageRoute(
                          builder: (context) => ItemFormPage(item: item), // Membangun ItemFormPage dengan item yang dipilih.
                        ),
                      );
                      
                      if (updatedItem != null) { // Jika item yang diperbarui tidak null.
                        updateItem(updatedItem); // Memperbarui item dengan data baru.
                      }
                    },
                  ),
                  IconButton( // Tombol untuk menghapus item.
                    icon: const Icon(Icons.delete), // Ikon hapus.
                    onPressed: () { // Fungsi yang dijalankan saat tombol ditekan.
                      showDialog( // Menampilkan dialog konfirmasi untuk menghapus item.
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog( // Menggunakan AlertDialog untuk konfirmasi.
                            title: const Text('Delete Item'), // Judul dialog.
                            content: const Text('Are you sure you want to delete this item?'), // Konten dialog.
                            actions: [ // Menambahkan tombol aksi di dialog.
                              TextButton( // Tombol untuk membatalkan penghapusan.
                                onPressed: () => Navigator.pop(context), // Menutup dialog.
                                child: const Text('Cancel'), // Teks tombol.
                              ),
                              TextButton( // Tombol untuk menghapus item.
                                onPressed: () {
                                  Navigator.pop(context); // Menutup dialog.
                                  deleteItem(item['id']); // Memanggil fungsi deleteItem untuk menghapus item.
                                },
                                child: const Text('Delete'), // Teks tombol.
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
      bottomNavigationBar: const Navbar(), // Menambahkan Navbar di bagian bawah.
    );
  }
}