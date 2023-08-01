import 'package:equatable/equatable.dart';

abstract class CoachState extends Equatable {
  const CoachState();

  @override
  List<Object?> get props => [];
}

class CoachStateEmpty extends CoachState {}

class CoachStateLoading extends CoachState {}

class CoachStateLoaded extends CoachState {
  final Object model;

  const CoachStateLoaded({required this.model});

  @override
  List<Object?> get props => [model];
}

class CoachStateError extends CoachState {
  final String error;

  const CoachStateError({required this.error});

  @override
  List<Object?> get props => [error];
}
