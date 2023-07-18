import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/user_auth_failure.dart';

abstract class UseCase<T, P extends UserAuthParam>{
  Future<Either<Failure, T>>call(P params);
}
abstract class UserAuthParam extends Equatable{
  Map toJson();
}