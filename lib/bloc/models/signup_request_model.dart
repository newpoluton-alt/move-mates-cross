import 'request_model.dart';

class SignupRequestModel implements RequestModel{
  final String name;
  final String email;
  final String password;
  final String phone;
  final UserRole role;

  SignupRequestModel({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.role,
  });

  @override
  Map toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
        'role': (role == UserRole.coach) ? 'coach' : 'client',
      };
}

enum UserRole {
  coach,
  regularUser,
}
