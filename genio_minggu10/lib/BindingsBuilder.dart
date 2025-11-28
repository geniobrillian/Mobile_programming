import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  var name = ''.obs;
  var email = ''.obs;

  void updateName(String newName) {
    name.value = newName;
  }

  void updateEmail(String newEmail) {
    email.value = newEmail;
  }

  bool validationForm() {
    return name.isNotEmpty && email.isNotEmpty;
  }
}

class FormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormController>(() => FormController());
  }
}

class UI_FormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FormController>();

    return Scaffold(
      appBar: AppBar(title: const Text("Test Penggunaan dengan GetX")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFormField(
              labelText: "Nama",
              onChanged: controller.updateName,
            ),
            const SizedBox(height: 10),
            _buildFormField(
              labelText: "Email",
              onChanged: controller.updateEmail,
            ),
            const SizedBox(height: 30),
            Obx(() => Text("Nama: ${controller.name.value}")),
            const SizedBox(height: 5),
            Obx(() => Text("Email: ${controller.email.value}")),
            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                controller.validationForm()
                    ? Get.snackbar(
                        "Sukses",
                        "Formulir berhasil divalidasi.",
                        backgroundColor: Colors.green,
                        colorText: Colors.white,
                      )
                    : Get.snackbar(
                        "Gagal",
                        "Harap isi semua field dengan benar.",
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
              },
              child: const Text("Validasi"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormField({
    required String labelText,
    required Function(String) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => UI_FormPage(), binding: FormBinding()),
      ],
    ),
  );
}
