import 'package:flutter/material.dart';

class AnimatedAlignWidget extends StatefulWidget {
  const AnimatedAlignWidget({super.key});

  @override
  State<AnimatedAlignWidget> createState() => _AnimatedAlignWidgetState();
}

class _AnimatedAlignWidgetState extends State<AnimatedAlignWidget> {
  bool animated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.amber,
          width: double.infinity,
          height: 300,
          child: GestureDetector(
            onTap: () {
              setState(() {
                animated = !animated;
              });
            },
            child: AnimatedAlign(
              alignment: animated ? Alignment.topRight : Alignment.bottomLeft,
              duration: const Duration(seconds: 1),
              curve: Curves.bounceInOut,
              child: const FlutterLogo(size: 50.0,),
            ),
          ),
        ),
      ),
    );
  }
}
