import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipRect(
          child: Banner(
            message: "xabar chiqarish uchun",
            location: BannerLocation.topEnd,
            child: Container(
              width: double.infinity,
              height: 300,
              color: Colors.yellow,
            ),
          ),
        ),
      ),
    );
  }
}
