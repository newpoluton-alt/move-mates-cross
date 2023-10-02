import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:move_mates_android/core/error/failure_converter.dart';
import 'package:move_mates_android/features/coach/coach_injection_container.dart';
import 'package:move_mates_android/features/user_auth/user_auth_injection_container.dart';

import '../core/data_source/local_data_source_checker.dart';

final sl = GetIt.instance;

Future<void> initDI() async {
  //core main
  sl.registerLazySingleton<LocalDataSourceChecker>(
          () => LocalDataSourceCheckerImpl(flutterSecureStorage: sl()));
  sl.registerLazySingleton<FailureConverter>(() => FailureConverterImpl());

  //DI of user auth
  await initUserAuthDI();
  //DI of coach
  await initCoachDI();
  
  //external
  sl.registerLazySingleton(() => InternetConnectionChecker());
  const flutterSecureStorage = FlutterSecureStorage();
  sl.registerLazySingleton(() => flutterSecureStorage);
  sl.registerLazySingleton(() => http.Client());

}