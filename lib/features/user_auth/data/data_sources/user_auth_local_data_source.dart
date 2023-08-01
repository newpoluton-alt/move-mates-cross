import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:move_mates_android/core/constants/user_auth/flutter_secure_storage_constants.dart';

import '../../../../core/error/user_auth_error/user_auth_exception.dart';
import '../models/user_auth_model.dart';
import '../models/user_sign_in_model.dart';

abstract class UserAuthLocalDataSource {
  Future<void> cacheUserData(UserAuthModel model);

  Future<void> deleteUserData();

  Future<UserSignInModel> getUserData();
}

class UserAuthLocalDataSourceImpl implements UserAuthLocalDataSource {
  final FlutterSecureStorage flutterSecureStorage;

  UserAuthLocalDataSourceImpl({required this.flutterSecureStorage});

  @override
  Future<void> cacheUserData(UserAuthModel model) async {
    return flutterSecureStorage
        .write(
          key: FlutterSecureStorageConstants.cachedUserAuthKey,
          value: jsonEncode(model.toJson()),
        )
        .onError(
            (error, stackTrace) => throw (CredentialsCacheException()));
  }

  @override
  Future<UserSignInModel> getUserData() async {
    final jsonString = await flutterSecureStorage.read(
        key: FlutterSecureStorageConstants.cachedUserAuthKey);

    if (jsonString != null) {
      return UserSignInModel.fromJson(jsonDecode(jsonString));
    } else {
      throw CredentialsReadException();
    }
  }

  @override
  Future<void> deleteUserData() async {
    final jsonString = await flutterSecureStorage.read(
        key: FlutterSecureStorageConstants.cachedUserAuthKey);

    if (jsonString != null) {
      await flutterSecureStorage
          .delete(key: FlutterSecureStorageConstants.cachedUserAuthKey)
          .onError((error, stackTrace) => throw CredentialsDeleteException());
    }
    else {
      throw CredentialsCacheException();
    }
  }
}
