import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takrorlash/screen/firestore/bloc/user_event.dart';
import 'package:takrorlash/screen/firestore/bloc/user_state.dart';

import '../../../data/model/user_model.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(InitialUserState()) {
    on<InsertUserEvent>(_insertUser);
    on<GetAllUsersEvent>(_getAllUsers);
    on<UpdateUserEvent>(_updateUser);
    on<DeleteUserEvent>(_deleteUser);
  }

  _insertUser(
      InsertUserEvent event, Emitter<UserState> emit) async {
    emit(LoadingUserState());
    try {
      var collectionReference = await FirebaseFirestore.instance
          .collection("users")
          .add(event.userModel.toJson());
      await FirebaseFirestore.instance
          .collection('users')
          .doc(collectionReference.id)
          .update(
        {'_id': collectionReference.id},
      );
      debugPrint("------------------------------------------------chaqirlish joyi");
        add(GetAllUsersEvent());
    } catch (e) {
     throw Exception(e);
    }
  }

  Future<void
  > _getAllUsers(
      GetAllUsersEvent event, Emitter<UserState> emit
      ) async {
    debugPrint("------------------------------------------------working");
    try {
      debugPrint("------------------------------------------------working try");
      final querySnapshot = await FirebaseFirestore.instance.collection('users').get();
      final users = querySnapshot.docs.map((doc) => UserModel.fromJson(doc.data())).toList();
      emit(GetAllUserState(userModel: users));
    } catch (e) {
      emit(ErrorUserState(errorMessage: e.toString())); // More specific error message
    }
  }


  Future<void> _updateUser(
      UpdateUserEvent event, Emitter<UserState> emit
      )async{
    try{
      emit(LoadingUserState());
      await FirebaseFirestore.instance.collection('users').doc(event.userModel.dbId).update(event.userModel.toUpdateJson());
      add(GetAllUsersEvent());
    }catch (e) {
      emit(ErrorUserState(errorMessage: e.toString()));
    }
  }

  Future<void> _deleteUser(
      DeleteUserEvent event, Emitter<UserState> emit
      )async{
    try{
      emit(LoadingUserState());
      await FirebaseFirestore.instance.collection("users").doc(event.dbId).delete();
      add(GetAllUsersEvent());
    }catch (e) {
      emit(ErrorUserState(errorMessage: e.toString()));
    }
  }

}



