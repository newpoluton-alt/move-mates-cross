import 'package:dartz/dartz.dart';
import 'package:move_mates_android/core/usescases/usecase.dart';
import 'package:move_mates_android/features/user_auth/domain/repositories/user_auth_repository.dart';

import '../../../../core/enum/user_role_enum.dart';
import '../../../../core/error/user_auth_failure.dart';
import '../enteties/user_auth_entity.dart';

class UserSignUpCase implements UseCase<UserAuthEntity, SignUpParam> {
  final UserAuthRepository userAuthRepository;

  UserSignUpCase({required this.userAuthRepository});

  @override
  Future<Either<Failure, UserAuthEntity>> call(SignUpParam params) async {
    return await userAuthRepository.signUp(params);
  }
}

class SignUpParam extends UserAuthParam {
  final String name;
  final String email;
  final String password;
  final String phone;
  final String birthDate;
  final UserRoleEnum role;

  SignUpParam(
      {required this.name,
      required this.email,
      required this.password,
      required this.phone,
      required this.birthDate,
      required this.role});

  @override
  List<Object?> get props => [
        name,
        email,
        password,
        phone,
        birthDate,
        role,
      ];

  @override
  Map toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'birthDate': birthDate,
    };
  }
}
