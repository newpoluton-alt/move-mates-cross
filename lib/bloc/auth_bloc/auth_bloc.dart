import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:move_mates_android/bloc/auth_bloc/auth_bloc_state.dart';
import 'package:move_mates_android/bloc/tools/auth_bloc_constants.dart';

import '../models/auth_post_model.dart';
import '../models/login_request_model.dart';
import '../models/signup_request_model.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthStateInitial());

  Future<void> loginUser(LoginRequestModel model) async {
    try {
      emit(AuthStateLoading());

      const String operationName = 'login';
      final String body =
          jsonEncode({'username': model.email, 'password': model.password});
      final Uri url = Uri.parse(AuthBlocConstants.baseUrl + operationName);
      final response =
          await http.post(url, headers: AuthBlocConstants.headers, body: body);
      Map<String, dynamic> decodedJson = jsonDecode(response.body);

      if (response.statusCode == 200) {
        decodedJson.addAll({'email': model.email});
        emit(AuthStateLoaded(LoginResponse.fromJson(decodedJson)));
      } else if (response.statusCode == 401) {
        throw Exception('Пользователь не зарегистрирован');
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      emit(AuthStateError(e.toString()));
    }
  }

  Future<void> createUser(SignupRequestModel model) async {
    try {
      emit(AuthStateLoading());
      final String operationName =
          (model.role == UserRole.regularUser) ? 'client/create' : 'coach/create';
      final Uri url = Uri.parse(AuthBlocConstants.baseUrl + operationName);
      final String body = jsonEncode({
        "name": model.name,
        "email": model.email,
        "password": model.password,
        "phone": model.phone,
        "birthDate": "2023-06-30",
      });
      final response =
          await http.post(url, headers: AuthBlocConstants.headers, body: body);
      debugPrint('sign up status code: ${response.statusCode}');
      if (response.statusCode == 200) {
        //if the server did return a 200 created response
        //then parse the JSON
        Map<String, dynamic> decodedJson = jsonDecode(response.body);
        emit(AuthStateLoaded(UserSignupModel.fromJson(decodedJson)));
      } else if (response.statusCode == 417) {
        throw Exception('Пользователь уже существует');
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      emit(AuthStateError(e.toString()));
    }
  }
}
