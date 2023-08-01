import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failure.dart';

abstract class UseCase<T, P extends Param>{
  Future<Either<Failure, T>>call(P params);
}
abstract class Param extends Equatable{
  Map toJson();
}