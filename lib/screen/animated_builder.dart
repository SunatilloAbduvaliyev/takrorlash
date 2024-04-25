import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedBuilderWidget extends StatefulWidget {
  const AnimatedBuilderWidget({super.key});

  @override
  State<AnimatedBuilderWidget> createState() => _AnimatedBuilderWidgetState();
}

class _AnimatedBuilderWidgetState extends State<AnimatedBuilderWidget> with TickerProviderStateMixin {
  bool animated = false;
  late final AnimationController animationController = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat();
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: animationController,
          child: const FlutterLogo(size: 100,),
          builder: (context, _) {
            return Transform.rotate(angle: animationController.value * 2.0 * pi,);
          },
        ),
      ),
    );
  }
}
