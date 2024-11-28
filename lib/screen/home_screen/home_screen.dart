import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? downloadUrl;

  Future<void> uploadFile() async {
    // Fayl tanlash
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'mp4'],
    );

    if (result != null) {
      final filePath = result.files.single.path!;
      final fileName = result.files.single.name;

      // Firebase Storage'ga yuklash
      try {
        final storageRef =
            FirebaseStorage.instance.ref().child('uploads/$fileName');
        await storageRef.putFile(File(filePath));
        downloadUrl = await storageRef.getDownloadURL();
        setState(() {});
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Fayl muvaffaqiyatli yuklandi!')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Yuklashda xatolik: $e')),
        );
      }
    }
  }

  Future<void> downloadFile() async {
    if (downloadUrl != null) {
      // Faylni yuklab olish uchun URLni ishlatish
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Fayl yuklab olish URLsi: $downloadUrl')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Avval faylni yuklang!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Firebase File Uploader'),
        backgroundColor: Colors.grey[850],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Firebase Storage bilan ishlash',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: uploadFile,
                      icon: const Icon(Icons.upload_file),
                      label: const Text("Faylni yuklash"),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blueAccent,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: downloadFile,
                      icon: const Icon(Icons.download),
                      label: const Text("Faylni yuklab olish"),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                      ),
                    ),
                    if (downloadUrl != null) ...[
                      const SizedBox(height: 20),
                      Text(
                        'Yuklab olish URLsi:',
                        style: TextStyle(color: Colors.grey[400], fontSize: 14),
                      ),
                      SelectableText(
                        downloadUrl!,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
