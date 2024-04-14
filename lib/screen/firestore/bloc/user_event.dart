import 'package:image_picker/image_picker.dart';

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
  final String imagePath;
  DeleteUserEvent({required this.dbId,required this.imagePath});
}

class UserImageFromGallery extends UserEvent{}
class UserImageFromCamera extends UserEvent{}
class UserUpLoadImageEvent extends UserEvent{
  final XFile pickedFile;
  final String storagePath;
  UserUpLoadImageEvent({required this.pickedFile, required this.storagePath});
}
