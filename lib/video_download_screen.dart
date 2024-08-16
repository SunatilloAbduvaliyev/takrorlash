import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class VideoDownloadScreen extends StatefulWidget {
  const VideoDownloadScreen({super.key});

  @override
  State<VideoDownloadScreen> createState() => _VideoDownloadScreenState();
}

class _VideoDownloadScreenState extends State<VideoDownloadScreen> {
  double downloadPercentage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "${(downloadPercentage * 100).toStringAsFixed(0)}%",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            LinearProgressIndicator(
              minHeight: 30,
              borderRadius: BorderRadius.circular(20),
              value: downloadPercentage,
            ),
            const SizedBox(
              height: 20,
            ),
            FilledButton(
              onPressed: () async {
                final Dio dio = Dio();
                final videoFolder = await getTemporaryDirectory(); // getApplicationDocumentsDirectory() o'rniga getTemporaryDirectory() ishlatildi
                final videoPath = "${videoFolder.path}/downloadexample.mp4"; // Fayl nomi va kengaytmasi qo'shildi

                try {
                  await dio.download(
                    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
                    videoPath,
                    onReceiveProgress: (count, total) {
                      setState(() {
                        downloadPercentage = count / total;
                      });
                    },
                  );
                  print('Video muvaffaqiyatli yuklandi: $videoPath');
                } catch (e) {
                  print('Xato yuz berdi: $e');
                }
              },
              child: const Text(
                "Download",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
