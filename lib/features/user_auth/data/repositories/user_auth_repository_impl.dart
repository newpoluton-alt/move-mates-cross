import 'package:dartz/dartz.dart';
import 'package:move_mates_android/core/error/user_auth_failure.dart';
import 'package:move_mates_android/core/network/connection_state.dart';
import 'package:move_mates_android/core/usescases/usecase.dart';
import 'package:move_mates_android/features/user_auth/domain/repositories/user_auth_repository.dart';
import 'package:move_mates_android/features/user_auth/domain/usecases/user_sign_in.dart';

import '../../../../core/error/user_auth_exception.dart';
import '../../domain/usecases/user_sign_up.dart';
import '../data_sources/user_auth_local_data_source.dart';
import '../data_sources/user_auth_remote_data_source.dart';
import '../models/user_auth_model.dart';

class UserAuthRepositoryImpl implements UserAuthRepository {
  final ConnectionState connectionState;
  final UserAuthLocalDataSource userAuthLocalDataSource;
  final UserAuthRemoteDataSource userAuthRemoteDataSource;

  const UserAuthRepositoryImpl({
    required this.connectionState,
    required this.userAuthLocalDataSource,
    required this.userAuthRemoteDataSource,
  });

  @override
  Future<Either<Failure, UserAuthModel>> signIn(SignInParam params) async {
    return await _getUserCredentials(params);
  }

  @override
  Future<Either<Failure, UserAuthModel>> signUp(SignUpParam params) async {
    return await _getUserCredentials(params);
  }

  Future<Either<Failure, UserAuthModel>> _getUserCredentials(
    UserAuthParam params,
  ) async {
    if (await connectionState.isConnected) {
      try {
        if (params is SignUpParam) {
          return Right(await userAuthRemoteDataSource.signUp(params));
        } else {
          final userData =
              await userAuthRemoteDataSource.signIn(params as SignInParam);
          userAuthLocalDataSource.cacheUserData(userData).onError(
              (error, stackTrace) => throw (CredentialsCacheFailException()));
          return Right(userData);
        }
      } on CredentialsCacheFailException {
        return Left(CredentialCacheFailure());
      }
      on UserAlreadyExistsException {
        return Left(UserAlreadyExistsFailure());
      } on UserNotExistsException {
        return Left(UserNotExistsFailure());
      } catch (e) {
        return Left(AuthFailure());
      }
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }
}
