import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:move_mates_android/core/constants/common_parse_constants.dart';
import 'package:move_mates_android/core/constants/user_auth/user_auth_constants.dart';
import 'package:move_mates_android/core/constants/user_auth/user_role_enum.dart';
import 'package:move_mates_android/core/network/request_http.dart';
import 'package:move_mates_android/features/user_auth/data/models/user_auth_model.dart';
import 'package:move_mates_android/features/user_auth/domain/usecases/user_sign_in.dart';

import '../../../../core/error/user_auth_error/user_auth_exception.dart';
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

  Future<UserAuthModel> _getUserAuth(Param params) async {
    final request = RequestHttpImpl(
        client: client,
        url: CommonParseConstants.baseUrl +
            UserAuthConstants.urlTag +
            paramToAuthString(params));

    final response = await request.post(body: params);

    if (response.statusCode == 401) {
      throw UserNotExistsException();
    }

    if (response.statusCode == 417) {
      throw UserAlreadyExistsException();
    }

    if (response.statusCode != 200) {
      throw AuthException();
    }

    return paramToModel(params: params, body: response.body);
  }

  UserAuthModel paramToModel({required Param params, required String body}) {
    if (params is SignUpParam) {
      return UserSignUpModel.fromJson(jsonDecode(body));
    } else {
      return UserSignInModel.fromJson(jsonDecode(body));
    }
  }

  String paramToAuthString(Param params) {
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
