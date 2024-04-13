import 'package:flutter/material.dart';

import 'auth/login/login_screen.dart';
import 'auth/register/register_screen.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.loginRoute:
        return navigate(const LoginScreen());

      case RouteNames.registerRoute:
        return navigate(const RegisterScreen());

      default:
        return navigate(
          const Scaffold(
            body: Center(
              child: Text("This kind of rout does not exist!"),
            ),
          ),
        );
    }
  }

  static navigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}

class RouteNames {
  static const String splashScreen = "/";
  static const String tabRoute = "/tab_route";
  static const String loginRoute = "/login_route";
  static const String registerRoute = "/register_route";
}