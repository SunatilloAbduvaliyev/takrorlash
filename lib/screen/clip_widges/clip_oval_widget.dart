import 'package:flutter/material.dart';

class ClipOvalWidget extends StatefulWidget {
  const ClipOvalWidget({super.key});

  @override
  State<ClipOvalWidget> createState() => _ClipOvalWidgetState();
}

class _ClipOvalWidgetState extends State<ClipOvalWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:  ClipOval(
          clipper: CustomClip(),
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}

class CustomClip extends CustomClipper<Rect>{
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, size.width -60, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}
