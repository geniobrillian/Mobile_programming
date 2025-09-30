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
        body: SingleChildScrollView(
          child: Column(

            children: [

              Container(
                width: double.infinity,
                height: 150,
                color: Colors.blue[100],
                child: const Center(child: Text("Container 1")),
              ),
              Container(
                width: double.infinity,
                height: 150,
                color: Colors.blue[200],
                child: const Center(child: Text("Container 2")),
              ),
              Container(
                width: double.infinity,
                height: 150,
                color: Colors.blue[300],
                child: const Center(child: Text("Container 3")),
              ),
              Container(
                width: double.infinity,
                height: 150,
                color: Colors.blue[400],
                child: const Center(child: Text("Container 4")),
              ),
              Container(
                width: double.infinity,
                height: 150,
                color: Colors.blue[500],
                child: const Center(child: Text("Container 5")),
              ),
              Container(
                width: double.infinity,
                height: 150,
                color: Colors.blue[600],
                child: const Center(child: Text("Container 6")),
              ),
              Container(
                width: double.infinity,
                height: 150,
                color: Colors.blue[700],
                child: const Center(child: Text("Container 7")),
              ),
              Container(
                width: double.infinity,
                height: 150,
                color: Colors.blue[800],
                child: const Center(child: Text("Container 8")),
              ),
              Container(
                width: double.infinity,
                height: 150,
                color: Colors.blue[900],
                child: const Center(child: Text("Container 9")),
              ),
              Container(
                width: double.infinity,
                height: 150,
                color: Colors.black,
                child: const Center(
                  child: Text("Container 10", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}