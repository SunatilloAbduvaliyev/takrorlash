import 'dart:ui';

import 'package:flutter/material.dart';

class BackDropFilterWidget extends StatefulWidget {
  const BackDropFilterWidget({super.key});

  @override
  State<BackDropFilterWidget> createState() => _BackDropFilterWidgetState();
}

class _BackDropFilterWidgetState extends State<BackDropFilterWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Text(
            "0" * 1000,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.green,
            ),
          ),
          Center(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 2.0,
                  sigmaY: 2.0,
                ),
                child: Container(
                  alignment: Alignment.center,
                  width: 250,
                  height: 250,
                  child: const Text(
                    "Shaffof",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
