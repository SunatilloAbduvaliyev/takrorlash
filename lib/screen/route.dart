import 'package:flutter/material.dart';
import 'package:takrorlash/screen/auth/profile_screen.dart';

import 'auth/login/login_screen.dart';
import 'auth/register/register_screen.dart';
import 'firestore/add_update_user/add_update_user.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.loginRoute:
        return navigate(const LoginScreen());

      case RouteNames.registerRoute:
        return navigate(const RegisterScreen());

      case RouteNames.tabRoute:
        return navigate(const ProfileScreen());

      case RouteNames.addUpdateUserScreen:
        return navigate(const AddUpdateUserScreen());
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
  static const String addUpdateUserScreen = "/add_user_screen";
}