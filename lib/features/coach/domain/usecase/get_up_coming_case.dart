import 'package:dartz/dartz.dart';
import 'package:move_mates_android/core/error/failure.dart';
import 'package:move_mates_android/core/usescases/usecase.dart';
import 'package:move_mates_android/features/coach/domain/entities/coach_up_coming_entity.dart';

import '../repository/coach_repository.dart';

class GetUpComingCase
    implements UseCase<CoachUpComingEntity, UpComingParam> {

  final CoachRepository coachRepository;

  GetUpComingCase({required this.coachRepository});

  @override
  Future<Either<Failure, CoachUpComingEntity>> call(
      UpComingParam params) async {
    return await coachRepository.getUpComingEvents(params);
  }
}

class UpComingParam extends Param {
  final String fromDate;
  final int size;
  final int page;

  UpComingParam({
    required this.fromDate,
    required this.size,
    required this.page,
  });

  @override
  List<Object?> get props => [
        fromDate,
        size,
        page,
      ];

  @override
  Map toJson() {
    return {
      'from': fromDate,
      'size': size,
      'page': page,
    };
  }
}
