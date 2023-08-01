import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:move_mates_android/core/network/connection_state.dart';
import 'package:move_mates_android/features/user_auth/data/data_sources/user_auth_local_data_source.dart';
import 'package:move_mates_android/features/user_auth/data/data_sources/user_auth_remote_data_source.dart';
import 'package:move_mates_android/features/user_auth/data/repositories/user_auth_repository_impl.dart';
import 'package:move_mates_android/features/user_auth/domain/repositories/user_auth_repository.dart';
import 'package:move_mates_android/features/user_auth/domain/usecases/user_sign_in.dart';
import 'package:move_mates_android/features/user_auth/domain/usecases/user_sign_out.dart';
import 'package:move_mates_android/features/user_auth/presentation/cubit/user_auth_cubit.dart';

import 'domain/usecases/user_sign_up.dart';

final sl = GetIt.instance;

Future<void> initUserAuthDI() async {

  //state management Cubit-BLoC
  sl.registerFactory(() => UserAuthCubit(
        userSignInUseCase: sl(),
        userSignUpUseCase: sl(),
        userSignOutUseCase: sl(),
      ));

  //use cases
  sl.registerLazySingleton(()=>UserSignOutCase(userAuthRepository: sl()));
  sl.registerLazySingleton(() => UserSignInCase(userAuthRepository: sl()));
  sl.registerLazySingleton(() => UserSignUpCase(userAuthRepository: sl()));

  //repository
  sl.registerLazySingleton<UserAuthRepository>(() => UserAuthRepositoryImpl(
      connectionState: sl(),
      userAuthLocalDataSource: sl(),
      userAuthRemoteDataSource: sl()));

  //data sources
  sl.registerLazySingleton<UserAuthLocalDataSource>(
      () => UserAuthLocalDataSourceImpl(flutterSecureStorage: sl()));
  sl.registerLazySingleton<UserAuthRemoteDataSource>(
      () => UserAuthRemoteDataSourceImpl(client: sl()));

  //core
  sl.registerLazySingleton<ConnectionState>(
      () => ConnectionStateImpl(internetConnectionChecker: sl()));

  //external
  sl.registerLazySingleton(() => InternetConnectionChecker());
  const flutterSecureStorage = FlutterSecureStorage();
  sl.registerLazySingleton(() => flutterSecureStorage);
  sl.registerLazySingleton(() => http.Client());
}
