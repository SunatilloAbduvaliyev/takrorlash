import 'package:flutter/material.dart';
import 'package:takrorlash/screen/animated_align.dart';

import '../animated_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>   {
  final List<Widget> screens = [
    const AnimatedAlignWidget(),
    const AnimatedBuilderWidget(),
  ];
  final List<String> screenNames = [
    'AnimatedAlignWidget',
    'AnimatedBuilderWidget',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.builder(
            itemCount: screens.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Ink(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => screens[index]));
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        screenNames[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
