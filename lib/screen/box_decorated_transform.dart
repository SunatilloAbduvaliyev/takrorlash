import 'package:flutter/material.dart';

class BoxDecoratedTransform extends StatefulWidget {
  const BoxDecoratedTransform({super.key});

  @override
  State<BoxDecoratedTransform> createState() => _BoxDecoratedTransformState();
}

class _BoxDecoratedTransformState extends State<BoxDecoratedTransform>
    with TickerProviderStateMixin {
  final DecorationTween decorationTween = DecorationTween(
    begin: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          style: BorderStyle.none,
        ),
        borderRadius: BorderRadius.circular(60),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            spreadRadius: 3,
            offset: Offset(0, 6),
          )
        ]),
    end: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.zero,
      border: Border.all(
        style: BorderStyle.none,
      ),
    ),
  );
  late final AnimationController _animationController =
      AnimationController(vsync: this, duration: const Duration(seconds: 3))
        ..repeat(reverse: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: DecoratedBoxTransition(
          decoration: decorationTween.animate(_animationController),
          child: Container(
            width: 300,
            height: 300,
            padding: const EdgeInsets.all(10),
            child: const Center(
              child: FlutterLogo(
                size: 150,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
