import 'package:flutter/material.dart';

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

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Snackbar")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text(
                  "Hapus produk berhasil.",
                  style: TextStyle(color: Colors.black),
                ),
                action: SnackBarAction(
                  label: "CANCEL",
                  onPressed: () {
                    print("TIDAK JADI HAPUS PRODUK");
                  },
                  textColor: Colors.red[200],
                ),
                backgroundColor: Colors.amber[700],
                duration: const Duration(seconds: 3),
                margin: const EdgeInsets.all(20),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            );
          },
          child: const Text("SHOW SNACKBAR"),
        ),
      ),
    );
  }
}
