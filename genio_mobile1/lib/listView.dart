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
        body: ListView(
          scrollDirection: Axis.horizontal,

          children: [
            Container(
              width: 150,
              height: 150,
              color: Colors.pink[100],
              margin: const EdgeInsets.all(8.0),
              child: const Center(child: Text("Item 1")),
            ),
            Container(
              width: 150,
              height: 150,
              color: Colors.pink[200],
              margin: const EdgeInsets.all(8.0),
              child: const Center(child: Text("Item 2")),
            ),
            Container(
              width: 150,
              height: 150,
              color: Colors.pink[300],
              margin: const EdgeInsets.all(8.0),
              child: const Center(child: Text("Item 3")),
            ),
            Container(
              width: 150,
              height: 150,
              color: Colors.pink[400],
              margin: const EdgeInsets.all(8.0),
              child: const Center(child: Text("Item 4")),
            ),
            Container(
              width: 150,
              height: 150,
              color: Colors.pink[500],
              margin: const EdgeInsets.all(8.0),
              child: const Center(child: Text("Item 5")),
            ),
            Container(
              width: 150,
              height: 150,
              color: Colors.pink[600],
              margin: const EdgeInsets.all(8.0),
              child: const Center(child: Text("Item 6")),
            ),
            Container(
              width: 150,
              height: 150,
              color: Colors.pink[700],
              margin: const EdgeInsets.all(8.0),
              child: const Center(child: Text("Item 7")),
            ),
            Container(
              width: 150,
              height: 150,
              color: Colors.pink[800],
              margin: const EdgeInsets.all(8.0),
              child: const Center(child: Text("Item 8")),
            ),
            Container(
              width: 150,
              height: 150,
              color: Colors.pink[900],
              margin: const EdgeInsets.all(8.0),
              child: const Center(child: Text("Item 9")),
            ),
            Container(
              width: 150,
              height: 150,
              color: Colors.black,
              margin: const EdgeInsets.all(8.0),
              child: const Center(
                child: Text("Item 10", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}