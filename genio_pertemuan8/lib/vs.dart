// The main.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  var counter = 0.obs;

  void increment() {
    counter++;
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("State Management Example")),
        body: Column(
          children: [StatelessExample(), StatefulExample(), GetXExample()],
        ),
      ),
    );
  }
}

class StatelessExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Hello from Stateless Widget!"));
  }
}

class StatefulExample extends StatefulWidget {
  @override
  _StatefulExampleState createState() => _StatefulExampleState();
}

class _StatefulExampleState extends State<StatefulExample> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Counter: $counter'),
        ElevatedButton(
          onPressed: () {
            setState(() {
              counter++;
            });
          },
          child: Text("Increment Stateful"),
        ),
      ],
    );
  }
}

class GetXExample extends StatelessWidget {
  final CounterController c = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => Text('Counter: ${c.counter.value}')),
        ElevatedButton(
          onPressed: c.increment,
          child: Text("Increment with GetX"),
        ),
      ],
    );
  }
}
