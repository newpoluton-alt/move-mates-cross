import 'package:dartz/dartz.dart';
import 'package:move_mates_android/core/error/failure.dart';
import 'package:move_mates_android/core/usescases/usecase.dart';
import 'package:move_mates_android/features/coach/domain/repository/coach_repository.dart';

import '../entities/coach_entity.dart';

class GetClientListCase
    implements UseCase<CoachEntity, ClientsListParam> {
  final CoachRepository coachRepository;

  GetClientListCase({required this.coachRepository});

  @override
  Future<Either<Failure, CoachEntity>> call(ClientsListParam params) async{
    return coachRepository.getClientsList(params);
  }
}

class ClientsListParam extends Param {
  final int size;
  final int page;

  ClientsListParam({
    required this.size,
    required this.page,
  });

  @override
  List<Object?> get props => [size, page];

  @override
  Map toJson() {
    return {
      'size': size,
      'page': page,
    };
  }
  String fieldsToUrlParam() => '?size=$size&page=$page';
}
