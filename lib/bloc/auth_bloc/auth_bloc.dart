import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:move_mates_android/bloc/auth_bloc/auth_bloc_state.dart';
import 'package:move_mates_android/bloc/tools/auth_parse.dart';

import '../models/auth_post_model.dart';
import '../models/login_request_model.dart';
import '../models/signup_request_model.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthStateInitial());

  Future<void> loginUser(LoginRequestModel model) async {
    emit(AuthStateLoading());

    final AuthParse loginParse = AuthParse(
      model: model,
      operationName: AuthOperationName.login,
      role: UserRole.none,
    );
    try {
      http.Response response = await loginParse.response();

      if (response.statusCode == 200) {
        Map<String, dynamic> body = jsonDecode(response.body);
        body.addAll({'email': model.email});

        emit(AuthStateLoaded(LoginResponse.fromJson(body)));
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
    emit(AuthStateLoading());
    final AuthParse signupParse = AuthParse(
        model: model,
        operationName: AuthOperationName.signup,
        role: model.role);
    try {
      http.Response response = await signupParse.response();
      if (response.statusCode == 200) {
        //if the server did return a 200 created response
        //then parse the JSON
        Map<String, dynamic> body = jsonDecode(response.body);
        emit(AuthStateLoaded(UserSignupModel.fromJson(body)));
      } else if (response.statusCode == 417) {
        throw Exception('Пользователь уже существует');
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print(e.toString());
      emit(AuthStateError(e.toString()));
    }
  }
}
