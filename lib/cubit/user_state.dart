import 'package:takrorlash/data/forms_status.dart';
import 'package:takrorlash/data/user_model.dart';

class UserState {
  final String errorMessage;
  final FormsStatus status;
  final UserModel userModel;
  final List<UserModel> users;

  UserState({
    required this.errorMessage,
    required this.status,
    required this.userModel,
    required this.users,
  });

  UserState copyWith({
    String? errorMessage,
    FormsStatus? status,
    UserModel? userModel,
    List<UserModel>? users,
  }) =>
      UserState(
        errorMessage: errorMessage ?? this.errorMessage,
        status: status ?? this.status,
        userModel: userModel ?? this.userModel,
        users: users ?? this.users
      );

  static UserState initialValue() => UserState(
        errorMessage: '',
        status: FormsStatus.pure,
        userModel: UserModel.initialValue(),
        users: [],
      );
}
