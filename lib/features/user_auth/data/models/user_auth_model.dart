import 'package:equatable/equatable.dart';
import 'package:move_mates_android/features/user_auth/domain/enteties/user_auth_entity.dart';

abstract class UserAuthModel extends Equatable implements UserAuthEntity {
  Map toJson();
  @override
  List<Object?> get props=> [];
}