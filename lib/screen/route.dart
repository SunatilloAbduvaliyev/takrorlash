import 'package:flutter/material.dart';

import 'home/home_screen.dart';

class AppRoute{
  static Route generateRoute(RouteSettings settings){
    switch(settings.name){
      case RouteName.homeScreen:
        return navigate(const HomeScreen());

      default:
        return navigate(
          const Scaffold(
            body: Center(
              child: Text('Not Fount'),
            ),
          )
        );
    }
  }
 static navigate(Widget widget)=>MaterialPageRoute(builder: (context)=>widget);
}

class RouteName{
  static const String homeScreen = '/';
}