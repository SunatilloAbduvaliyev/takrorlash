import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takrorlash/cubit/user_cubit.dart';
import 'package:takrorlash/cubit/user_state.dart';
import 'package:takrorlash/data/forms_status.dart';
import 'package:takrorlash/data/user_model.dart';
import 'package:takrorlash/video_download_screen.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (_) => UserCubit()..getAllUsers())],
      child: const MaterialApp(
        home: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "User qo'shing",
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 20, color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const VideoDownloadScreen(),
                ),
              );
            },
            style: IconButton.styleFrom(
              backgroundColor: Colors.amber.withOpacity(0.5),
            ),
            icon: const Icon(
              Icons.navigate_next_outlined,
              size: 24,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              context.read<UserCubit>().insertUser(
                    userModel: UserModel(name: "Kimdur", uid: 'first_user'),
                  );
            },
            style: IconButton.styleFrom(
              backgroundColor: Colors.blueAccent.withOpacity(0.5),
            ),
            icon: const Icon(
              Icons.add,
              size: 24,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (BuildContext context, UserState state) {
          if (state.status == FormsStatus.loading) {
            return const Center(
              child: CupertinoActivityIndicator(
                color: Colors.black,
              ),
            );
          }
          if (state.status == FormsStatus.error) {
            return Center(
              child: Text(
                state.errorMessage,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    context
                        .read<UserCubit>()
                        .deleteUser(uid: state.users[index].uid);
                  },
                  title: Text(
                    state.users[index].name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(
                    state.users[index].uid,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
