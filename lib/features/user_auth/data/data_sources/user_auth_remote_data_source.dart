import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:move_mates_android/core/constants/user_auth_constants.dart';
import 'package:move_mates_android/core/enum/user_role_enum.dart';
import 'package:move_mates_android/core/error/user_auth_exception.dart';
import 'package:move_mates_android/features/user_auth/data/models/user_auth_model.dart';
import 'package:move_mates_android/features/user_auth/domain/usecases/user_sign_in.dart';

import '../../../../core/usescases/usecase.dart';
import '../../domain/usecases/user_sign_up.dart';
import '../models/user_sign_in_model.dart';
import '../models/user_sign_up_model.dart';

abstract class UserAuthRemoteDataSource {
  Future<UserAuthModel> signIn(SignInParam params);

  Future<UserAuthModel> signUp(SignUpParam params);
}

class UserAuthRemoteDataSourceImpl implements UserAuthRemoteDataSource {
  final http.Client client;

  UserAuthRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<UserAuthModel> signIn(SignInParam params) async {
    return await _getUserAuth(params);
  }

  @override
  Future<UserAuthModel> signUp(SignUpParam params) async {
    return await _getUserAuth(params);
  }

  Future<UserAuthModel> _getUserAuth(UserAuthParam params) async {
    final response = await client.post(
        Uri.parse(UserAuthConstants.baseUrl + paramToAuthString(params)),
        headers: UserAuthConstants.headers,
        body: jsonEncode(paramToJsonBody(params)));

    if (response.statusCode == 200) {
      return paramToModel(params: params, body: response.body);
    } else if (response.statusCode == 401) {
      throw UserNotExistsException();
    } else if (response.statusCode == 417) {
      throw UserAlreadyExistsException();
    } else {
      throw AuthException();
    }
  }

  UserAuthModel paramToModel(
      {required UserAuthParam params, required String body}) {
    if (params is SignUpParam) {
      return UserSignUpModel.fromJson(jsonDecode(body));
    } else {
      return UserSignInModel.fromJson(jsonDecode(body));
    }
  }

  Map paramToJsonBody(UserAuthParam params) {
    if (params is SignUpParam) {
      return params.toJson();
    } else if (params is SignInParam) {
      return params.toJson();
    } else {
      return {'none': 'none'};
    }
  }

  String paramToAuthString(UserAuthParam params) {
    if (params is SignUpParam) {
      return roleToSignUpString(params.role);
    } else if (params is SignInParam) {
      return 'login';
    } else {
      return '';
    }
  }

  String roleToSignUpString(UserRoleEnum role) {
    switch (role) {
      case UserRoleEnum.client:
        return 'client/create';
      case UserRoleEnum.coach:
        return 'coach/create';
      default:
        return 'none';
    }
  }
}
