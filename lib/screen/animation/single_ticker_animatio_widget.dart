import 'package:flutter/material.dart';
import 'package:takrorlash/screen/global_appbar.dart';

class SingleTickerAnimationWidget extends StatefulWidget {
  const SingleTickerAnimationWidget({super.key});

  @override
  State<SingleTickerAnimationWidget> createState() =>
      _SingleTickerAnimationWidgetState();
}

class _SingleTickerAnimationWidgetState
    extends State<SingleTickerAnimationWidget>
    with SingleTickerProviderStateMixin {
  late  AnimationController _animationController;
  late  Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _progressAnimation = Tween<double>(
      begin: 0,
      end: 300,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppbar(
        title: "SingleTicker",
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (BuildContext context, child)=>Container(
            width: _progressAnimation.value,
            height: 50,
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}
