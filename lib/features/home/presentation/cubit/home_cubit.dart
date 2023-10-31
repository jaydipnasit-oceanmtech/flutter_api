import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_api/features/home/domain/entities/home_data_entities.dart';
import 'package:flutter_application_api/features/home/domain/entities/perams/no_perams.dart';
import 'package:flutter_application_api/features/home/domain/usecases/get_product_data.dart';
import 'package:flutter_application_api/features/home/domain/entities/app_error.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetProductData getProductData;
  HomeCubit({required this.getProductData}) : super(const HomeLoadedState(productDataEntity: []));

 Future<void> loadInitialData() async {
    Either<AppError, List<ProductDataEntity>> response = await getProductData(NoParams());
    response.fold(
      (error) {},
      (List<ProductDataEntity> data) {
        emit(HomeLoadedState(productDataEntity: data));
      },
    );
  }

  // final picker = ImagePicker();

  // Future<void> selectImage() async {
  //   final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

  //   if (pickedFile != null) {
  //     emit(HomeLorderState(image: pickedFile.path));
  //   } else {
  //     if (kDebugMode) {
  //       print('No image selected.');
  //     }
  //   }
  // }
}
