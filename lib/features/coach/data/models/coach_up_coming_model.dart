import 'package:move_mates_android/features/coach/data/models/coach_up_coming_content_model.dart';
import 'package:move_mates_android/features/coach/domain/entities/coach_up_coming_entity.dart';

class CoachUpComingModel extends CoachUpComingEntity {
  const CoachUpComingModel({required super.content});

  factory CoachUpComingModel.fromJson(Map json) {
    return CoachUpComingModel(
        content: (json['content'] as List)
            .map((e) => CoachUpComingContentModel.fromJson(e))
            .toList());
  }

  Map toJson() {
    return {
      'content':
          content.map((e) => (e as CoachUpComingContentModel).toJson()).toList()
    };
  }
}
