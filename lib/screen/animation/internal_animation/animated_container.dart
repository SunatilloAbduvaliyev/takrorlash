import 'package:flutter/material.dart';
import 'package:takrorlash/screen/global_appbar.dart';

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({super.key});

  @override
  State<AnimatedContainerWidget> createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  bool isAnimated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar(title: "AnimatedContainer",),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isAnimated = !isAnimated;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(seconds: 2),
            curve: Curves.linearToEaseOut,
            width: isAnimated ? 100 : 300,
            height: isAnimated ? 300 : 100,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: isAnimated ? BorderRadius.circular(20) : null,
            ),
          ),
        ),
      ),
    );
  }
}
