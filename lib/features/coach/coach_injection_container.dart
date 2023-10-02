import 'package:get_it/get_it.dart';
import 'package:move_mates_android/features/coach/data/data_sources/coach_local_data_sorce.dart';
import 'package:move_mates_android/features/coach/data/data_sources/coach_remote_data_source.dart';
import 'package:move_mates_android/features/coach/data/repository/coach_repository_impl.dart';
import 'package:move_mates_android/features/coach/domain/repository/coach_repository.dart';
import 'package:move_mates_android/features/coach/domain/usecase/get_clients_list_case.dart';
import 'package:move_mates_android/features/coach/domain/usecase/get_coach_profile_info_case.dart';
import 'package:move_mates_android/features/coach/domain/usecase/get_up_coming_case.dart';
import 'package:move_mates_android/features/coach/domain/usecase/update_coach_profile_case.dart';
import 'package:move_mates_android/features/coach/presentation/cubit/coach_cubit.dart';
import 'package:move_mates_android/features/coach/presentation/cubit/coach_get_client_list_cubit.dart';
import 'package:move_mates_android/features/coach/presentation/cubit/coach_profile_state.dart';

final sl = GetIt.instance;

Future<void> initCoachDI() async {
  // state management BloC (Cubit)
  sl.registerFactory(
      () => CoachCubit(failureConverter: sl(), getUpComingCase: sl()));
  sl.registerFactory(() =>
      CoachGetClientListCubit(failureConverter: sl(), getClientListCase: sl()));
  sl.registerFactory(() => CoachProfileCubit(
      failureConverter: sl(),
      coachProfileInfoCase: sl(),
      updateCoachProfileCase: sl()));

  //use cases
  sl.registerLazySingleton(() => GetUpComingCase(coachRepository: sl()));
  sl.registerLazySingleton(() => GetClientListCase(coachRepository: sl()));
  sl.registerLazySingleton(()=>UpdateCoachProfileCase(coachRepository: sl()));
  sl.registerLazySingleton(
      () => GetCoachProfileInfoCase(coachRepository: sl()));

  //repository implementation
  sl.registerLazySingleton<CoachRepository>(
    () => CoachRepositoryImpl(
      connectionState: sl(),
      failureConverter: sl(),
      coachLocalDataSource: sl(),
      coachRemoteDataSource: sl(),
    ),
  );

  //data sources
  sl.registerLazySingleton<CoachRemoteDataSource>(
      () => CoachRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<CoachLocalDataSource>(
      () => CoachLocalDataSourceImpl(flutterSecureStorage: sl()));
}
