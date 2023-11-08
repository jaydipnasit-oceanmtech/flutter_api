part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitialState extends HomeState {
  const HomeInitialState();

  @override
  List<Object?> get props => [];
}

class HomeLordingState extends HomeState {
  const HomeLordingState();

  @override
  List<Object?> get props => [];
}

class HomeLoadedState extends HomeState {
  final int? index;
  final int? secondindex;

  final List<ProductDataEntity> productDataEntity;
  HomeLoadedState({
    required this.productDataEntity,
    this.index,
    this.secondindex,
  });
  HomeLoadedState copyWith(
      {List<ProductDataEntity>? productDataEntity, int? index, int? secondindex, int? colorindex}) {
    print("+++++++++++++++++++$colorindex");
    return HomeLoadedState(
        productDataEntity: productDataEntity ?? this.productDataEntity,
        index: index ?? this.index,
        secondindex: secondindex ?? this.secondindex);
  }

  @override
  List<Object?> get props => [
        productDataEntity,
        index,
        secondindex,
      ];
}

class HomeErrorState extends HomeState {
  final AppErrorType errorType;
  final String errormessge;
  const HomeErrorState({required this.errormessge, required this.errorType});

  @override
  List<Object?> get props => [errorType, errormessge];
}
