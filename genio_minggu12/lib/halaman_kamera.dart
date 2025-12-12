import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImagePickerDemo extends StatefulWidget {
  const ImagePickerDemo({super.key});

  @override
  State<ImagePickerDemo> createState() => _ImagePickerDemoState();
}

class _ImagePickerDemoState extends State<ImagePickerDemo> {
  // Variabel untuk menyimpan file gambar yang dipilih
  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  // Fungsi untuk memilih gambar dari galeri
  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source);
      setState(() {
        _imageFile = pickedFile;
      });
    } catch (e) {
      // Handle error, misalnya izin tidak diberikan
      print('Error memilih gambar: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Picker Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Tampilkan gambar jika sudah ada yang dipilih
            if (_imageFile != null)
              // File widget digunakan untuk menampilkan gambar dari path file
              Image.file(
                File(_imageFile!.path),
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              )
            else
              const Text('Belum ada gambar yang dipilih.'),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () => _pickImage(ImageSource.gallery),
              child: const Text('Pilih dari Galeri'),
            ),

            ElevatedButton(
              onPressed: () => _pickImage(ImageSource.camera),
              child: const Text('Ambil dari Kamera'),
            ),
          ],
        ),
      ),
    );
  }
}
