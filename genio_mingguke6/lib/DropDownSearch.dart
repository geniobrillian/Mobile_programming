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

          itemAsString: (Map<String, dynamic>? item) {
            return item?['country'] ?? 'Unknown Country';
          },

          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              labelText: "Pilih Negara",
              hintText: "Pilih salah satu negara...",
              border: OutlineInputBorder(),
            ),
          ),

          popupProps: PopupProps.menu(
            showSearchBox: true,
            itemBuilder: (context, item, isSelected) {
              return ListTile(
                title: Text(item['country']),
                subtitle: Text("ID: ${item['id']}"),
              );
            },
          ),
          onChanged: (Map<String, dynamic>? selectedItem) {
            if (selectedItem != null) {
              print("Anda memilih: ${selectedItem['country']}");
            }
          },

        ),
      ),
    );
  }
}
