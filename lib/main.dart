import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:takrorlash/screen/auth/auth_view_model/auth_view_model.dart';
import 'package:takrorlash/screen/auth/login/login_screen.dart';
import 'package:takrorlash/screen/firestore/bloc/user_bloc.dart';
import 'package:takrorlash/screen/route.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (_)=>UserBloc()),
        ],
        child: MultiProvider(
            providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
            ],
            child: const MyApp(),
          ),
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
      initialRoute: RouteNames.splashScreen,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}