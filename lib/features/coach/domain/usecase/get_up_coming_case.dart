import 'package:dartz/dartz.dart';
import 'package:move_mates_android/core/error/failure.dart';
import 'package:move_mates_android/core/usescases/usecase.dart';

import '../entities/coach_entity.dart';
import '../repository/coach_repository.dart';

class GetUpComingCase implements UseCase<CoachEntity, UpComingParam> {
  final CoachRepository coachRepository;

  GetUpComingCase({required this.coachRepository});

  @override
  Future<Either<Failure, CoachEntity>> call(
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

  String fieldsToUrlParam() =>
      '?from=${fromDate}T06%3A18%3A03.000Z&size=$size&page=$page';
}
