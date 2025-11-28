import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyController extends GetxController {
  var counter = 0.obs;
  void increment() {
    counter++;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(MyController());

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Manajemen Dependency dengan GetX")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Obx(
                () => Text(
                  "Nilai saat ini: ${Get.find<MyController>().counter.value}",
                  style: TextStyle(fontSize: 24),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Get.find<MyController>().increment();
                },
                child: Text("Increment"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
