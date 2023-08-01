import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:move_mates_android/core/constants/user_auth/flutter_secure_storage_constants.dart';
import 'package:move_mates_android/core/error/coach_error/coach_exception.dart';
import 'package:move_mates_android/features/user_auth/data/models/user_sign_in_model.dart';

abstract class CoachLocalDataSource {
  Future<String> tokenFromCache();
}

class CoachLocalDataSourceImpl implements CoachLocalDataSource {
  final FlutterSecureStorage flutterSecureStorage;

  CoachLocalDataSourceImpl({required this.flutterSecureStorage});

  @override
  Future<String> tokenFromCache() async {

    String? json = await flutterSecureStorage
        .read(key: FlutterSecureStorageConstants.cachedUserAuthKey)
        .onError((error, stackTrace) => throw CoachCacheReadException());

    if (json == null) throw CoachNoDataException();

    return UserSignInModel.fromJson(jsonDecode(json)).token;
  }
}
