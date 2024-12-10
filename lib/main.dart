import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const YouTubeVideoScreen(videoUrl: "https://youtu.be/AFMAUAySU7s"),
    );
  }
}

class YouTubeVideoScreen extends StatefulWidget {
  final String videoUrl;

  const YouTubeVideoScreen({Key? key, required this.videoUrl}) : super(key: key);

  @override
  State<YouTubeVideoScreen> createState() => _YouTubeVideoScreenState();
}

class _YouTubeVideoScreenState extends State<YouTubeVideoScreen> {
  late YoutubePlayerController _controller;
  bool _isPlayerReady = true;

  @override
  void initState() {
    super.initState();
    String videoId = YoutubePlayer.convertUrlToId(widget.videoUrl) ?? "";
    print("___________________________________________________________ Video ID: $videoId");


    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

    // `YoutubePlayerController` tayyor bo'lgach, yuklanishni yakunlash
    _controller.addListener(() {
      if (_controller.value.isReady && !_isPlayerReady) {
        setState(() {
          _isPlayerReady = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("YouTube Video Player"),
      ),
      body: Center(
        child: _isPlayerReady
            ? YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
        )
            : const CircularProgressIndicator(), // Yuklash indikator
      ),
    );
  }
}
