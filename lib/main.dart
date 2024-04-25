import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takrorlash/cubit/navigation_button_cubit.dart';
import 'package:takrorlash/screen/hello_scre.dart';
import 'package:takrorlash/screen/home/home_screen.dart';

import 'data/repository/file_repository.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavigationButtonCubit(),
        ),
        RepositoryProvider(create: (_) => FileRepository()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HelloScreen(),
    );
  }
}
