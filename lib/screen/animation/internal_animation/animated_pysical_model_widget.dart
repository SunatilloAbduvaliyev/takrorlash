import 'package:flutter/material.dart';
import 'package:takrorlash/screen/global_appbar.dart';

class AnimatedPhysicalModelDemo extends StatefulWidget {
  const AnimatedPhysicalModelDemo({super.key});

  @override
  State<AnimatedPhysicalModelDemo> createState() => _AnimatedPhysicalModelDemoState();
}

class _AnimatedPhysicalModelDemoState extends State<AnimatedPhysicalModelDemo> {
  bool isAnimated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar(title: "AnimatedPysicalModel",),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isAnimated = !isAnimated;
            });
          },
          child: AnimatedPhysicalModel(
            duration: const Duration(seconds: 1),
            shape: BoxShape.rectangle,
            elevation: isAnimated ? 10 : 0,
            color: isAnimated ? Colors.green : Colors.red,
            shadowColor: Colors.black,
            borderRadius: isAnimated ? BorderRadius.circular(50) : BorderRadius.circular(0),
            child: const SizedBox(
              height: 100,
              width: 100,
              child: Center(
                child: Text(
                  'Tap Me',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}