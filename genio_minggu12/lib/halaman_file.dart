import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class HalamanFile extends StatefulWidget {
  const HalamanFile({super.key});

  @override
  State<HalamanFile> createState() => _HalamanFileState();
}

class _HalamanFileState extends State<HalamanFile> {
  String _fileContent = 'Belum ada data';

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/data_saya.txt');
  }

  Future<void> _saveData() async {
    final file = await _localFile;
    await file.writeAsString(
      'Data disimpan jam ${DateTime.now().hour}:${DateTime.now().minute}',
    );
    setState(() {
      _fileContent = "Data berhasil disimpan!";
    });
  }

  Future<void> _readData() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      setState(() {
        _fileContent = contents;
      });
    } catch (e) {
      setState(() {
        _fileContent = 'Gagal baca file (mungkin belum dibuat).';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tes File System')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Isi File:', style: TextStyle(fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_fileContent, textAlign: TextAlign.center),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _saveData,
                  child: const Text('Tulis Data'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _readData,
                  child: const Text('Baca Data'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
