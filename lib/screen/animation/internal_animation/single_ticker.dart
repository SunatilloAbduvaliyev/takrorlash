import 'package:flutter/material.dart';
import 'package:takrorlash/screen/global_appbar.dart';

class SingleTickerExample extends StatefulWidget {
  const SingleTickerExample({super.key});

  @override
  State<SingleTickerExample> createState() => _SingleTickerExampleState();
}

class _SingleTickerExampleState extends State<SingleTickerExample>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<AlignmentGeometry> _alignmentTransition;
  late final Animation<double> _rotationTransitions;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _alignmentTransition = Tween<AlignmentGeometry>(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linearToEaseOut,
      ),
    );
    _rotationTransitions = Tween<double>(
      begin: 0,
      end: 7.25,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linearToEaseOut,
      ),
    );
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar(
        title: "Animation",
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: AlignTransition(
          alignment: _alignmentTransition,
          child: RotationTransition(
            turns: _rotationTransitions,
            child: Container(
              width: 50,
              height: 50,
              color: Colors.amber,
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
