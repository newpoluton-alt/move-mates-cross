import 'package:equatable/equatable.dart';

class CoachProfileEntity extends Equatable{
  final int? id;
  final int? duration;
  final String? email;
  final double? groupPrice;
  final String? userName;
  final String? lastName;
  final String? birthDate;
  final String? firstName;
  final String? phoneNumber;
  final double? individualPrice;

  const CoachProfileEntity({
    required this.id,
    required this.email,
    required this.userName,
    required this.lastName,
    required this.duration,
    required this.birthDate,
    required this.firstName,
    required this.groupPrice,
    required this.phoneNumber,
    required this.individualPrice,
  });

  @override
  List<Object?> get props => [
        id,
        email,
        userName,
        lastName,
        duration,
        birthDate,
        firstName,
        groupPrice,
        phoneNumber,
        individualPrice,
      ];
}
