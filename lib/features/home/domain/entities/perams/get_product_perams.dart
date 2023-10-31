import 'package:equatable/equatable.dart';

class GetProdcutParams extends Equatable {
  final int id;

  const GetProdcutParams({required this.id});

  @override
  List<Object?> get props => [id];
}
