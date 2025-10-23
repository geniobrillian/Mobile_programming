import 'package:flutter/material.dart';
import './product.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PAGE HOME")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ProductPage()),
            );
          },
          child: const Text("NEXT PAGE >>>"),
        ),
      ),
    );
  }
}
