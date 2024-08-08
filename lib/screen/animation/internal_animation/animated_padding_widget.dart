import 'package:flutter/material.dart';
import 'package:takrorlash/screen/global_appbar.dart';

class AnimatedPaddingWidget extends StatefulWidget {
  const AnimatedPaddingWidget({super.key});

  @override
  State<AnimatedPaddingWidget> createState() => _AnimatedPaddingWidgetState();
}

class _AnimatedPaddingWidgetState extends State<AnimatedPaddingWidget> {
  bool isAnimated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar(
        title: "AnimatedPadding",
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isAnimated = !isAnimated;
            });
          },
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.amber
            ),
            width: 300,
            height: 300,
            child: AnimatedPadding(
              duration: const Duration(seconds: 1),
              curve: Curves.bounceInOut,
              padding: EdgeInsets.all(isAnimated ? 50 : 20),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.red
                ),
                width: 300,
                height: 300,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
