part of 'coach_get_client_list_cubit.dart';

abstract class CoachGetClientListState extends Equatable {
  const CoachGetClientListState();
}

class CoachGetClientListEmpty extends CoachGetClientListState {
  const CoachGetClientListEmpty();

  @override
  List<Object?> get props => [];
}

class CoachGetClientListLoading extends CoachGetClientListState {
  @override
  List<Object?> get props => [];
}

class CoachGetClientListLoaded extends CoachGetClientListState {
  final Object model;

  const CoachGetClientListLoaded({required this.model});
  @override
  List<Object?> get props => [model];
}

class CoachGetClientListError extends CoachGetClientListState {
  final String error;

  const CoachGetClientListError({required this.error});

  @override
  List<Object?> get props => [error];
}
