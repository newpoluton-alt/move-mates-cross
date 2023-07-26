import 'package:dartz/dartz.dart';
import 'package:move_mates_android/core/error/user_auth_failure.dart';
import 'package:move_mates_android/core/usescases/usecase.dart';
import 'package:move_mates_android/features/user_auth/domain/repositories/user_auth_repository.dart';

class UserSignOutCase implements UseCase<void, SignOutParam> {
  final UserAuthRepository userAuthRepository;

  UserSignOutCase({required this.userAuthRepository});

  @override
  Future<Either<Failure, void>> call(SignOutParam params)async {
    return await userAuthRepository.signOut(params);
  }
}

class SignOutParam extends UserAuthParam {
  SignOutParam();
  @override
  List<Object?> get props => [];

  @override
  Map toJson() {
    return {};
  }
}