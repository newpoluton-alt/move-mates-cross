import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/request_model.dart';
import '../models/signup_request_model.dart';
import 'auth_bloc_constants.dart';

class AuthParse {
  final UserRole role;
  final RequestModel model;
  final AuthOperationName operationName;

  const AuthParse(
      {required this.model, required this.operationName, required this.role});

  Future<http.Response> responseBody() async {
    final String operation = (operationName == AuthOperationName.login)
        ? 'login'
        : (role == UserRole.coach)
            ? 'coach/create'
            : 'client/create';
    final String body =
        jsonEncode(model);
    final Uri url = Uri.parse(AuthBlocConstants.baseUrl + operation);
    final response =
        await http.post(url, headers: AuthBlocConstants.headers, body: body);

    return response;
  }
}

enum AuthOperationName { login, signup }
