
import 'package:move_mates_android/features/user_auth/data/models/user_auth_model.dart';

import '../../domain/enteties/user_sign_up_entity.dart';

class UserSignUpModel extends UserSignUpEntity implements UserAuthModel{
  const UserSignUpModel({
    required super.name,
    required super.email,
    required super.phone,
    required super.birthDate,
    required super.role,
  });

factory  UserSignUpModel.fromJson(Map json) {
    return UserSignUpModel(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      birthDate: json['birthDate'],
      role: json['role'],
    );
  }

  @override
  Map toJson() {
  return {
    'name': name,
    'email': email,
    'phone': phone,
    'birthDate': birthDate,
    'role': role
  };
  }
}
