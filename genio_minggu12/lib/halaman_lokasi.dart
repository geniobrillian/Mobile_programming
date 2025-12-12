import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationDemo extends StatefulWidget {
  const LocationDemo({super.key});

  @override
  State<LocationDemo> createState() => _LocationDemoState();
}

class _LocationDemoState extends State<LocationDemo> {
  String _currentLocation = 'Belum mendapatkan lokasi';

  // Fungsi untuk mendapatkan lokasi saat ini
  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Uji apakah layanan lokasi diaktifkan
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _currentLocation = 'Layanan lokasi dinonaktifkan.';
      });
      return;
    }

    // Periksa izin
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _currentLocation = 'Izin lokasi ditolak.';
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _currentLocation = 'Izin lokasi ditolak permanen.';
      });
      return;
    }

    // Dapatkan lokasi saat ini
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _currentLocation =
          'Lat: ${position.latitude}, Lon: ${position.longitude}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Location Services Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_currentLocation, textAlign: TextAlign.center),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getCurrentLocation,
              child: const Text('Dapatkan Lokasi Saat Ini'),
            ),
          ],
        ),
      ),
    );
  }
}
