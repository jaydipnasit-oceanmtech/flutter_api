import 'dart:io';


import 'package:dartz/dartz.dart';
import 'package:flutter_application_api/core/api_client.dart';
import 'package:flutter_application_api/core/api_constatnts.dart';
import 'package:flutter_application_api/core/unathorised_exception.dart';
import 'package:flutter_application_api/features/home/data/models/home_data_model.dart';
import 'package:flutter_application_api/features/home/domain/entities/app_error.dart';
import 'package:flutter_application_api/features/home/domain/entities/home_data_entities.dart';
import 'package:flutter_application_api/features/home/domain/entities/perams/no_perams.dart';

abstract class ProductDataSource {
  Future<Either<AppError, List<ProductDataEntity>>> getProductData({required NoParams noParams});
}

class ProductDataSourceImpl extends ProductDataSource {
  final ApiClient client;

  ProductDataSourceImpl({required this.client});

  @override
  Future<Either<AppError, List<ProductDataEntity>>> getProductData({required NoParams noParams}) async {
    try {
      final productData = await client.get(
          'https://praticle-service.s3.ap-south-1.amazonaws.com/intermidiate_task.json',
          header: ApiConstatnts().headers);
      final parseData = ProductModel.fromJson(productData);

      if (parseData.status == 200 && parseData.success == "true" && parseData.data.isNotEmpty) {
        return Right(parseData.data[0].productData);
      } else if (parseData.status == 404) {
        return Left(
          AppError(
            errorType: AppErrorType.data,
            errorMessage: '${parseData.message} (Error:100 & ${parseData.status.toString()})',
          ),
        );
      } else if (parseData.status == 406 || parseData.status == 405) {
        // saveError(
        //   params: ErrorParams(
        //     errType: ErrorLogType.api,
        //     url: paramsUrl,
        //     errMsg: '${parseData.message} (Error:100 & ${parseData.status.toString()})',
        //   ),
        // );
        return Left(
          AppError(
            errorType: AppErrorType.api,
            errorMessage: '${parseData.message} (Error:100 & ${parseData.status.toString()})',
          ),
        );
      } else {
        // saveError(params: ErrorParams(errType: ErrorLogType.api, url: paramsUrl, errMsg: parseData.message.toString()));
        return Left(AppError(errorType: AppErrorType.api, errorMessage: parseData.message));
      }
    } on UnauthorisedException catch (_) {
      return const Left(AppError(errorType: AppErrorType.unauthorised, errorMessage: "Un-Authorised"));
    } on SocketException catch (e) {
      if (e.toString().contains('ClientException with SocketException')) {
        return const Left(
          AppError(
            errorType: AppErrorType.network,
            errorMessage: "Please check your internet connection, try again!!!\n(Error:102)",
          ),
        );
      } else if (e.toString().contains('ClientException') && e.toString().contains('Software')) {
        return const Left(
          AppError(
            errorType: AppErrorType.network,
            errorMessage: "Network Change Detected, Please try again!!!\n(Error:103)",
          ),
        );
      }
      return const Left(
        AppError(
          errorType: AppErrorType.network,
          errorMessage: "Something went wrong, try again!\nSocket Problem (Error:104)",
        ),
      );
    } catch (exception) {
      // saveError(params: ErrorParams(errType: ErrorLogType.app, url: paramsUrl, errMsg: exception.toString()));
      return const Left(
        AppError(errorType: AppErrorType.app, errorMessage: "Something went wrong, try again!\n(Error:105)"),
      );
    }
  }
}
