import 'package:equatable/equatable.dart';
import 'package:move_mates_android/features/coach/domain/entities/coach_up_coming_content_entity.dart';

import 'coach_entity.dart';

class CoachUpComingEntity extends Equatable implements CoachEntity{
  final List<CoachUpComingContentEntity> content;

  const CoachUpComingEntity({
    required this.content,
  });

  @override
  List<Object?> get props => [content];
}

