import 'package:dartz/dartz.dart';
import 'package:move_mates_android/core/error/failure.dart';
import 'package:move_mates_android/core/usescases/usecase.dart';
import 'package:move_mates_android/features/coach/domain/repository/coach_repository.dart';

import '../entities/coach_profile_entity.dart';

class UpdateCoachProfileCase implements UseCase<CoachProfileEntity, CoachProfileParam>{
  final CoachRepository coachRepository;

  const UpdateCoachProfileCase({required this.coachRepository});
  @override
  Future<Either<Failure, CoachProfileEntity>> call(CoachProfileParam params) async{
    return await coachRepository.updateCoachProfile(params);
  }
}

class CoachProfileParam extends Param {
  final int? duration;
  final String? aboutMe;
  final double? groupPrice;
  final String? lastName;
  final String? birthDate;
  final String? firstName;
  final String? experience;
  final String? offlineName;
  final String? phoneNumber;
  final double? individualPrice;
  final String? qualification;
  final bool? availableOffline;
  final bool? isFirstLessonFree;
  final String? offlineLocation;
  final List<String>? supportedLanguages;

  CoachProfileParam({
    required this.aboutMe,
    required this.lastName,
    required this.duration,
    required this.birthDate,
    required this.firstName,
    required this.groupPrice,
    required this.experience,
    required this.phoneNumber,
    required this.offlineName,
    required this.qualification,
    required this.offlineLocation,
    required this.individualPrice,
    required this.availableOffline,
    required this.isFirstLessonFree,
    required this.supportedLanguages,
  });

  @override
  List<Object?> get props => [
    aboutMe,
    lastName,
    duration,
    birthDate,
    firstName,
    groupPrice,
    experience,
    phoneNumber,
    offlineName,
    qualification,
    offlineLocation,
    individualPrice,
    availableOffline,
    isFirstLessonFree,
    supportedLanguages,
  ];

  @override
  Map toJson() {
    return {
      "aboutMe": aboutMe,
      "lastName": lastName,
      "duration": duration,
      "firstName": firstName,
      "birthDate": birthDate,
      "groupPrice": groupPrice,
      "experience": experience,
      "offlineName": offlineName,
      "phoneNumber": phoneNumber,
      "qualification": qualification,
      "individualPrice": individualPrice,
      "offlineLocation": offlineLocation,
      "availableOffline": availableOffline,
      "isFirstLessonFree": isFirstLessonFree,
      "supportedLanguages": supportedLanguages,
    };
  }
}
