import 'package:equatable/equatable.dart';
import 'package:flutter_application_api/features/home/data/models/home_data_model.dart';


class ProductDataEntity extends Equatable {
  final String id;
  final String userId;
  final String userName;
  final String userProfile;
  final String address;
  final String contactNo;
  final String websiteUrl;
  final String longitude;
  final String langitude;
  final String categoryName;
  final String subCategoryName;
  final String name;
  final String currency;
  final String minPrice;
  final String maxPrice;
  final String discountPrice;
  final String weight;
  final String deliveryCharge;
  final String description;
  final String condition;
  final String images;
  final String negotiation;
  final SoldStatus soldStatus;
  final String productType;
  final UserSince userSince;
  final String creatAt;
  final String productSave;
  final String productReport;
  final String averageRating;
  final String totalUser;
  const ProductDataEntity({
    required this.id,
    required this.userId,
    required this.userName,
    required this.userProfile,
    required this.address,
    required this.contactNo,
    required this.websiteUrl,
    required this.longitude,
    required this.langitude,
    required this.categoryName,
    required this.subCategoryName,
    required this.name,
    required this.currency,
    required this.minPrice,
    required this.maxPrice,
    required this.discountPrice,
    required this.weight,
    required this.deliveryCharge,
    required this.description,
    required this.condition,
    required this.images,
    required this.negotiation,
    required this.soldStatus,
    required this.productType,
    required this.userSince,
    required this.creatAt,
    required this.productSave,
    required this.productReport,
    required this.averageRating,
    required this.totalUser,
  });

  @override
  List<Object> get props {
    return [
      id,
      userId,
      userName,
      userProfile,
      address,
      contactNo,
      websiteUrl,
      longitude,
      langitude,
      categoryName,
      subCategoryName,
      name,
      currency,
      minPrice,
      maxPrice,
      discountPrice,
      weight,
      deliveryCharge,
      description,
      condition,
      images,
      negotiation,
      soldStatus,
      productType,
      userSince,
      creatAt,
      productSave,
      productReport,
      averageRating,
      totalUser,
    ];
  }
}
