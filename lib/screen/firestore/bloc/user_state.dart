import '../../../data/model/user_model.dart';

abstract class UserState {}

class GetAllUserState extends UserState {
  List<UserModel> userModel;

  GetAllUserState({required this.userModel});
}

class InitialUserState extends UserState {}

class LoadingUserState extends UserState {}

class ErrorUserState extends UserState {
  final String errorMessage;

  ErrorUserState({required this.errorMessage});
}
