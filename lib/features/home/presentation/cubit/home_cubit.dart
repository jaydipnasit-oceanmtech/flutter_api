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
 // void addFamilyDetails() {
 //    var loadedState = state as CreateNewLoadedState;
 //    if (familyDetailData.every((element) => element.familyMemberName.text.isNotEmpty)) {
 //      familyDetailData.add(FamilyDetails(
 //        familyMemberName: TextEditingController(text: ''),
 //        realationShip: '',
 //        realationShipToggle: false,
 //      ));
 //    } else {
 //      CustomSnackbar.show(
 //        snackbarType: SnackbarType.ERROR,
 //        message: "Enter Name First",
 //      );
 //    }
 //    emit(loadedState.copywith(familyDetailData: familyDetailData, random: Random().nextDouble()));
 //  }

 //  void deleteFamilyMember({required int index}) {
 //    var loadedState = state as CreateNewLoadedState;
 //    familyDetailData.removeAt(index);
 //    emit(
 //      loadedState.copywith(familyDetailData: familyDetailData, random: Random().nextDouble()),
 //    );
 //  }
  
 Future<void> loadInitialData() async {
    Either<AppError, List<ProductDataEntity>> response = await getProductData(NoParams());
    response.fold(
      (error) {},
      (List<ProductDataEntity> data) {
        emit(HomeLoadedState(productDataEntity: data));
      },
    );
  }
  //filtert
  // void selectedTapOrderHistory({
 //    required OrderHistoryLoadedState state,
 //    required OrderFilterEnum data,
 //  }) {
 //    if (data == OrderFilterEnum.all) {
 //      loadInitialData(selectedFilterIndex: 0);
 //    } else if (data == OrderFilterEnum.delivered) {
 //      loadInitialData(status: 'Delivered', selectedFilterIndex: 1);
 //    } else if (data == OrderFilterEnum.cancelled) {
 //      loadInitialData(status: 'Fail', selectedFilterIndex: 2);
 //    } else if (data == OrderFilterEnum.refunded) {
 //      loadInitialData(status: 'Refunded', selectedFilterIndex: 3);
 //    }
 //  }
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
