import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:takrorlash/screen/firestore/bloc/user_event.dart';
import 'package:takrorlash/screen/firestore/bloc/user_state.dart';

import '../../../data/model/user_model.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(InitialUserState()) {
    on<InsertUserEvent>(_insertUser);
    on<GetAllUsersEvent>(_getAllUsers);
    on<UpdateUserEvent>(_updateUser);
    on<DeleteUserEvent>(_deleteUser);
    on<UserImageFromCamera>(getImageFromCamera);
    on<UserImageFromGallery>(getImageFromGallery);
    on<UserUpLoadImageEvent>(uploadImage);
  }

  String imageUrl = '';
  String storagePath = '';
  ImagePicker picker = ImagePicker();
  XFile? image;

  _insertUser(InsertUserEvent event, Emitter<UserState> emit) async {
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
      debugPrint(
          "------------------------------------------------chaqirlish joyi");
      add(GetAllUsersEvent());
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> _getAllUsers(
      GetAllUsersEvent event, Emitter<UserState> emit) async {
    debugPrint("------------------------------------------------working");
    try {
      debugPrint("------------------------------------------------working try");
      final querySnapshot =
          await FirebaseFirestore.instance.collection('users').get();
      final users = querySnapshot.docs
          .map((doc) => UserModel.fromJson(doc.data()))
          .toList();
      emit(GetAllUserState(userModel: users));
    } catch (e) {
      emit(ErrorUserState(
          errorMessage: e.toString())); // More specific error message
    }
  }

  Future<void> _updateUser(
      UpdateUserEvent event, Emitter<UserState> emit) async {
    try {
      emit(LoadingUserState());
      await FirebaseFirestore.instance
          .collection('users')
          .doc(event.userModel.dbId)
          .update(event.userModel.toUpdateJson());
      add(GetAllUsersEvent());
    } catch (e) {
      emit(ErrorUserState(errorMessage: e.toString()));
    }
  }

  Future<void> _deleteUser(
      DeleteUserEvent event, Emitter<UserState> emit) async {
    try {
      emit(LoadingUserState());
      await FirebaseStorage.instance.ref().child(event.imagePath).delete();
      await FirebaseFirestore.instance
          .collection("users")
          .doc(event.dbId)
          .delete();
      add(GetAllUsersEvent());
    } catch (e) {
      emit(ErrorUserState(errorMessage: e.toString()));
      throw Exception(e);
    }
  }

  ///------------------image
  Future<void> getImageFromCamera(
      UserImageFromCamera event, Emitter<UserState> emit) async {
    emit(LoadingUserState());
    image = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 200,
      maxWidth: 200,
    );
    storagePath = "files/images/${image!.name}";
    add(UserUpLoadImageEvent(pickedFile: image!, storagePath: storagePath));
  }

  Future<void> getImageFromGallery(
      UserImageFromGallery event, Emitter<UserState> emit) async {
    emit(LoadingUserState());
    XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 200,
      maxWidth: 200,
    );
    storagePath = "files/images/${image!.name}";
    add(UserUpLoadImageEvent(pickedFile: image, storagePath: storagePath));
  }

  Future<void> uploadImage(
      UserUpLoadImageEvent event, Emitter<UserState> emit
      ) async {
    try {
      var ref = FirebaseStorage.instance.ref().child(storagePath);
      File file = File(event.pickedFile.path);
      var uploadTask = await ref.putFile(file);
      String downloadUrl = await uploadTask.ref.getDownloadURL();
      emit(InitialUserState(imageUrl: downloadUrl));
    } on FirebaseException catch (error) {
      throw Exception(error.toString());
    }
  }}
