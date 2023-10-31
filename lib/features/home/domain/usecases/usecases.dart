import 'package:dartz/dartz.dart';
import 'package:flutter_application_api/features/home/domain/entities/app_error.dart';

abstract class UseCase<Type, Params> {
  Future<Either<AppError, Type>> call(Params params);
}
