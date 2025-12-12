import 'package:flutter/material.dart';
import 'halaman_kamera.dart';
import 'halaman_file.dart';
import 'halaman_sensor.dart';
import 'halaman_lokasi.dart';

void main() {
  runApp(
    const MaterialApp(home: MenuUtama(), debugShowCheckedModeBanner: false),
  );
}

class MenuUtama extends StatelessWidget {
  const MenuUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo Fitur Flutter')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ImagePickerDemo(),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(15),
                child: Text('1. Tes Kamera & Galeri'),
              ),
            ),
            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HalamanFile()),
              ),
              child: const Padding(
                padding: EdgeInsets.all(15),
                child: Text('2. Tes Simpan File'),
              ),
            ),
            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SensorDemo()),
              ),
              child: const Padding(
                padding: EdgeInsets.all(15),
                child: Text('3. Tes Sensor (Accelerometer)'),
              ),
            ),
            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LocationDemo()),
              ),
              child: const Padding(
                padding: EdgeInsets.all(15),
                child: Text('4. Tes Lokasi (Geolocator)'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
