import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(title: 'Get Storage Example', home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  final getStorageBox = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Get Storage Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                getStorageBox.write('username', 'Flutter user');
                Get.snackbar(
                  "Data Disimpan",
                  "Username: Flutter user",
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
              child: Text("Simpan Data"),
            ),
            ElevatedButton(
              onPressed: () {
                String username =
                    getStorageBox.read('username') ?? 'Tidak ada data';
                Get.snackbar(
                  "Data Dibaca",
                  "Username: $username",
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
              child: Text("Ambil Data"),
            ),
            ElevatedButton(
              onPressed: () {
                getStorageBox.remove('username');
                Get.snackbar(
                  "Data Dihapus",
                  "Username berhasil dihapus",
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
              child: Text("Hapus Data"),
            ),
          ],
        ),
      ),
    );
  }
}
