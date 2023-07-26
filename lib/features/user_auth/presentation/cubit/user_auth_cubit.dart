import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_mates_android/core/constants/user_auth/user_auth_cubit_constants.dart';
import 'package:move_mates_android/core/error/user_auth_exception.dart';

import '../../../../core/error/user_auth_failure.dart';
import '../../domain/enteties/user_auth_entity.dart';
import '../../domain/usecases/user_sign_in.dart';
import '../../domain/usecases/user_sign_out.dart';
import '../../domain/usecases/user_sign_up.dart';
import 'user_auth_state.dart';

class UserAuthCubit extends Cubit<UserAuthState> {
  final UserSignInCase userSignInUseCase;
  final UserSignUpCase userSignUpUseCase;
  final UserSignOutCase userSignOutUseCase;

  UserAuthCubit({
    required this.userSignInUseCase,
    required this.userSignUpUseCase,
    required this.userSignOutUseCase,
  }) : super(Empty());

  void onUserSignUp(SignUpParam params) async {
    emit(Loading());
    final failureOrUserAuth = await userSignUpUseCase(params);
    _eitherFailureOrUserAuthEntity(failureOrUserAuth);
  }

  void onUserSignIn(SignInParam params) async {
    emit(Loading());
    final failureOrUserAuth = await userSignInUseCase(params);
    _eitherFailureOrUserAuthEntity(failureOrUserAuth);
  }

  void onUserSignOut(SignOutParam params) async {
    emit(Loading());
    final userSignOutOrFail = await userSignOutUseCase(params);
    userSignOutOrFail.fold(
        (failure) => emit(Error(error: _failureToString(failure))),
        (userSignOut) => emit(Loaded(entity: params)));
  }

  void _eitherFailureOrUserAuthEntity(
      Either<Failure, UserAuthEntity> failureOrUserAuth) async {
    emit(Loading());
    failureOrUserAuth.fold(
        (failure) => emit(Error(error: _failureToString(failure))),
        (userAuthEntity) => emit(Loaded(entity: userAuthEntity)));
  }

  String _failureToString(Failure failure) {
    switch (failure.runtimeType) {
      case UserNotExistsFailure:
        return UserAuthCubitConstants.userNotExistsMessage;
      case UserAlreadyExistsFailure:
        return UserAuthCubitConstants.userAlreadyExistsMessage;
      case NoInternetConnectionFailure:
        return UserAuthCubitConstants.noInternetConnectionMessage;
      case AuthFailure:
        return UserAuthCubitConstants.problemsWithServerMessage;
      case CredentialsCacheFailure:
        return UserAuthCubitConstants.userCredentialsCacheErrorMessage;
      case CredentialsDeleteFailure:
        return UserAuthCubitConstants.userCredentialsDeleteErrorMessage;
      case CredentialsReadFailure:
        return UserAuthCubitConstants.userCredentialsReadErrorMessage;
      default:
        return UserAuthCubitConstants.unexpectedErrorMessage;
    }
  }
}
