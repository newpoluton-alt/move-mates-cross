import 'package:get_it/get_it.dart';
import 'package:move_mates_android/features/coach/coach_injection_container.dart';
import 'package:move_mates_android/features/user_auth/user_auth_injection_container.dart';

import '../core/data_source/local_data_source_checker.dart';

final sl = GetIt.instance;

Future<void> initDI() async {
  //core main
  sl.registerLazySingleton<LocalDataSourceChecker>(
          () => LocalDataSourceCheckerImpl(flutterSecureStorage: sl()));

  await initUserAuthDI();
  await initCoachDI();
}