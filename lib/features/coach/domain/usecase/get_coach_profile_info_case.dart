import 'package:dartz/dartz.dart';
import 'package:move_mates_android/core/error/failure.dart';
import 'package:move_mates_android/core/usescases/usecase.dart';
import 'package:move_mates_android/features/coach/domain/entities/coach_profile_entity.dart';
import 'package:move_mates_android/features/coach/domain/repository/coach_repository.dart';

class GetCoachProfileInfoCase
    implements UseCase<CoachProfileEntity, CoachProfileEmptyParam> {
  final CoachRepository coachRepository;

  GetCoachProfileInfoCase({required this.coachRepository});

  @override
  Future<Either<Failure, CoachProfileEntity>> call(
      CoachProfileEmptyParam params) async {
    return await coachRepository.getCoachProfileInfo(params);
  }
}

class CoachProfileEmptyParam extends Param{
  @override
  List<Object?> get props => [];

  @override
  Map toJson() {
    return {};
  }
}