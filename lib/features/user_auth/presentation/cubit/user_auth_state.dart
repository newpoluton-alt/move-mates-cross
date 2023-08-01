import 'package:equatable/equatable.dart';

abstract class UserAuthState extends Equatable{
  const UserAuthState();
}

class UserAuthEmpty extends UserAuthState{
  @override
  List<Object?> get props => [];
}

class UserAuthLoading extends UserAuthState{
  @override
  List<Object?> get props => [];
}

class UserAuthLoaded extends UserAuthState{
  final Object entity;

  const UserAuthLoaded({required this.entity});
  @override
  List<Object?> get props => [entity];
}

class UserAuthError extends UserAuthState{
  final String error;

  const UserAuthError({required this.error});
  @override
  List<Object?> get props => [error];
}