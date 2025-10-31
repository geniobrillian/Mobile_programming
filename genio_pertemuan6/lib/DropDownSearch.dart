import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> dataList = [
    {"country": "Brazil", "id": 1},
    {"country": "Tunisia", "id": 2},
    {"country": "Canada", "id": 3},
    {"country": "India", "id": 4},
    {"country": "Indonesia", "id": 5},
  ];
  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contoh Dropdown Search")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: DropdownSearch<Map<String, dynamic>>(
          items: dataList,

          // Memberi tahu widget cara menampilkan string untuk setiap item
          // Ini digunakan untuk pencarian dan tampilan item yang dipilih
          itemAsString: (Map<String, dynamic>? item) {
            return item?['country'] ?? 'Unknown Country';
          },

          // Dekorasi untuk dropdown
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              labelText: "Pilih Negara",
              hintText: "Pilih salah satu negara...",
              border: OutlineInputBorder(),
            ),
          ),

          // Opsi untuk tampilan popup
          popupProps: PopupProps.menu(
            showSearchBox: true, // Menampilkan kotak pencarian di dalam popup
            itemBuilder: (context, item, isSelected) {
              // Kustomisasi tampilan setiap item di dalam list popup
              return ListTile(
                title: Text(item['country']),
                subtitle: Text("ID: ${item['id']}"),
              );
            },
          ),

          // Fungsi yang akan dipanggil saat item dipilih
          onChanged: (Map<String, dynamic>? selectedItem) {
            if (selectedItem != null) {
              print("Anda memilih: ${selectedItem['country']}");
            }
          },

          // Opsional: item yang dipilih secara default
          // selectedItem: dataList[4], // Contoh: Indonesia
        ),
      ),
    );
  }
} // FIX 2: Menambahkan '}' yang hilang untuk menutup class HomePage
