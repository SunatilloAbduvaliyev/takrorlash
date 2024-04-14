import '../../../data/model/user_model.dart';

abstract class UserEvent{}

class GetAllUsersEvent extends UserEvent{}

class InsertUserEvent extends UserEvent{
  final UserModel userModel;
  InsertUserEvent({required this.userModel});
}

class UpdateUserEvent extends UserEvent{
  final UserModel userModel;
  UpdateUserEvent({required this.userModel});
}

class DeleteUserEvent extends UserEvent{
  final String dbId;
  DeleteUserEvent({required this.dbId});
}