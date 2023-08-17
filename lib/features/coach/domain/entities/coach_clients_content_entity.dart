import 'package:equatable/equatable.dart';

class CoachClientsContentEntity extends Equatable {
  final int id;
  final String? userName;
  final String email;
  final String phoneNumber;
  final String? birthDate;

  const CoachClientsContentEntity({
    required this.id,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.birthDate,
  });

  @override
  List<Object?> get props => [
        id,
        userName,
        email,
        phoneNumber,
        birthDate,
      ];
}
