import 'dart:convert'; // untuk json.decode
import 'package:flutter/material.dart'; // untuk Scaffold, AppBar, Text, dll.
import 'package:http/http.dart' as http;
import 'package:dropdown_search/dropdown_search.dart'; // untuk DropdownSearch

import '../models/province.dart';
import '../models/city.dart';

class HomePage extends StatelessWidget {
  String? idProv;

  final String apiKey =
      "8e49f28e0f2f2cf56393c352613eec358e85fb7077ce6f7f453ebb826a7b1f6d";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("WILAYAH INDONESIA")),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          DropdownSearch<Province>(
            popupProps: const PopupProps.dialog(showSearchBox: true),
            dropdownDecoratorProps: const DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Pilih Provinsi",
              ),
            ),
            asyncItems: (String? filter) async {
              var response = await http.get(
                Uri.parse(
                  "https://api.binderbyte.com/wilayah/provinsi?api_key=$apiKey",
                ),
              );

              if (response.statusCode != 200) return [];

              List allProvince =
                  (json.decode(response.body) as Map<String, dynamic>)["value"];
              return allProvince
                  .map((e) => Province(id: e["id"], name: e["name"]))
                  .toList();
            },
            itemAsString: (Province? p) => p?.name ?? '',
            onChanged: (value) => idProv = value?.id,
          ),
          const SizedBox(height: 20),
          DropdownSearch<City>(
            popupProps: const PopupProps.dialog(showSearchBox: true),
            dropdownDecoratorProps: const DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Pilih Kota/Kabupaten",
              ),
            ),
            asyncItems: (String? filter) async {
              if (idProv == null) return [];
              var response = await http.get(
                Uri.parse(
                  "https://api.binderbyte.com/wilayah/kabupaten?api_key=$apiKey&id_provinsi=$idProv",
                ),
              );

              if (response.statusCode != 200) return [];

              List allCity =
                  (json.decode(response.body) as Map<String, dynamic>)["value"];
              return allCity
                  .map(
                    (e) => City(
                      id: e["id"],
                      idProvinsi: e["id_provinsi"],
                      name: e["name"],
                    ),
                  )
                  .toList();
            },
            itemAsString: (City? c) => c?.name ?? '',
            onChanged: (value) => print(value?.toJson()),
          ),
        ],
      ),
    );
  }
}
