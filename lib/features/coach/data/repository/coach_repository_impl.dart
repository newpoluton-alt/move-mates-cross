
import 'package:dartz/dartz.dart';
import 'package:move_mates_android/core/constants/coach/coach_constants.dart';
import 'package:move_mates_android/core/error/coach_error/coach_exception.dart';
import 'package:move_mates_android/core/error/coach_error/coach_failure.dart';
import 'package:move_mates_android/core/error/failure.dart';
import 'package:move_mates_android/features/coach/data/data_sources/coach_local_data_sorce.dart';
import 'package:move_mates_android/features/coach/data/data_sources/coach_remote_data_source.dart';
import 'package:move_mates_android/features/coach/domain/entities/coach_up_coming_entity.dart';
import 'package:move_mates_android/features/coach/domain/usecase/get_up_coming_case.dart';

import '../../../../core/network/connection_state.dart';
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
  Future<Either<Failure, CoachUpComingEntity>> getUpComingEvents(
      UpComingParam param) async {
    if (!(await connectionState.isConnected)) {
      throw CoachNoInternetConnectionException();
    }

    try {
      String token = await coachLocalDataSource.tokenFromCache();
      final upComingEventsResponse =
          await coachRemoteDataSource.getUpComingEvents(
              token: token, url: CoachParseConstants.urlForGetUpComing(param));

      return Right(upComingEventsResponse);
    } catch (error) {
      return Left(_exceptionToFailure(error));
    }
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
