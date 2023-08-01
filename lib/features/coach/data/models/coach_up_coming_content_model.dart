import 'package:move_mates_android/features/coach/domain/entities/coach_up_coming_content_entity.dart';

class CoachUpComingContentModel extends CoachUpComingContentEntity {
  const CoachUpComingContentModel(
      {required super.startOfAppointment,
      required super.endOfAppointment,
      required super.clientId,
      required super.type,
      required super.description});

  factory CoachUpComingContentModel.fromJson(Map json) {
    return CoachUpComingContentModel(
      startOfAppointment: json["startOfAppointment"],
      endOfAppointment: json["endOfAppointment"],
      clientId: json["clientId"],
      type: json["type"],
      description: json["description"],
    );
  }

  Map toJson() {
    return {
      "startOfAppointment": startOfAppointment,
      "endOfAppointment": endOfAppointment,
      "clientId": clientId,
      "type": type,
      "description": description
    };
  }
}
