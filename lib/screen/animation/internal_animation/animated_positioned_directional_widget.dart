import 'package:flutter/material.dart';
import 'package:takrorlash/screen/global_appbar.dart';

class AnimatedPositionedDirectionalExample extends StatefulWidget {
  const AnimatedPositionedDirectionalExample({super.key});

  @override
  State<AnimatedPositionedDirectionalExample> createState() =>
      _AnimatedPositionedDirectionalExampleState();
}

class _AnimatedPositionedDirectionalExampleState
    extends State<AnimatedPositionedDirectionalExample> {
  bool _isMoved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar(title: "AnimatedPositionedDirectional",),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Stack(
          children: <Widget>[
            Container(
              width: 300,
              height: 300,
              color: Colors.red,
            ),
            AnimatedPositionedDirectional(
              start: _isMoved ? 200 : 50,
              top: 50,
              width: 100,
              height: 100,
              duration: const Duration(seconds: 3),
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    _isMoved = !_isMoved;
                  });
                },
                child: Container(
                  color: Colors.amber,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}