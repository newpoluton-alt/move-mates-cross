class LoginResponse {
  final String? token;
  final String? userName;
  final int? id;
  final List? roles;
  final String? email;

  const LoginResponse(
      {required this.token,
      this.email,
      required this.userName,
      required this.id,
      required this.roles});

  factory LoginResponse.fromJson(Map json) {
    return LoginResponse(
        token: json['token'],
        userName: json['userName'],
        id: json['id'],
        roles: json['roles'],
        email: json['email']);
  }

  Map<String, dynamic> toJson(LoginResponse loginResponse) {
    return {
      'token': loginResponse.token,
      'userName': loginResponse.userName,
      'id': loginResponse.id,
      'roles': loginResponse.roles,
      'email':loginResponse.email
    };
  }
}

class UserSignupModel {
  final String name;
  final String email;
  final String phone;
  final String birthDate;
  final String role;
  final LoginResponse loginResponse;

  const UserSignupModel({
    required this.role,
    required this.name,
    required this.email,
    required this.phone,
    required this.birthDate,
    required this.loginResponse,
  });

  factory UserSignupModel.fromJson(Map<String, dynamic> json) {
    return UserSignupModel(
        role: json['role'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        birthDate: json['birthDate'],
        loginResponse: LoginResponse.fromJson(json['loginResponse']));
  }

  Map<String, dynamic> toJson(UserSignupModel model) {
    return {
      'name': model.name,
      'email': model.email,
      'phone': model.phone,
      'birthDate': model.birthDate,
      'role': model.role,
      'loginResponse': model.loginResponse.toJson(loginResponse)
    };
  }
}
