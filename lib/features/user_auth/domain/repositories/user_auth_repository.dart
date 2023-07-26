import 'package:dartz/dartz.dart';
import 'package:move_mates_android/features/user_auth/domain/enteties/user_auth_entity.dart';
import 'package:move_mates_android/features/user_auth/domain/usecases/user_sign_out.dart';
import 'package:move_mates_android/features/user_auth/domain/usecases/user_sign_up.dart';

import '../../../../core/error/user_auth_failure.dart';
import '../usecases/user_sign_in.dart';

abstract class UserAuthRepository{
Future<Either<Failure, UserAuthEntity>> signIn(SignInParam params);
Future<Either<Failure, UserAuthEntity>> signUp(SignUpParam params);
Future<Either<Failure, void>> signOut(SignOutParam params);
}