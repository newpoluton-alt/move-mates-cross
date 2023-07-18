import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{}

class AuthFailure extends Failure{
  @override
  List<Object?> get props => [];
}
class NoInternetConnectionFailure extends Failure{
  @override
  List<Object?> get props => [];
}

class UserAlreadyExistsFailure extends Failure{
  @override
  List<Object?> get props => [];
}

class UserNotExistsFailure extends Failure{
  @override
  List<Object?> get props => [];
}

class CredentialCacheFailure extends Failure{
  @override
  List<Object?> get props => [];
}