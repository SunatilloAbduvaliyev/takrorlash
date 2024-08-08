import 'package:flutter/material.dart';
import 'package:takrorlash/screen/global_appbar.dart';

class AnimatedDefaultTextStyleDemo extends StatefulWidget {
  const AnimatedDefaultTextStyleDemo({super.key});

  @override
  State<AnimatedDefaultTextStyleDemo> createState() => _AnimatedDefaultTextStyleDemoState();
}

class _AnimatedDefaultTextStyleDemoState extends State<AnimatedDefaultTextStyleDemo> {
  bool isAnimated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar(title: "AnimatedDefaultTextStyle",),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                  isAnimated = !isAnimated;
                });
              },
              child: AnimatedDefaultTextStyle(
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                style: isAnimated
                    ? const TextStyle(
                  fontSize: 50,
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold,
                )
                    : const TextStyle(
                  fontSize: 30,
                  color: Colors.red,
                  fontWeight: FontWeight.normal,
                ),
                child: const Text('Hello Flutter!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}