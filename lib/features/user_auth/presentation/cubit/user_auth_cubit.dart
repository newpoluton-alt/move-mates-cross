import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_mates_android/core/constants/common_cubit_constants.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/error/user_auth_error/user_auth_failure.dart';
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
  }) : super(UserAuthEmpty());

  void onUserSignUp(SignUpParam params) async {
    emit(UserAuthLoading());
    final failureOrUserAuth = await userSignUpUseCase(params);
    _eitherFailureOrUserAuthEntity(failureOrUserAuth);
  }

  void onUserSignIn(SignInParam params) async {
    emit(UserAuthLoading());
    final failureOrUserAuth = await userSignInUseCase(params);
    _eitherFailureOrUserAuthEntity(failureOrUserAuth);
  }

  void onUserSignOut(SignOutParam params) async {
    emit(UserAuthLoading());
    final userSignOutOrFail = await userSignOutUseCase(params);
    userSignOutOrFail.fold(
        (failure) => emit(UserAuthError(error: _failureToString(failure))),
        (userSignOut) => emit(UserAuthLoaded(entity: params)));
  }

  void _eitherFailureOrUserAuthEntity(
      Either<Failure, UserAuthEntity> failureOrUserAuth) async {
    emit(UserAuthLoading());
    failureOrUserAuth.fold(
        (failure) => emit(UserAuthError(error: _failureToString(failure))),
        (userAuthEntity) => emit(UserAuthLoaded(entity: userAuthEntity)));
  }

  String _failureToString(Failure failure) {
    switch (failure.runtimeType) {
      case UserNotExistsFailure:
        return CubitConstants.userNotExistsMessage;
      case UserAlreadyExistsFailure:
        return CubitConstants.userAlreadyExistsMessage;
      case NoInternetConnectionFailure:
        return CubitConstants.noInternetConnectionMessage;
      case AuthFailure:
        return CubitConstants.problemsWithServerMessage;
      case CredentialsCacheFailure:
        return CubitConstants.userCredentialsCacheErrorMessage;
      case CredentialsDeleteFailure:
        return CubitConstants.userCredentialsDeleteErrorMessage;
      case CredentialsReadFailure:
        return CubitConstants.userCredentialsReadErrorMessage;
      default:
        return CubitConstants.unexpectedErrorMessage;
    }
  }
}
