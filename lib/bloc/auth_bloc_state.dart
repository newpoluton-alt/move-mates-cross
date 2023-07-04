import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable{
  @override
  List<Object> get props => [];
}

class AuthStateInitial extends AuthState{
  @override
  List<Object> get props => [];
}
class AuthStateLoading extends AuthState{
  @override
  List<Object> get props => [];
}
class AuthStateLoaded extends AuthState{
  final Object credentials;
  AuthStateLoaded(this.credentials);

  @override
  List<Object> get props => [credentials];
}
class AuthStateError extends AuthState{
  final String error;
  AuthStateError(this.error);

  @override
  List<Object> get props => [error];
}