import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as myhttp;

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
  late String id;
  late String email;
  late String name;

  @override
  void initState() {
    id = "ID: ";
    email = "EMAIL: ";
    name = "NAME: ";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("HTTP GET")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(id, style: const TextStyle(fontSize: 20)),
            Text(email, style: const TextStyle(fontSize: 20)),
            Text(name, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () async {
                Uri url = Uri.parse("https://reqres.in/api/users/5");

                var myresponse = await myhttp.get(url);

                if (myresponse.statusCode == 200) {
                  Map<String, dynamic> data =
                      json.decode(myresponse.body) as Map<String, dynamic>;

                  setState(() {
                    id = "ID: ${data['data']['id'].toString()}";
                    email = "EMAIL: ${data['data']['email'].toString()}";
                    name =
                        "NAME: ${data['data']['first_name']} ${data['data']['last_name']}";
                  });
                } else {
                  print("ERROR ${myresponse.statusCode}");
                }
              },
              child: const Text("GET DATA"),
            ),
          ],
        ),
      ),
    );
  }
}
