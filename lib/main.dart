import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takrorlash/data/http_cruds/api_provider/api_provider.dart';
import 'package:takrorlash/screen/home/home_screen.dart';
import 'package:takrorlash/screen/http_user_bloc/book_bloc.dart';
import 'package:takrorlash/screen/http_user_bloc/user_event.dart';
import 'package:takrorlash/screen/route.dart';

void main(){
  HttpApiProvider httpApiProvider = HttpApiProvider();
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>BookBloc(httpApiProvider: httpApiProvider)..add(GetAllBookEvent()))
      ],
      child: const MyApp()));
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
