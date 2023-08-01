import 'package:equatable/equatable.dart';

class CoachUpComingContentEntity extends Equatable {
  final String startOfAppointment;
  final String endOfAppointment;
  final int clientId;
  final String type;
  final String description;

  const CoachUpComingContentEntity(
      {required this.startOfAppointment,
      required this.endOfAppointment,
      required this.clientId,
      required this.type,
      required this.description});

  @override
  List<Object?> get props => [
        startOfAppointment,
        endOfAppointment,
        clientId,
        type,
        description];
}
