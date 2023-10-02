import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/error/failure_converter.dart';
import '../../domain/entities/coach_entity.dart';
import '../../domain/usecase/get_up_coming_case.dart';
import 'coach_state.dart';

class CoachCubit extends Cubit<CoachState> {
  final GetUpComingCase getUpComingCase;
  final FailureConverter failureConverter;

  CoachCubit({required this.getUpComingCase, required this.failureConverter})
      : super(CoachStateEmpty());

  void onGetUpComings(UpComingParam param) async {
    emit(CoachStateLoading());
    final failureOrCoachUpComingModel = await getUpComingCase(param);
    _failureOrSuccess(failureOrCoachModel: failureOrCoachUpComingModel);
  }

  void _failureOrSuccess(
      {required Either<Failure, CoachEntity> failureOrCoachModel}) {
    failureOrCoachModel.fold(
        (failure) =>
            emit(CoachStateError(error: failureConverter.failureToString(failure))),
        (model) => emit(CoachStateLoaded(model: model)));
  }
}
