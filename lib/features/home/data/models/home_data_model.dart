// ignore_for_file: overridden_fields, annotate_overrides, constant_identifier_names

// import 'package:flutter_application_api/features/home/domain/entities/home_data_entities.dart';

// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'package:flutter_application_api/features/home/domain/entities/home_data_entities.dart';

class ProductModel {
  final List<ProductDataEntity> products;
  final int total;
  final int skip;
  final int limit;

  ProductModel({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        products: List<ProductDataEntity>.from(json["products"].map((x) => Product.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );
}

class Product extends ProductDataEntity {
  final int id;
  final String title;
  final String description;
  final int price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;

  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  }) : super(
          id: id,
          title: title,
          description: description,
          price: price,
          discountPercentage: discountPercentage,
          rating: rating,
          stock: stock,
          brand: brand,
          category: category,
          thumbnail: thumbnail,
          images: images,
        );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        discountPercentage: json["discountPercentage"]?.toDouble(),
        rating: json["rating"]?.toDouble(),
        stock: json["stock"],
        brand: json["brand"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        images: List<String>.from(json["images"].map((x) => x)),
      );
}

// class ProductModel {
//   int? status;
//   String? success;
//   String message;
//   List<ProductDataList> data;

//   ProductModel({
//     required this.status,
//     required this.success,
//     required this.message,
//     required this.data,
//   });

//   factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
//         status: int.tryParse(json["status"].toString()),
//         success: json["success"] == "1" ? "true" : "false",
//         message: json["message"],
//         data: List<ProductDataList>.from(json["data"].map((x) => ProductDataList.fromJson(x))),
//       );
// }

// class ProductDataList {
//   List<ProductDataEntity> productData;
//   int pagination;
//   int sold;
//   int unSold;

//   ProductDataList({
//     required this.productData,
//     required this.pagination,
//     required this.sold,
//     required this.unSold,
//   });

//   factory ProductDataList.fromJson(Map<String, dynamic> json) => ProductDataList(
//         productData: List<ProductDataEntity>.from(json["ProductData"].map((x) => ProductDatum.fromJson(x))),
//         pagination: json["pagination"],
//         sold: json["Sold"],
//         unSold: json["UnSold"],
//       );
// }

// class ProductDatum extends ProductDataEntity {
//   final String id;
//   final String userId;
//   final String userName;
//   final String userProfile;
//   final String address;
//   final String contactNo;
//   final String websiteUrl;
//   final String longitude;
//   final String langitude;
//   final String categoryName;
//   final String subCategoryName;
//   final String name;
//   final String currency;
//   final String minPrice;
//   final String maxPrice;
//   final String discountPrice;
//   final String weight;
//   final String deliveryCharge;
//   final String description;
//   final String condition;
//   final String images;
//   final String negotiation;
//   final SoldStatus soldStatus;
//   final String productType;
//   final UserSince userSince;
//   final String creatAt;
//   final String productSave;
//   final String productReport;
//   final String averageRating;
//   final String totalUser;

//   const ProductDatum({
//     required this.id,
//     required this.userId,
//     required this.userName,
//     required this.userProfile,
//     required this.address,
//     required this.contactNo,
//     required this.websiteUrl,
//     required this.longitude,
//     required this.langitude,
//     required this.categoryName,
//     required this.subCategoryName,
//     required this.name,
//     required this.currency,
//     required this.minPrice,
//     required this.maxPrice,
//     required this.discountPrice,
//     required this.weight,
//     required this.deliveryCharge,
//     required this.description,
//     required this.condition,
//     required this.images,
//     required this.negotiation,
//     required this.soldStatus,
//     required this.productType,
//     required this.userSince,
//     required this.creatAt,
//     required this.productSave,
//     required this.productReport,
//     required this.averageRating,
//     required this.totalUser,
//   }) : super(
//           id: id,
//           userId: userId,
//           userName: userName,
//           userProfile: userProfile,
//           address: address,
//           contactNo: contactNo,
//           websiteUrl: websiteUrl,
//           longitude: longitude,
//           langitude: langitude,
//           categoryName: categoryName,
//           subCategoryName: subCategoryName,
//           name: name,
//           currency: currency,
//           minPrice: minPrice,
//           maxPrice: maxPrice,
//           discountPrice: discountPrice,
//           weight: weight,
//           deliveryCharge: deliveryCharge,
//           description: description,
//           condition: condition,
//           images: images,
//           negotiation: negotiation,
//           soldStatus: soldStatus,
//           productType: productType,
//           userSince: userSince,
//           creatAt: creatAt,
//           productSave: productSave,
//           productReport: productReport,
//           averageRating: averageRating,
//           totalUser: totalUser,
//         );

//   factory ProductDatum.fromJson(Map<String, dynamic> json) => ProductDatum(
//         id: json["Id"],
//         userId: json["UserId"],
//         userName: json["UserName"],
//         userProfile: json["UserProfile"],
//         address: json["Address"],
//         contactNo: json["ContactNo"],
//         websiteUrl: json["WebsiteUrl"],
//         longitude: json["Longitude"],
//         langitude: json["Langitude"],
//         categoryName: json["CategoryName"],
//         subCategoryName: json["SubCategoryName"],
//         name: json["Name"],
//         currency: json["Currency"],
//         minPrice: json["MinPrice"],
//         maxPrice: json["MaxPrice"],
//         discountPrice: json["DiscountPrice"],
//         weight: json["Weight"],
//         deliveryCharge: json["DeliveryCharge"],
//         description: json["Description"],
//         condition: json["Condition"],
//         images: json["Images"],
//         negotiation: json["Negotiation"],
//         soldStatus: soldStatusValues.map[json["SoldStatus"]]!,
//         productType: json["ProductType"],
//         userSince: userSinceValues.map[json["UserSince"]]!,
//         creatAt: json["CreatAt"],
//         productSave: json["ProductSave"],
//         productReport: json["ProductReport"],
//         averageRating: json["AverageRating"],
//         totalUser: json["TotalUser"],
//       );
// }

// enum SoldStatus { UNSOLD }

// final soldStatusValues = EnumValues({"Unsold": SoldStatus.UNSOLD});

// enum UserSince { AUGUST_2022, JANUARY_2022, MAY_2022, MAY_2023, NOVEMBER_2022, OCTOBER_2022, SEPTEMBER_2022 }

// final userSinceValues = EnumValues({
//   "August 2022": UserSince.AUGUST_2022,
//   "January 2022": UserSince.JANUARY_2022,
//   "May 2022": UserSince.MAY_2022,
//   "May 2023": UserSince.MAY_2023,
//   "November 2022": UserSince.NOVEMBER_2022,
//   "October 2022": UserSince.OCTOBER_2022,
//   "September 2022": UserSince.SEPTEMBER_2022
// });

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
