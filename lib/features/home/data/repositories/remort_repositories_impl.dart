import 'package:dartz/dartz.dart';
import 'package:flutter_application_api/features/home/data/datasources/product_data_source.dart';
import 'package:flutter_application_api/features/home/domain/entities/app_error.dart';
import 'package:flutter_application_api/features/home/domain/entities/home_data_entities.dart';
import 'package:flutter_application_api/features/home/domain/entities/perams/no_perams.dart';
import 'package:flutter_application_api/features/home/domain/repositories/home_remort_repositories.dart';

class ProductDataRepositoriesImpl extends ProductRemoteRepositories {
  final ProductDataSource productDataSources;
  ProductDataRepositoriesImpl({required this.productDataSources});

  @override
  Future<Either<AppError, List<ProductDataEntity>>> getProductData({required NoParams noParams}) async {
    try {
      final result = await productDataSources.getProductData(noParams: noParams);

      return result;
    } on Exception {
      throw Exception('Something goes wrong.');
    }
  }
}
