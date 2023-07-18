import 'package:move_mates_android/features/user_auth/domain/enteties/user_auth_entity.dart';


class UserSignInEntity extends UserAuthEntity{
  final String token;
  final String email;
  final int id;
  final List roles;

  const UserSignInEntity({
    required this.token,
    required this.email,
    required this.id,
    required this.roles,
  });

  @override
  List<Object?> get props => [token, email, id, roles];
}
