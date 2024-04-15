import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takrorlash/screen/home/home_screen.dart';
import 'package:takrorlash/screen/route.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:const Size(375, 812),
      builder: (context, _ ){
        ScreenUtil.init(context);
        return const MaterialApp(
          home: HomeScreen(),
          onGenerateRoute: AppRoute.generateRoute,
          initialRoute: RouteName.homeScreen,
        );
      },
    );
  }
}
