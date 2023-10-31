import 'package:dartz/dartz.dart';
import 'package:flutter_application_api/features/home/domain/entities/app_error.dart';
import 'package:flutter_application_api/features/home/domain/entities/home_data_entities.dart';
import 'package:flutter_application_api/features/home/domain/entities/perams/no_perams.dart';
import 'package:flutter_application_api/features/home/domain/repositories/home_remort_repositories.dart';
import 'package:flutter_application_api/features/home/domain/usecases/usecases.dart';


class GetProductData extends UseCase<List<ProductDataEntity>, NoParams> {
  final ProductRemoteRepositories userRemoteRepositories;

  GetProductData({required this.userRemoteRepositories});

  @override
  Future<Either<AppError, List<ProductDataEntity>>> call(NoParams params) async {
    return await userRemoteRepositories.getProductData(noParams: params);
  }
}
