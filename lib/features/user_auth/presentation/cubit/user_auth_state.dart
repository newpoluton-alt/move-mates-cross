import 'package:equatable/equatable.dart';

import '../../domain/enteties/user_auth_entity.dart';

abstract class UserAuthState extends Equatable{
  const UserAuthState();
}

class Empty extends UserAuthState{
  @override
  List<Object?> get props => [];
}

class Loading extends UserAuthState{
  @override
  List<Object?> get props => [];
}

class Loaded extends UserAuthState{
  final Object entity;

  const Loaded({required this.entity});
  @override
  List<Object?> get props => [];
}

class Error extends UserAuthState{
  final String error;

  const Error({required this.error});
  @override
  List<Object?> get props => [];
}