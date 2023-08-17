import 'package:equatable/equatable.dart';
import 'package:move_mates_android/features/coach/domain/entities/coach_entity.dart';

import 'coach_clients_content_entity.dart';

class CoachClientsEntity extends Equatable implements CoachEntity{
  final List<CoachClientsContentEntity> content;

  const CoachClientsEntity({required this.content});

  @override
  List<Object?> get props => [content];
}
