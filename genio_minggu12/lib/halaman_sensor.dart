import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SensorDemo extends StatefulWidget {
  const SensorDemo({super.key});

  @override
  State<SensorDemo> createState() => _SensorDemoState();
}

class _SensorDemoState extends State<SensorDemo> {
  // Variabel untuk menyimpan data accelerometer
  double _x = 0.0, _y = 0.0, _z = 0.0;

  @override
  void initState() {
    super.initState();
    // Berlangganan (listen) ke stream data accelerometer
    accelerometerEventStream().listen(
      (AccelerometerEvent event) {
        // Panggil setState untuk memperbarui UI setiap kali ada data baru
        setState(() {
          _x = event.x;
          _y = event.y;
          _z = event.z;
        });
      },
      onError: (e) {
        // Tangani error sensor tidak tersedia
        print('Error pada Accelerometer: $e');
      },
      cancelOnError: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Accelerometer Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Data Accelerometer (g-force):'),
            Text('X-axis: ${_x.toStringAsFixed(2)}'),
            Text('Y-axis: ${_y.toStringAsFixed(2)}'),
            Text('Z-axis: ${_z.toStringAsFixed(2)}'),
            const SizedBox(height: 20),
            // GyroscopeEventStream() dapat digunakan dengan cara yang sama
          ],
        ),
      ),
    );
  }
}
