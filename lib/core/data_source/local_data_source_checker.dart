import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:move_mates_android/core/constants/user_auth/flutter_secure_storage_constants.dart';

abstract class LocalDataSourceChecker {
  Future<bool> get isDataLocated;
}

class LocalDataSourceCheckerImpl implements LocalDataSourceChecker {
  final FlutterSecureStorage flutterSecureStorage;

  const LocalDataSourceCheckerImpl({required this.flutterSecureStorage});

  @override
  Future<bool> get isDataLocated async {
    final userData = await flutterSecureStorage.read(
        key: FlutterSecureStorageConstants.cachedUserAuthKey);
    return (userData != null);
  }
}
