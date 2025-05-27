import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

void main() {
  runApp(MyCameraApp());
}

class MyCameraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CameraScreen(),
    );
  }
}

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? _imageFile;
  String _message = '';

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      final File image = File(pickedFile.path);

      // Simpan ke direktori lokal aplikasi
      final directory = await getApplicationDocumentsDirectory();
      final String fileName = path.basename(pickedFile.path);
      final String savedPath = path.join(directory.path, fileName);
      final File localImage = await image.copy(savedPath);

      setState(() {
        _imageFile = localImage;
        _message = 'Foto berhasil di-capture';
      });
    } else {
      setState(() {
        _message = 'Gagal mengambil foto';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kamera Sederhana'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _takePicture,
              child: Text('Ambil Gambar'),
            ),
            SizedBox(height: 20),
            if (_imageFile != null) Image.file(_imageFile!, height: 200),
            SizedBox(height: 10),
            Text(_message),
          ],
        ),
      ),
    );
  }
}
