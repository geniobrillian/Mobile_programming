import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  String data = "belum ada data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HTTP DELETE"),
        actions: [
          IconButton(
            onPressed: () async {
              var response = await http.get(
                Uri.parse("https://reqres.in/api/users/2"),
              );
              Map<String, dynamic> mybody = json.decode(response.body);

              setState(() {
                data =
                    "Akun: ${mybody['data']['first_name']} ${mybody['data']['last_name']}";
              });
            },
            icon: const Icon(Icons.get_app),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(data),
          const SizedBox(height: 35),
          ElevatedButton(
            onPressed: () async {
              var response = await http.delete(
                Uri.parse("https://reqres.in/api/users/2"),
              );

              if (response.statusCode == 204) {
                setState(() {
                  data = "Berhasil menghapus data";
                });
              }
            },
            child: const Text("DELETE"),
          ),
        ],
      ),
    );
  }
}
