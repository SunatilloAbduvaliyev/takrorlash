import 'package:flutter/material.dart';
import 'package:takrorlash/screen/clip_widges/clip_path_widget.dart';

class ClipRectWidget extends StatefulWidget {
  const ClipRectWidget({super.key});

  @override
  State<ClipRectWidget> createState() => _ClipRectWidgetState();
}

class _ClipRectWidgetState extends State<ClipRectWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipRect(
          clipper: MyClipper(),
          child: Container(
            width: double.infinity,
            height: 3000,
            color: Colors.orangeAccent,
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Rect>{
  @override
  Rect getClip(Size size) {
    return const Rect.fromLTWH(0, 0, 80, 80);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}
