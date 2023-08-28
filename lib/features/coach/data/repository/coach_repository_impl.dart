import 'package:dartz/dartz.dart';
import 'package:move_mates_android/core/error/coach_error/coach_exception.dart';
import 'package:move_mates_android/core/error/coach_error/coach_failure.dart';
import 'package:move_mates_android/core/error/failure.dart';
import 'package:move_mates_android/features/coach/data/data_sources/coach_local_data_sorce.dart';
import 'package:move_mates_android/features/coach/data/data_sources/coach_remote_data_source.dart';
import 'package:move_mates_android/features/coach/domain/usecase/get_clients_list_case.dart';
import 'package:move_mates_android/features/coach/domain/usecase/get_up_coming_case.dart';

import '../../../../core/constants/coach/coach_parse_constants.dart';
import '../../../../core/network/connection_state.dart';
import '../../../../core/usescases/usecase.dart';
import '../../domain/entities/coach_entity.dart';
import '../../domain/repository/coach_repository.dart';

class CoachRepositoryImpl implements CoachRepository {
  final ConnectionState connectionState;
  final CoachRemoteDataSource coachRemoteDataSource;
  final CoachLocalDataSource coachLocalDataSource;

  CoachRepositoryImpl({
    required this.connectionState,
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
      return Left(_exceptionToFailure(error));
    }
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

Failure _exceptionToFailure(Object error) {
  switch (error.runtimeType) {
    case CoachNoInternetConnectionException:
      return CoachNoInternetConnectionFailure();
    case CoachCacheReadException:
      return CoachCacheReadFailure();
    case CoachNoDataException:
      return CoachNoDataFailure();
    case CoachServerException:
      return CoachServerFailure();
    default:
      return CoachUnexpectedFailure();
  }
}
