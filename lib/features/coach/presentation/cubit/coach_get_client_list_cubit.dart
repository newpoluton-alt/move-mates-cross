import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_mates_android/features/coach/domain/usecase/get_clients_list_case.dart';
import 'package:move_mates_android/core/error/failure_converter.dart';

import '../../../../core/constants/error_messages.dart';
import '../../../../core/error/coach_error/coach_failure.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/coach_entity.dart';

part 'coach_get_client_list_state.dart';

class CoachGetClientListCubit extends Cubit<CoachGetClientListState> {
  final FailureConverter failureConverter;
  final GetClientListCase getClientListCase;

  CoachGetClientListCubit(
      {required this.failureConverter, required this.getClientListCase})
      : super(const CoachGetClientListEmpty());

  void onGetClientsList(ClientsListParam param) async {
    emit(CoachGetClientListLoading());
    final failureOrClientList = await getClientListCase(param);
    _failureOrSuccess(failureOrClientList);
  }

  void _failureOrSuccess(Either<Failure, CoachEntity> failureOrClientList) {
    emit(CoachGetClientListLoading());
    failureOrClientList.fold(
        (failure) =>
            emit(CoachGetClientListError(error: failureConverter.failureToString(failure))),
        (model) => emit(CoachGetClientListLoaded(model: model)));
  }
}
