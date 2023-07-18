import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:move_mates_android/core/constants/flutter_secure_storage_constants.dart';
import 'package:move_mates_android/core/error/user_auth_exception.dart';

import '../models/user_auth_model.dart';
import '../models/user_sign_in_model.dart';

abstract class UserAuthLocalDataSource {
  Future<void> cacheUserData(UserAuthModel model);

  Future<UserSignInModel> getUserData();
}

class UserAuthLocalDataSourceImpl implements UserAuthLocalDataSource {
  final FlutterSecureStorage flutterSecureStorage;

  UserAuthLocalDataSourceImpl({required this.flutterSecureStorage});

  @override
  Future<void> cacheUserData(UserAuthModel model) async {
    return flutterSecureStorage.write(
      key: FlutterSecureStorageConstants.cachedUserAuthKey,
      value: jsonEncode(model.toJson()),
    );
  }

  @override
  Future<UserSignInModel> getUserData() async {
    final jsonString = await flutterSecureStorage.read(
        key: FlutterSecureStorageConstants.cachedUserAuthKey);

    if (jsonString != null) {
      return UserSignInModel.fromJson(jsonDecode(jsonString));
    } else {
      throw CredentialsCacheFailException();
    }
  }
}
