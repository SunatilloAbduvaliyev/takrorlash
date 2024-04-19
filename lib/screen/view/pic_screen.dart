import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:takrorlash/data/model/letters_model.dart';
import 'package:takrorlash/data/model/pic_word_model.dart';
import 'package:takrorlash/screen/cubit/letter_cubit.dart';
import 'package:takrorlash/screen/cubit/pic_cubit.dart';

class PicScreen extends StatefulWidget {
  const PicScreen({super.key});

  @override
  State<PicScreen> createState() => _PicScreenState();
}

class _PicScreenState extends State<PicScreen>
    with SingleTickerProviderStateMixin {
  bool visible = false;

  late AnimationController globalAnimationController;
  late Animation<Alignment> animationAlign;

  @override
  void initState() {
    globalAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    globalAnimationController.forward();

    animationAlign = TweenSequence<Alignment>(
      [
        TweenSequenceItem<Alignment>(
          tween: Tween(begin: Alignment.center, end: Alignment.centerLeft),
          weight: 40,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween(begin: Alignment.centerLeft, end: Alignment.center),
          weight: 40,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween(begin: Alignment.centerRight, end: Alignment.center),
          weight: 40,
        ),
      ],
    ).animate(
      CurvedAnimation(
        parent: globalAnimationController,
        curve: Curves.decelerate,
      ),
    );


    globalAnimationController.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: BlocBuilder<PicCubit, List<PicWordModel>>(
            builder: (BuildContext context, state) {
              return Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: Row(
                      children: [
                        Expanded(
                          child: Image.asset(
                            state[context.watch<PicCubit>().index].images[0],
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Image.asset(
                            state[context.watch<PicCubit>().index].images[1],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: Row(
                      children: [
                        Expanded(
                          child: Image.asset(
                            state[context.watch<PicCubit>().index].images[2],
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Image.asset(
                            state[context.watch<PicCubit>().index].images[3],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: animationAlign.value,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                            context.watch<LetterCubit>().answer.length,
                            (index) => GestureDetector(
                                  onTap: () {
                                    if (context
                                        .read<LetterCubit>()
                                        .state[context
                                            .read<LetterCubit>()
                                            .index[index]]
                                        .visible) {
                                      visible = false;
                                    } else {
                                      visible = true;
                                    }
                                    context.read<LetterCubit>().oldVisible(
                                        visible,
                                        context
                                            .read<LetterCubit>()
                                            .index[index]);
                                    context.read<LetterCubit>().removeAnswer(
                                        context
                                            .read<LetterCubit>()
                                            .answer[index]);
                                    setState(() {});
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        context
                                            .watch<LetterCubit>()
                                            .answer[index],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  BlocBuilder<LetterCubit, List<LettersModel>>(
                    builder:
                        (BuildContext context, List<LettersModel> state) {
                      return Expanded(
                        child: Wrap(
                          spacing: 2,
                          runSpacing: 5,
                          children: List.generate(
                            state.length,
                            (index) => AnimatedOpacity(
                              duration: const Duration(milliseconds: 700),
                              opacity: state[index].visible ? 0.0 : 1.0,
                              child: GestureDetector(
                                onTap: context.watch<LetterCubit>().isFinished
                                    ? () {
                                  context.read<LetterCubit>().addAnswer(
                                    state[index].letter,
                                    context
                                        .read<PicCubit>()
                                        .state[context
                                        .read<PicCubit>()
                                        .index]
                                        .answer,
                                  );
                                        bool? isError = context
                                            .read<LetterCubit>()
                                            .isError;
                                        if (isError != null &&
                                            isError == false) {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return const AlertDialog(
                                                  title: Text(
                                                    'Xato urinish',
                                                    style: TextStyle(
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                );
                                              });
                                        }else{
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: Column(
                                                    children: [
                                                      Lottie.asset('assets/images/winner.json'),
                                                      const Text(
                                                        "You Win!",

                                                      ),
                                                    ],
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(context);
                                                        },
                                                        child:  const Text(
                                                          "Ok",                                                          ),
                                                    )
                                                  ],
                                                );
                                              });
                                        }

                                      }
                                    : () {
                                        bool? isError = context
                                            .read<LetterCubit>()
                                            .isError;
                                        if (isError != null &&
                                            isError == false) {
                                          globalAnimationController.reverse();
                                        }
                                        if (state[index].visible) {
                                          visible = false;
                                        } else {
                                          visible = true;
                                        }
                                        context
                                            .read<LetterCubit>()
                                            .changeVisible(visible, index);
                                        context.read<LetterCubit>().addAnswer(
                                              state[index].letter,
                                              context
                                                  .read<PicCubit>()
                                                  .state[context
                                                      .read<PicCubit>()
                                                      .index]
                                                  .answer,
                                            );
                                      },
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      state[index].letter,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Visibility(
                          visible: context.read<PicCubit>().index != 0,
                          child: Ink(
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: InkWell(
                              onTap: () {
                                context.read<PicCubit>().dicrementIndex();
                              },
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                child: const Text(
                                  'BACK',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    letterSpacing: 3,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Visibility(
                          visible: context.read<PicCubit>().index < 3,
                          child: Ink(
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: InkWell(
                              onTap: () {
                                context.read<PicCubit>().incrementIndex();
                              },
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                child: const Text(
                                  'NEXT',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    letterSpacing: 3,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
