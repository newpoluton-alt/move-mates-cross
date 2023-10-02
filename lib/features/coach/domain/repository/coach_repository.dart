import 'package:dartz/dartz.dart';
import 'package:move_mates_android/features/coach/domain/entities/coach_profile_entity.dart';
import 'package:move_mates_android/features/coach/domain/usecase/get_clients_list_case.dart';
import 'package:move_mates_android/features/coach/domain/usecase/get_up_coming_case.dart';

import '../../../../core/error/failure.dart';
import '../entities/coach_entity.dart';
import '../usecase/get_coach_profile_info_case.dart';
import '../usecase/update_coach_profile_case.dart';

abstract class CoachRepository {
  Future<Either<Failure, CoachEntity>> getUpComingEvents(UpComingParam param);
  Future<Either<Failure, CoachEntity>> getClientsList(ClientsListParam param);
  Future<Either<Failure, CoachProfileEntity>> updateCoachProfile(CoachProfileParam param);
  Future<Either<Failure, CoachProfileEntity>> getCoachProfileInfo(CoachProfileEmptyParam param);
}
