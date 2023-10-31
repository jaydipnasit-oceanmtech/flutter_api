import 'package:dartz/dartz.dart';
import 'package:flutter_application_api/features/home/domain/entities/app_error.dart';
import 'package:flutter_application_api/features/home/domain/entities/home_data_entities.dart';
import 'package:flutter_application_api/features/home/domain/entities/perams/no_perams.dart';

abstract class ProductRemoteRepositories {
  Future<Either<AppError, List<ProductDataEntity>>> getProductData({required NoParams noParams});
}
