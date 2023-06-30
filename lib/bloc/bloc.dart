import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'models/auth_post_model.dart';

class Authorisation {
  static const String baseUrl = 'http://192.168.0.103:8086/auth/';

  Future<UserSignupModel> createUser({
    required String name,
    required String email,
    required String password,
    required String phone,
    // required String birthDate,
    // required String role,
  }) async {
    try {
      const String operationName = 'couch/create';
      const Map<String, String> headers = {
        'accept': '*/*',
        'Content-Type': 'application/json'
      };
      final Uri url = Uri.parse(baseUrl + operationName);
      final response = await http.post(url,
          headers: headers,
          body: jsonEncode({
            "name": name,
            "email": email,
            "password": password,
            "phone": phone,
            "birthDate": "2023-06-30",
            "role": "COACH"
          }));
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        //if the server did return a 201 created response
        //then parse the JSON
        return UserSignupModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('${jsonDecode(response.body)}');
      }
    } catch (e) {
      debugPrint(e.toString());
      return UserSignupModel(
        role: 'role',
        name: name,
        email: email,
        phone: phone,
        birthDate: 'birthDate',
        loginResponse: LoginResponse(
          id: null,
          roles: null,
          token: e.toString(),
          userName: 'Error',
        ),
      );
    }
  }
}

enum UserRole {
  coach,
  regularUser,
}
