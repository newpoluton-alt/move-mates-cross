import 'package:move_mates_android/features/user_auth/domain/enteties/user_auth_entity.dart';


class UserSignUpEntity extends UserAuthEntity{
  final String name;
  final String email;
  final String phone;
  final String birthDate;
  final String role;

  const UserSignUpEntity({
    required this.name,
    required this.email,
    required this.phone,
    required this.birthDate,
    required this.role,
  });

  @override
  List<Object?> get props => [
        name,
        email,
        phone,
        birthDate,
        role,
      ];
}
