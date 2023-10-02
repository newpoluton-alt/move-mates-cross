import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_mates_android/features/coach/domain/usecase/get_coach_profile_info_case.dart';
import 'package:move_mates_android/core/error/failure_converter.dart';

import '../../../../core/error/failure.dart';
import '../../data/models/coach_profile_model.dart';
import '../../domain/entities/coach_profile_entity.dart';
import '../../domain/usecase/update_coach_profile_case.dart';

part 'coach_profile_cubit.dart';


abstract class CoachProfileState extends Equatable {
  const CoachProfileState();

  @override
  List<Object?> get props => [];
}

class CoachProfileEmpty extends CoachProfileState {}

class CoachProfileLoading extends CoachProfileState {}

class CoachProfileLoaded extends CoachProfileState {
  final CoachProfileEntity model;

  const CoachProfileLoaded({required this.model});

  @override
  List<Object?> get props => [model];
}

class CoachProfileError extends CoachProfileState {
  final String error;

  const CoachProfileError({required this.error});

  @override
  List<Object?> get props => [];
}
