import 'package:flutter/material.dart';

class AnimatedCrossFadeWidget extends StatefulWidget {
  const AnimatedCrossFadeWidget({super.key});

  @override
  State<AnimatedCrossFadeWidget> createState() =>
      _AnimatedCrossFadeWidgetState();
}

class _AnimatedCrossFadeWidgetState extends State<AnimatedCrossFadeWidget> {
  bool isAnimated = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                isAnimated = !isAnimated;
              });
            },
            child: const Text("Almashtirish"),
          ),
          const SizedBox(
            height: 100,
          ),
          AnimatedCrossFade(
            firstChild: Container(
              width: double.infinity,
              height: 200,
              color: Colors.red,
            ),
            secondChild: Container(
              width: double.infinity,
              height: 200,
              color: Colors.yellow,
            ),
            crossFadeState: isAnimated ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: const Duration(seconds: 1),
          ),
        ],
      ),
    );
  }
}
