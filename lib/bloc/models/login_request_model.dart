
import 'request_model.dart';

class LoginRequestModel implements RequestModel{
  final String email;
  final String password;
  @override
  Map<String, dynamic> toJson() => {'username': email, 'password': password};
  const LoginRequestModel({
    required this.email,
    required this.password,
  });
}
