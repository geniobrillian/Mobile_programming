import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';

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
      appBar: AppBar(title: const Text("Avatar Glow")),
      body: Center(
        child: AvatarGlow(
          glowRadiusFactor:
              150.0,
          glowColor: Colors.red,
          duration: const Duration(milliseconds: 500),
          child: Material(
            elevation: 8.0,
            shape: const CircleBorder(),
            child: CircleAvatar(
              backgroundColor: Colors.grey[100],
              backgroundImage: const NetworkImage('https://picsum.photos/200'),
              radius: 75.0,
            ),
          ),
        ),
      ),
    );
  }
}
