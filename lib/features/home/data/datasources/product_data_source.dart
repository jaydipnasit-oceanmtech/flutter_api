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
      final productData = await client.get('https://praticle-service.s3.ap-south-1.amazonaws.com/sugar_home.json',
          header: ApiConstatnts().headers);
      final parseData = ProductModel.fromJson(productData);
      if (parseData.resbody!.sections!.isNotEmpty) {
       
        return Right(parseData.resbody!.sections!);
      } else {
        return Left(AppError(errorType: AppErrorType.api, errorMessage: parseData.toString()));
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
