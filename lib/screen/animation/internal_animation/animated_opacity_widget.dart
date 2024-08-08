import 'package:flutter/material.dart';
import 'package:takrorlash/screen/global_appbar.dart';

class AnimatedOpacityWidget extends StatefulWidget {
  const AnimatedOpacityWidget({super.key});

  @override
  State<AnimatedOpacityWidget> createState() => _AnimatedOpacityWidgetState();
}

class _AnimatedOpacityWidgetState extends State<AnimatedOpacityWidget> {
  bool isAnimated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar(
        title: "AnimatedOpacity",
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isAnimated = !isAnimated;
            });
          },
          child: AnimatedOpacity(
            duration: const Duration(seconds: 1),
            curve: Curves.decelerate,
            opacity: isAnimated ? 0 : 1,
            child: Container(
              width: 300,
              height: 300,
              decoration: const BoxDecoration(
                color: Colors.amber,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
