
import 'package:dartz/dartz.dart';
import 'package:move_mates_android/features/coach/domain/usecase/get_up_coming_case.dart';

import '../../../../core/error/failure.dart';
import '../entities/coach_up_coming_entity.dart';

abstract class CoachRepository{
  Future<Either<Failure, CoachUpComingEntity>> getUpComingEvents(UpComingParam param);
}