import 'package:move_mates_android/features/coach/data/models/coach_clients_content_model.dart';

import '../../domain/entities/coach_clients_entity.dart';

class CoachClientsModel extends CoachClientsEntity {
  const CoachClientsModel({required super.content});

  factory CoachClientsModel.fromJson(Map json) {
    return CoachClientsModel(
        content: (json['content'] as List)
            .map((e) => CoachClientsContentModel(
                  id: e['id'],
                  userName: e['userName'],
                  email: e['email'],
                  phoneNumber: e['phoneNumber'],
                  birthDate: e['birthDate'],
                ))
            .toList());
  }

  Map toJson() {
    return {
      'content':
          content.map((e) => (e as CoachClientsContentModel).toJson()).toList()
    };
  }
}
