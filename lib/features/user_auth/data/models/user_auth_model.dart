import 'package:move_mates_android/features/user_auth/domain/enteties/user_auth_entity.dart';

abstract class UserAuthModel extends  UserAuthEntity {
  Map toJson();
}