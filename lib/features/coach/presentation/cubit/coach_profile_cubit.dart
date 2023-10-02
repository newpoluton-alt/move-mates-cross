part of 'coach_profile_state.dart';

class CoachProfileCubit extends Cubit<CoachProfileState> {
  CoachProfileCubit({
    required this.failureConverter,
    required this.coachProfileInfoCase,
    required this.updateCoachProfileCase,

  }) : super(CoachProfileEmpty());

  final FailureConverter failureConverter;
  final GetCoachProfileInfoCase coachProfileInfoCase;
  final UpdateCoachProfileCase updateCoachProfileCase;

  void onGettingCoachProfile(CoachProfileEmptyParam param) async {
    emit(CoachProfileLoading());

    final failureOrCoachProfile = await coachProfileInfoCase(param);

    _failureOrCoachProfileEntity(failureOrCoachProfile);
  }

  void onUpdatingCoachProfile(CoachProfileParam param) async {
    emit(CoachProfileLoading());
    final failureOrCoachProfile = await updateCoachProfileCase(param);
    _failureOrCoachProfileEntity(failureOrCoachProfile);
  }
  void _failureOrCoachProfileEntity(
      Either<Failure, CoachProfileEntity> failureOrSuccess) {

    failureOrSuccess.fold(
        (failure) => emit(CoachProfileError(
            error: failureConverter.failureToString(failure))),
        (model) => emit(CoachProfileLoaded(model: model)));
  }
}
