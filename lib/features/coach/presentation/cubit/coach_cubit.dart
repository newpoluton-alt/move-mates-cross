import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_mates_android/core/constants/common_cubit_constants.dart';
import 'package:move_mates_android/core/error/coach_error/coach_failure.dart';
import 'package:move_mates_android/features/coach/domain/usecase/get_clients_list_case.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/coach_entity.dart';
import '../../domain/usecase/get_up_coming_case.dart';
import 'coach_state.dart';

class CoachCubit extends Cubit<CoachState> {
  final GetUpComingCase getUpComingCase;
  final GetClientListCase getClientListCase;

  CoachCubit({required this.getUpComingCase, required this.getClientListCase})
      : super(CoachStateEmpty());

  void onGetUpComings(UpComingParam param) async {
    emit(CoachStateLoading());
    final failureOrCoachUpComingModel = await getUpComingCase(param);
    _failureOrSuccess(failureOrCoachModel: failureOrCoachUpComingModel);
  }

  void onGetClientsList(ClientsListParam param) async {
    emit(CoachStateLoading());
    final failureOrCoachClientsModel = await getClientListCase(param);
    _failureOrSuccess(failureOrCoachModel: failureOrCoachClientsModel);
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
        return CubitConstants.noInternetConnectionMessage;

      case CoachNoDataFailure:
        return CubitConstants.noDataInCacheErrorMessage;

      case CoachCacheReadFailure:
        return CubitConstants.userCredentialsReadErrorMessage;

      case CoachServerFailure:
        return CubitConstants.problemsWithServerMessage;

      default:
        return CubitConstants.unexpectedErrorMessage;
    }
  }
}
