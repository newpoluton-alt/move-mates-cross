import 'package:dartz/dartz.dart';
import 'package:move_mates_android/core/usescases/usecase.dart';
import 'package:move_mates_android/features/user_auth/domain/enteties/user_auth_entity.dart';

import '../../../../core/error/failure.dart';
import '../repositories/user_auth_repository.dart';

class UserSignInCase implements UseCase<UserAuthEntity, SignInParam> {
  final UserAuthRepository userAuthRepository;

  UserSignInCase({required this.userAuthRepository});

  @override
  Future<Either<Failure, UserAuthEntity>> call(SignInParam params) async {
    return await userAuthRepository.signIn(params);
  }
}

class SignInParam extends Param{
  final String email;
  final String password;

  SignInParam({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];

  @override
  Map toJson() {
  return {
    'username': email,
    'password': password,
  };
  }
}
