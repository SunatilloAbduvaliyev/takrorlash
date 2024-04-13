import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takrorlash/screen/firestore/bloc/user_event.dart';
import 'package:takrorlash/screen/firestore/bloc/user_state.dart';

import '../../../data/model/user_model.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(InitialUserState()) {
    on<InsertUserEvent>(_insertUser);
    on<GetAllUsersEvent>(_getAllUsers);

  }

  Future<void> _insertUser(
      InsertUserEvent event, Emitter<UserState> emit) async {
    emit(LoadingUserState());
    try {
      var collectionReference = await FirebaseFirestore.instance
          .collection('users')
          .add(event.userModel.toJson());
      await FirebaseFirestore.instance
          .collection('users')
          .doc(collectionReference.id)
          .update(
        {'_id': collectionReference.id},
      );
        add(GetAllUsersEvent());
    } catch (e) {
     throw Exception(e);
    }
  }

  Stream<void> _getAllUsers(
      GetAllUsersEvent event, Emitter<UserState> emit
      )async*{
    List<UserModel> usersModel =  FirebaseFirestore.instance.collection("users").snapshots().map((event) => event.docs.map((e) => UserModel.fromJson(e.data(),),).toList()) as List<UserModel>;
    emit(GetAllUserState(userModel: usersModel));
  }
}


// Stream<List<CategoryModel>> getAllCategories() =>
//     FirebaseFirestore.instance.collection("categories").snapshots().map(
//           (event) => event.docs
//           .map((e) => CategoryModel.fromJson(e.data()))
//           .toList(),
//     );
//
// Future<void> insertCategory(
//     CategoryModel categoryModel, BuildContext context) async {
//   try {
//     _notify(true);
//     var collectionReference =
//     await FirebaseFirestore.instance.collection('categories').add(
//       categoryModel.toJson(),
//     );
//
//     await FirebaseFirestore.instance
//         .collection('categories')
//         .doc(collectionReference.id)
//         .update(
//       {"id": collectionReference.id},
//     );
//
//     _notify(false);
//   } on FirebaseException catch (error) {
//     if (!context.mounted) return;
//     showSnackBar(context: context, message: error.code);
//   }
// }
//
// Future<void> updateCategory(
//     CategoryModel categoryModel, BuildContext context) async {
//   debugPrint("--------------------------------------------------------id -----------${categoryModel.docId}");
//   try {
//     _notify(true);
//     debugPrint("--------------------------------------------------------id -----------${categoryModel.docId}");
//     await FirebaseFirestore.instance
//         .collection('categories')
//         .doc(categoryModel.docId)
//         .update(
//       categoryModel.toJsonForUpdate(),
//     );
//
//     _notify(false);
//   } on FirebaseException catch (error) {
//     if (!context.mounted) return;
//     showSnackBar(context: context, message: error.code);
//   }
// }
//
// Future<void> deleteCategory(String docId, BuildContext context) async {
//   try {
//     _notify(true);
//
//     await FirebaseFirestore.instance
//         .collection('categories')
//         .doc(docId)
//         .delete();
//
//     _notify(false);
//   } on FirebaseException catch (error) {
//     if (!context.mounted) return;
//     showSnackBar(context: context, message: error.code);
//   }
// }
//
