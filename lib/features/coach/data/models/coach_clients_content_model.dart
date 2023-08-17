import 'package:move_mates_android/features/coach/domain/entities/coach_clients_content_entity.dart';

class CoachClientsContentModel extends CoachClientsContentEntity {
  const CoachClientsContentModel(
      {required super.id,
      required super.userName,
      required super.email,
      required super.phoneNumber,
      required super.birthDate});

  factory CoachClientsContentModel.fromJson(Map json) {
    return CoachClientsContentModel(
        id: json['id'],
        userName: json['userName'],
        email: json['email'],
        phoneNumber: json['phoneNumber'],
        birthDate: json['birthDate']);
  }
  Map toJson(){
    return  {
      "id": id,
      "userName": userName,
      "email": email,
      "phoneNumber": phoneNumber,
      "birthDate": birthDate
    };
  }
}
