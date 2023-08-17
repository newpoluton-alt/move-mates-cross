import 'package:dartz/dartz.dart';
import 'package:move_mates_android/features/coach/domain/usecase/get_clients_list_case.dart';
import 'package:move_mates_android/features/coach/domain/usecase/get_up_coming_case.dart';

import '../../../../core/error/failure.dart';
import '../entities/coach_entity.dart';

abstract class CoachRepository {
  Future<Either<Failure, CoachEntity>> getUpComingEvents(
      UpComingParam param);

  Future<Either<Failure, CoachEntity>> getClientsList(ClientsListParam param)  ;
}