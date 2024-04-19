import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takrorlash/screen/cubit/letter_cubit.dart';
import 'package:takrorlash/screen/cubit/pic_cubit.dart';
import 'package:takrorlash/screen/view/pic_screen.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (_) => PicCubit(),
    ),
    BlocProvider(
      create: (_) => LetterCubit(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PicScreen(),
    );
  }
}
