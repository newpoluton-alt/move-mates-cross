import 'package:dartz/dartz.dart';
import 'package:move_mates_android/core/error/user_auth_failure.dart';
import 'package:move_mates_android/core/usescases/usecase.dart';
import 'package:move_mates_android/features/user_auth/domain/enteties/user_auth_entity.dart';

import '../repositories/user_auth_repository.dart';

class UserSignInUseCase implements UseCase<UserAuthEntity, SignInParam> {
  final UserAuthRepository userAuthRepository;

  UserSignInUseCase({required this.userAuthRepository});

  @override
  Future<Either<Failure, UserAuthEntity>> call(SignInParam params) async {
    return await userAuthRepository.signIn(params);
  }
}

class SignInParam extends UserAuthParam{
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
