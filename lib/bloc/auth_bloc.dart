import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:move_mates_android/bloc/auth_bloc_state.dart';

import 'models/auth_post_model.dart';

class AuthCubit extends Cubit<AuthState>{
  AuthCubit():super(AuthStateInitial());

  static const String baseUrl = 'http://192.168.0.103:8086/auth/';
  static const Map<String, String> headers = {
    'accept': '*/*',
    'Content-Type': 'application/json'
  };

  Future<void> loginUser(
      {required String name, required String password}) async {
    try{
      emit(AuthStateLoading());
      const String operationName = 'login';
      final String body = jsonEncode({'username': name, 'password': password});
      final Uri url = Uri.parse(baseUrl + operationName);
      final response = await http.post(url, headers: headers, body: body);

      debugPrint('login status code: ${response.statusCode}');

      if(response.statusCode == 200) {
        Map decodedJson = jsonDecode(response.body);
        emit(AuthStateLoaded(LoginResponse.fromJson(decodedJson)));
      }
      else {
        emit(AuthStateError(response.body));
        throw Exception(response.body);
      }
    }
    catch (e) {
      emit(AuthStateError(e.toString()));
    }

  }

  Future<void> createUser({
    required String name,
    required String email,
    required String password,
    required String phone,
    // required String birthDate,
    // required String role,
  }) async {
    try {
      emit(AuthStateLoading());
      const String operationName = 'couch/create';
      final Uri url = Uri.parse(baseUrl + operationName);
      final String body = jsonEncode({
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
        "birthDate": "2023-06-30",
        "role": "COACH"
      });
      final response = await http.post(url, headers: headers, body: body);
      debugPrint('sign up status code: ${response.statusCode}');
      if (response.statusCode == 200) {
        //if the server did return a 200 created response
        //then parse the JSON
        Map<String, dynamic> decodedJson = jsonDecode(response.body);
        emit(AuthStateLoaded(UserSignupModel.fromJson(decodedJson)));
      } else {
        emit(AuthStateError(response.body));
        throw Exception(response.body);
      }
    } catch (e) {
      emit(AuthStateError(e.toString()));
    }
  }
}

enum UserRole {
  coach,
  regularUser,
}
