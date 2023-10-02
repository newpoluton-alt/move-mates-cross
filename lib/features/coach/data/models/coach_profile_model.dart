import '../../domain/entities/coach_profile_entity.dart';

class CoachProfileModel extends CoachProfileEntity {
  const CoachProfileModel(
      {required super.id,
      required super.email,
      required super.userName,
      required super.lastName,
      required super.duration,
      required super.birthDate,
      required super.firstName,
      required super.groupPrice,
      required super.phoneNumber,
      required super.individualPrice});

  Map toJson() {
    return {
      "id": id,
      "userName": userName,
      "firstName": firstName,
      "lastName": lastName,
      "duration": duration,
      "groupPrice": groupPrice,
      "individualPrice": individualPrice,
      "email": email,
      "phoneNumber": phoneNumber,
      "birthDate": birthDate
    };
  }

  factory CoachProfileModel.fromJson(Map json) {
    return CoachProfileModel(
      id: json['id'],
      email: json['email'],
      userName: json['userName'],
      lastName: json['lastName'],
      duration: json['duration'],
      birthDate: json['birthDate'],
      firstName: json['firstName'],
      groupPrice: json['groupPrice'],
      phoneNumber: json['phoneNumber'],
      individualPrice: json['individualPrice'],
    );
  }
}
