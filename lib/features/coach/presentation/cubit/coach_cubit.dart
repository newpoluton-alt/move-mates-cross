import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_mates_android/core/constants/cubit_constants.dart';
import 'package:move_mates_android/core/error/coach_error/coach_failure.dart';

import '../../../../core/error/failure.dart';
import '../../domain/usecase/get_up_coming_case.dart';
import 'coach_state.dart';

class CoachCubit extends Cubit<CoachState> {
  final GetUpComingCase getUpComingCase;

  CoachCubit({required this.getUpComingCase}) : super(CoachStateEmpty());

  void onGetUpComings(UpComingParam param) async {
    emit(CoachStateLoading());
    final failOrCoachUpComingModel = await getUpComingCase(param);
    failOrCoachUpComingModel.fold(
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
