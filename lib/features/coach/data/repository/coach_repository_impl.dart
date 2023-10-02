import 'package:dartz/dartz.dart';
import 'package:move_mates_android/core/error/coach_error/coach_failure.dart';
import 'package:move_mates_android/core/error/failure.dart';
import 'package:move_mates_android/core/error/failure_converter.dart';
import 'package:move_mates_android/features/coach/data/data_sources/coach_local_data_sorce.dart';
import 'package:move_mates_android/features/coach/data/data_sources/coach_remote_data_source.dart';
import 'package:move_mates_android/features/coach/domain/entities/coach_profile_entity.dart';
import 'package:move_mates_android/features/coach/domain/usecase/get_clients_list_case.dart';
import 'package:move_mates_android/features/coach/domain/usecase/get_coach_profile_info_case.dart';
import 'package:move_mates_android/features/coach/domain/usecase/get_up_coming_case.dart';
import 'package:move_mates_android/features/coach/domain/usecase/update_coach_profile_case.dart';

import '../../../../core/constants/coach/coach_parse_constants.dart';
import '../../../../core/network/connection_state.dart';
import '../../../../core/usescases/usecase.dart';
import '../../domain/entities/coach_entity.dart';
import '../../domain/repository/coach_repository.dart';

class CoachRepositoryImpl implements CoachRepository {
  final ConnectionState connectionState;
  final FailureConverter failureConverter;
  final CoachRemoteDataSource coachRemoteDataSource;
  final CoachLocalDataSource coachLocalDataSource;

  CoachRepositoryImpl({
    required this.connectionState,
    required this.failureConverter,
    required this.coachRemoteDataSource,
    required this.coachLocalDataSource,
  });

  @override
  Future<Either<Failure, CoachEntity>> getUpComingEvents(
      UpComingParam param) async {
    return await _getUpComingOrClientList(param);
  }

  @override
  Future<Either<Failure, CoachEntity>> getClientsList(
      ClientsListParam param) async {
    return await _getUpComingOrClientList(param);
  }

  @override
  Future<Either<Failure, CoachProfileEntity>> getCoachProfileInfo(
      CoachProfileEmptyParam param) async {
    if (!(await connectionState.isConnected)) {
      return Left(CoachNoInternetConnectionFailure());
    }

    try {
      final token = await coachLocalDataSource.tokenFromCache();
      return Right(await coachRemoteDataSource.getCoachProfile(
          token: token, url: CoachParseConstants.urlForGettingCoachProfile()));
    } catch (error) {
      return Left(failureConverter.exceptionToFailure(error));
    }
  }

  @override
  Future<Either<Failure, CoachProfileEntity>> updateCoachProfile(
      CoachProfileParam params) async {
    if (!(await connectionState.isConnected)) {
      return Left(CoachNoInternetConnectionFailure());
    }

    try {
      final token = await coachLocalDataSource.tokenFromCache();
      final model = await coachRemoteDataSource.updateCoachProfile(
        params: params,
        token: token,
        url: CoachParseConstants.urlForUpdatingCoachProfile(),
      );

      return Right(model);
    } catch (error) {
      return Left(failureConverter.exceptionToFailure(error));
    }
  }

  Future<Either<Failure, CoachEntity>> _getUpComingOrClientList(
      Param param) async {
    if (!(await connectionState.isConnected)) {
      return Left(CoachNoInternetConnectionFailure());
    }

    try {
      String token = await coachLocalDataSource.tokenFromCache();

      return Right(await _paramToCoachModel(
        param: param,
        token: token,
        coachRemoteDataSource: coachRemoteDataSource,
      ));
    } catch (error) {
      return Left(failureConverter.exceptionToFailure(error));
    }
  }

  Future<CoachEntity> _paramToCoachModel({
    required Param param,
    required String token,
    required CoachRemoteDataSource coachRemoteDataSource,
  }) async {
    switch (param.runtimeType) {
      case ClientsListParam:
        return await coachRemoteDataSource.getClientsList(
            token: token,
            url: CoachParseConstants.urlForCoachClients(
                param as ClientsListParam));
      // in case UpComingParam
      default:
        return await coachRemoteDataSource.getUpComingEvents(
            token: token,
            url: CoachParseConstants.urlForGetUpComing(param as UpComingParam));
    }
  }
}
