import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:takrorlash/cubit/user_state.dart';
import 'package:takrorlash/data/forms_status.dart';
import '../data/user_model.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState.initialValue());

  // Yangi foydalanuvchi qo'shish
  Future<void> insertUser({required UserModel userModel}) async {
    emit(state.copyWith(status: FormsStatus.loading));
    try {
      //RealTime databesedan link olamiz va oxiriga table nomini yozamiz: users.json
      Uri uri = Uri.parse("https://chat-app-71981-default-rtdb.firebaseio.com/users.json");
      Response response = await post(
        uri,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(userModel.toJson()),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        String uid = responseData['name']; /// Firebase yaratgan `uid`
        userModel = userModel.copyWith(uid:  uid);
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
      Uri uri = Uri.parse("https://chat-app-71981-default-rtdb.firebaseio.com/users/${userModel.uid}.json");

      Response response = await put(
        uri,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(userModel.toJson()),
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
      Uri uri = Uri.parse("https://chat-app-71981-default-rtdb.firebaseio.com/users/$uid.json");

      Response response = await delete(uri);

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
      Uri uri = Uri.parse("https://chat-app-71981-default-rtdb.firebaseio.com/users/$uid.json");

      Response response = await get(uri);

      if (response.statusCode == 200) {
        final Map<String, dynamic> userData = jsonDecode(response.body);
        UserModel userModel = UserModel.fromJson(userData);

        emit(state.copyWith(status: FormsStatus.success, userModel: userModel));
      } else {
        emit(state.copyWith(status: FormsStatus.error, errorMessage: response.statusCode.toString()));
      }
    } catch (error) {
      emit(state.copyWith(status: FormsStatus.error, errorMessage: error.toString()));
    }
  }
  Future<void> getAllUsers() async {
    emit(state.copyWith(status: FormsStatus.loading));
    try {
      Uri uri = Uri.parse("https://chat-app-71981-default-rtdb.firebaseio.com/users.json");

      Response response = await get(uri);

      if (response.statusCode == 200) {
        // Firebase'dan kelgan barcha foydalanuvchilarni olish
        final Map<String, dynamic> data = jsonDecode(response.body);
        List<UserModel> users = [];

        // Har bir foydalanuvchini loop orqali ajratib olish va Listga qo'shish
        data.forEach((key, value) {
          UserModel userModel = UserModel.fromJson(value).copyWith(uid: key);
          users.add(userModel);
        });

        // Statega barcha foydalanuvchilarni yuborish
        emit(state.copyWith(status: FormsStatus.success, users: users));
      } else {
        emit(state.copyWith(status: FormsStatus.error, errorMessage: response.statusCode.toString()));
      }
    } catch (error) {
      emit(state.copyWith(status: FormsStatus.error, errorMessage: error.toString()));
    }
  }
}
