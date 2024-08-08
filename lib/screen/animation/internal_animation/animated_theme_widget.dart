import 'package:flutter/material.dart';
import 'package:takrorlash/screen/global_appbar.dart';

class AnimatedThemeExample extends StatefulWidget {
  const AnimatedThemeExample({super.key});

  @override
  State<AnimatedThemeExample> createState() => _AnimatedThemeExampleState();
}

class _AnimatedThemeExampleState extends State<AnimatedThemeExample> {
  bool _isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      data: _isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubicEmphasized,
      child: Scaffold(
        appBar:  GlobalAppbar(
          title: "AnimatedTheme",
          color: _isDarkTheme?Colors.white:Colors.black,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Tap the button to toggle the theme',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isDarkTheme = !_isDarkTheme;
                  });
                },
                child: Text(
                  _isDarkTheme ? 'Switch to Light Theme' : 'Switch to Dark Theme',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}