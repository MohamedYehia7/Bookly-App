import 'package:dartz/dartz.dart';
import 'package:bookly_app/core/errors/failure.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call([Param param]);
}

class NoParam {}