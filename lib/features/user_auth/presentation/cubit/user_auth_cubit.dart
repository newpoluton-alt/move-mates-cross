import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_mates_android/core/constants/user_auth_cubit_constants.dart';

import '../../../../core/error/user_auth_failure.dart';
import '../../domain/enteties/user_auth_entity.dart';
import '../../domain/usecases/user_sign_in.dart';
import '../../domain/usecases/user_sign_up.dart';
import 'user_auth_state.dart';

class UserAuthCubit extends Cubit<UserAuthState> {
  final UserSignInUseCase userSignInUseCase;
  final UserSignUpUseCase userSignUpUseCase;

  UserAuthCubit({
    required this.userSignInUseCase,
    required this.userSignUpUseCase,
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

  void _eitherFailureOrUserAuthEntity(
      Either<Failure, UserAuthEntity> failureOrUserAuth) async{
    emit(Loading());
    failureOrUserAuth.fold(
        (failure) => emit(Error(error: _failureToString(failure))),
        (userAuthEntity) => emit(Loaded(userAuthEntity: userAuthEntity)));
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
      default:
        return UserAuthCubitConstants.unexpectedErrorMessage;
    }
  }
}
