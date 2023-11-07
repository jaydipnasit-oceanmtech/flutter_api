import 'package:equatable/equatable.dart';
import 'package:flutter_application_api/features/home/data/models/home_data_model.dart';

// ignore: must_be_immutable
class ProductDataEntity extends Equatable {
  int? id;
  String? title;
  int? sequence;
  int? layoutType;
  int? isTitleEnabled;
  String? backgroundImg;
  String? backgroundColor;
  String? text;
  int? contentType;
  List<ContentDatum>? contentData;

   ProductDataEntity({
   required this.id,
   required this.title,
   required this.sequence,
   required this.layoutType,
   required this.isTitleEnabled,
   required this.backgroundImg,
   required this.backgroundColor,
   required this.text,
   required this.contentType,
   required this.contentData,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        sequence,
        layoutType,
        backgroundColor,
        contentType,
      ];
}
