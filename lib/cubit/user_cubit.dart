import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takrorlash/cubit/user_state.dart';
import 'package:takrorlash/data/forms_status.dart';
import 'package:takrorlash/data/network/dio_client.dart';
import '../data/user_model.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState.initialValue());
  final dio = DioClient();
  // Yangi foydalanuvchi qo'shish
  Future<void> insertUser({required UserModel userModel}) async {
    emit(state.copyWith(status: FormsStatus.loading));
    try {
      // Firebase RealTime Database ga yangi foydalanuvchi qo'shish
      Response response = await dio.post(
        path: 'users.json',
        data: userModel.toJson(), // Ma'lumotni JSON formatida yuboring
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        String uid = responseData['name']; // Firebase yaratgan `uid`
        userModel = userModel.copyWith(uid: uid);
        updateUser(userModel: userModel);
        debugPrint("insert auto uid firebase __________________________ $uid");
        getAllUsers();
      } else {
        emit(state.copyWith(status: FormsStatus.error, errorMessage: response.statusCode.toString()));
      }
    } catch (error) {
      emit(state.copyWith(status: FormsStatus.error, errorMessage: error.toString()));
    }
  }

  // Foydalanuvchini yangilash
  Future<void> updateUser({required UserModel userModel}) async {
    emit(state.copyWith(status: FormsStatus.loading));
    try {
      Response response = await dio.put(
        path: "users/${userModel.uid}.json",
        data: userModel.toJson(), // Ma'lumotni JSON formatida yuboring
      );

      if (response.statusCode == 200) {
        emit(state.copyWith(status: FormsStatus.success, userModel: userModel));
      } else {
        emit(state.copyWith(status: FormsStatus.error, errorMessage: response.statusCode.toString()));
      }
    } catch (error) {
      emit(state.copyWith(status: FormsStatus.error, errorMessage: error.toString()));
    }
  }

  // Foydalanuvchini o'chirish
  Future<void> deleteUser({required String uid}) async {
    emit(state.copyWith(status: FormsStatus.loading));
    try {
      Response response = await dio.delete(
        path: "users/$uid.json"
      );

      if (response.statusCode == 200) {
        getAllUsers();
      } else {
        emit(state.copyWith(status: FormsStatus.error, errorMessage: response.statusCode.toString()));
      }
    } catch (error) {
      emit(state.copyWith(status: FormsStatus.error, errorMessage: error.toString()));
    }
  }

  // Foydalanuvchini olish
  Future<void> getUser({required String uid}) async {
    emit(state.copyWith(status: FormsStatus.loading));
    try {
      Response response = await dio.get(
        path: "users/$uid.json"
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> userData = response.data;
        UserModel userModel = UserModel.fromJson(userData);

        emit(state.copyWith(status: FormsStatus.success, userModel: userModel));
      } else {
        emit(state.copyWith(status: FormsStatus.error, errorMessage: response.statusCode.toString()));
      }
    } catch (error) {
      emit(state.copyWith(status: FormsStatus.error, errorMessage: error.toString()));
    }
  }

  // Barcha foydalanuvchilarni olish
  Future<void> getAllUsers() async {
    emit(state.copyWith(status: FormsStatus.loading));
    try {
      Response response = await dio.get(
        path: "users.json",
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        List<UserModel> users = [];

        data.forEach((key, value) {
          UserModel userModel = UserModel.fromJson(value);
          users.add(userModel);
        });

        emit(state.copyWith(status: FormsStatus.success, users: users));
      } else {
        emit(state.copyWith(status: FormsStatus.error, errorMessage: response.statusCode.toString()));
      }
    } catch (error) {
      emit(state.copyWith(status: FormsStatus.error, errorMessage: error.toString()));
    }
  }
}
