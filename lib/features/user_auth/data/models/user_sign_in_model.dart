

import 'package:move_mates_android/features/user_auth/data/models/user_auth_model.dart';

import '../../domain/enteties/user_sign_in_entity.dart';

class UserSignInModel extends UserSignInEntity implements UserAuthModel{
  const UserSignInModel(
      {required super.email,
      required super.id,
      required super.token,
      required super.roles});

  factory UserSignInModel.fromJson (Map json) {
    return UserSignInModel(
        email: json['username'],
        id: json['id'],
        token: json['token'],
        roles: json['roles']);
  }

  @override
  Map toJson() {
    return {
      'username': email,
      'id': id,
      'token': token,
      'roles': roles,
    };
  }
}
