import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_mates_android/core/error/coach_error/coach_failure.dart';

import '../../../../core/constants/error_messages.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/coach_entity.dart';
import '../../domain/usecase/get_up_coming_case.dart';
import 'coach_state.dart';

class CoachCubit extends Cubit<CoachState> {
  final GetUpComingCase getUpComingCase;

  CoachCubit({required this.getUpComingCase})
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
            emit(CoachStateError(error: _coachFailureToString(failure))),
        (model) => emit(CoachStateLoaded(model: model)));
  }

  String _coachFailureToString(Failure failure) {
    switch (failure.runtimeType) {
      case CoachNoInternetConnectionFailure:
        return ErrorMessages.noInternetConnectionMessage;

      case CoachNoDataFailure:
        return ErrorMessages.noDataInCacheErrorMessage;

      case CoachCacheReadFailure:
        return ErrorMessages.userCredentialsReadErrorMessage;

      case CoachServerFailure:
        return ErrorMessages.problemsWithServerMessage;

      default:
        return ErrorMessages.unexpectedErrorMessage;
    }
  }
}
