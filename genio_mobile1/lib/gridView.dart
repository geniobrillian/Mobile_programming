import 'package:flutter/material.dart';

void main() {
  runApp(const HaloDuniaku());
}

class HaloDuniaku extends StatelessWidget {
  const HaloDuniaku({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text("Aplikasi pertama Genio"),
        ),
        body: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          padding: const EdgeInsets.all(10.0),
          children: [
            Container(
              color: Colors.yellow,
              child: const Center(child: Text("Item 1")),
            ),
            Container(
              color: Colors.orange,
              child: const Center(child: Text("Item 2")),
            ),
            Container(
              color: Colors.red,
              child: const Center(child: Text("Item 3", style: TextStyle(color: Colors.white))),
            ),
            Container(
              color: Colors.purple,
              child: const Center(child: Text("Item 4", style: TextStyle(color: Colors.white))),
            ),
            Container(
              color: Colors.blue,
              child: const Center(child: Text("Item 5", style: TextStyle(color: Colors.white))),
            ),
            Container(
              color: Colors.green,
              child: const Center(child: Text("Item 6")),
            ),
            Container(
              color: Colors.teal,
              child: const Center(child: Text("Item 7", style: TextStyle(color: Colors.white))),
            ),
            Container(
              color: Colors.cyan,
              child: const Center(child: Text("Item 8")),
            ),
            Container(
              color: Colors.indigo,
              child: const Center(child: Text("Item 9", style: TextStyle(color: Colors.white))),
            ),
            Container(
              color: Colors.brown,
              child: const Center(child: Text("Item 10", style: TextStyle(color: Colors.white))),
            ),
          ],
        ),
      ),
    );
  }
}