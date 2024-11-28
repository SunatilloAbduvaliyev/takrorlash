import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:takrorlash/screen/home_screen/home_screen.dart';
import 'package:takrorlash/utils/style/app_text_style.dart';

class AppRoute {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.home:
        return navigate(const HomeScreen());

      default:
        return navigate(
          Scaffold(
            body: Center(
              child: Text(
                "Default Screen",
                style: AppTextStyle.bold,
              ),
            ),
          ),
        );
    }
  }

  static navigate(Widget widget) =>
      CupertinoPageRoute(builder: (context) => widget);
}

class RouteName {
  static const String home = '/home';
}
