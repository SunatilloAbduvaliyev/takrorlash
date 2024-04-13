import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takrorlash/data/model/user_model.dart';
import 'package:takrorlash/screen/firestore/bloc/user_event.dart';
import 'package:takrorlash/screen/firestore/bloc/user_state.dart';

import '../bloc/user_bloc.dart';

class AddUpdateUserScreen extends StatefulWidget {
  const AddUpdateUserScreen({super.key});

  @override
  State<AddUpdateUserScreen> createState() => _AddUpdateUserScreenState();
}

class _AddUpdateUserScreenState extends State<AddUpdateUserScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 30,
        ),
        child: BlocProvider(
          create: (_) => UserBloc(),
          child: BlocConsumer<UserBloc, UserState>(
            builder: (BuildContext context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Age',
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context.read<UserBloc>().add(
                              InsertUserEvent(
                                userModel: UserModel(
                                  name: nameController.text,
                                  age: ageController.text,
                                  image: '',
                                ),
                              ),
                            );
                      },
                      child: const Text('Saqlash'))
                ],
              );
            },
            listener: (BuildContext context, Object? state) {
              if (state is ErrorUserState) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(state.errorMessage),
                      );
                    });
              }
            },
          ),
        ),
      ),
    );
  }
}
