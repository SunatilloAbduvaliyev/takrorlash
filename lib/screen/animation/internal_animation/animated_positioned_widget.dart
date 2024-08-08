import 'package:flutter/material.dart';
import 'package:takrorlash/screen/global_appbar.dart';

class AnimatedPositionedDemo extends StatefulWidget {
  const AnimatedPositionedDemo({super.key});

  @override
  State<AnimatedPositionedDemo> createState() => _AnimatedPositionedDemoState();
}

class _AnimatedPositionedDemoState extends State<AnimatedPositionedDemo> {
  bool isAnimated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar(title: "AnimatedPositioned",),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
              width: isAnimated ? 200.0 : 50.0,
              height: isAnimated ? 50.0 : 200.0,
              top: isAnimated ? 50.0 : 150.0,
              duration: const Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isAnimated = !isAnimated;
                  });
                },
                child: Container(
                  color: Colors.amber,
                  child: const Center(
                    child: Text(
                      'Tap me',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}