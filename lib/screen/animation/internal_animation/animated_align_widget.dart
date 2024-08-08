import 'package:flutter/material.dart';
import 'package:takrorlash/screen/global_appbar.dart';

class AnimatedAlignTwoWidget extends StatefulWidget {
  const AnimatedAlignTwoWidget({super.key});

  @override
  State<AnimatedAlignTwoWidget> createState() => _AnimatedAlignTwoWidgetState();
}

class _AnimatedAlignTwoWidgetState extends State<AnimatedAlignTwoWidget> {
  bool isAnimated = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar(title: 'AnimatedAlign',),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isAnimated = !isAnimated; // Toggle the state between true and false
            });
          },
          child: AnimatedAlign(
            duration: const Duration(seconds: 1),
            curve: Curves.bounceInOut,
            alignment: isAnimated ? Alignment.center : Alignment.topCenter,
            child: const FlutterLogo(size: 100,),
          ),
        ),
      ),
    );
  }
}
