import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

abstract class NoParamUseCase<Type> {
  Future<Either<Failure, Type>> execute();
}
