import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllerA extends GetxController {
  var valueA = 'A'.obs;
}

class ControllerB extends GetxController {
  var valueB = 'B'.obs;
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Class Bindings dengan GetX")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                "Text ('Value A:'): ${Get.find<ControllerA>().valueA.value}",
              ),
            ),
            const SizedBox(height: 10),
            Obx(
              () => Text(
                "Text ('Value B:'): ${Get.find<ControllerB>().valueB.value}",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => HomePage(),
          binding: BindingsBuilder(
            () => {Get.put(ControllerA()), Get.put(ControllerB())},
          ),
        ),
      ],
    );
  }
}
