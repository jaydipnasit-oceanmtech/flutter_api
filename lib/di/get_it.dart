import 'package:flutter_application_api/core/api_client.dart';
import 'package:flutter_application_api/features/home/data/datasources/product_data_source.dart';
import 'package:flutter_application_api/features/home/data/repositories/remort_repositories_impl.dart';
import 'package:flutter_application_api/features/home/domain/repositories/home_remort_repositories.dart';
import 'package:flutter_application_api/features/home/domain/usecases/get_product_data.dart';
import 'package:flutter_application_api/features/home/presentation/cubit/home_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance.registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  //Data source Dependency
  getItInstance.registerLazySingleton<ProductDataSource>(() => ProductDataSourceImpl(client: getItInstance()));

  //Data Repository Dependency
  getItInstance.registerLazySingleton<ProductRemoteRepositories>(
      () => ProductDataRepositoriesImpl(productDataSources: getItInstance()));

  //Usecase Dependency
  getItInstance.registerLazySingleton<GetProductData>(() => GetProductData(userRemoteRepositories: getItInstance()));

  //Cubit Dependency
  getItInstance.registerFactory<HomeCubit>(() => HomeCubit(getProductData: getItInstance()));
}
