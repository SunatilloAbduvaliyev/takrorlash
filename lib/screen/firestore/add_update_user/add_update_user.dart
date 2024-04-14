import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takrorlash/data/model/user_model.dart';
import 'package:takrorlash/screen/firestore/bloc/user_event.dart';
import 'package:takrorlash/screen/firestore/bloc/user_state.dart';
import 'package:takrorlash/utils/style/app_text_style.dart';

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
              if (state is LoadingUserState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is InitialUserState) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if(state.imageUrl.isNotEmpty)
                      Image.network(state.imageUrl),
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: ageController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Age',
                      ),
                    ),
                    const SizedBox(height: 100),
                    ElevatedButton(
                      onPressed: () {
                        context.read<UserBloc>().add(
                              InsertUserEvent(
                                userModel: UserModel(
                                  name: nameController.text,
                                  age: ageController.text,
                                  dbId: '',
                                  userId: '',
                                  image: '',
                                ),
                              ),
                            );
                        context.read<UserBloc>().add(GetAllUsersEvent());
                      },
                      child: const Text('Saqlash'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<UserBloc>().add(
                          UserImageFromCamera()
                        );
                        context.read<UserBloc>().add(GetAllUsersEvent());
                      },
                      child: const Text('Camera'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<UserBloc>().add(
                          UserImageFromGallery()
                        );
                        context.read<UserBloc>().add(GetAllUsersEvent());
                      },
                      child: const Text('Galeriya'),
                    ),
                  ],
                );
              } else if (state is GetAllUserState) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      state.userModel[0].name,
                      style: AppTextStyle.interSemiBold,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          context.read<UserBloc>().add(
                                UpdateUserEvent(
                                  userModel: UserModel(
                                      dbId: state.userModel[0].dbId,
                                      name: 'Update name',
                                      age: 'Update age',
                                      userId: '',
                                      image: ''),
                                ),
                              );
                        },
                        child: const Text('Update'),),
                    const SizedBox(height: 20,),

                    ElevatedButton(
                      onPressed: () {
                        context.read<UserBloc>().add(
                          DeleteUserEvent(dbId: state.userModel[0].dbId)
                        );
                      },
                      child: const Text('Delete'),),
                  ],
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Qayta yuklash'),
                    ),
                  ],
                );
              }
            },
            listenWhen:(provoisState, state){
              return provoisState != state;
            },
            listener: (BuildContext context, Object? state) {
              debugPrint(
                  '--------------------------state Type ${state.runtimeType}');
              if (state is ErrorUserState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    state.errorMessage,
                    style: AppTextStyle.interMedium.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.green,
                ));
              }
              if (state is GetAllUserState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    "Ma'lumot saqlandi",
                    style: AppTextStyle.interMedium.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.green,
                ));
              }

            },
          ),
        ),
      ),
    );
  }
}
