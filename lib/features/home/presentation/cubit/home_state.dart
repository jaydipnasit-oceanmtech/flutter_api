part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitialState extends HomeState {
  const HomeInitialState();

  @override
  List<Object> get props => [];
}

class HomeLordingState extends HomeState {
  const HomeLordingState();

  @override
  List<Object> get props => [];
}

class HomeLoadedState extends HomeState {
  final List<ProductDataEntity> productDataEntity;
  const HomeLoadedState({required this.productDataEntity});
  HomeLoadedState copyWith({
    List<ProductDataEntity>? productDataEntity,
  }) {
    return HomeLoadedState(
      productDataEntity: productDataEntity ?? this.productDataEntity,
    );
  }

  @override
  List<Object> get props => [];
}

class HomeErrorState extends HomeState {
  final AppErrorType errorType;
  final String errormessge;
  const HomeErrorState({required this.errormessge, required this.errorType});

  @override
  List<Object> get props => [errorType, errormessge];
}
