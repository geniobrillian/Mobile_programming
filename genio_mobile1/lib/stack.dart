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
        body: Stack(

          children: [
            Container(
              width: 125,
              height: 125,
              color: Colors.blue,
              child: const Text("1"),
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.green,
              child: const Text("2"),
            ),
            Container(
              width: 75,
              height: 75,
              color: Colors.yellow,
              child: const Text("3"),
            ),
          ],
        ),
      ),
    );
  }
}