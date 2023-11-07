// To parse this JSON data, do
//
//     final sugarApi = sugarApiFromJson(jsonString);

// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter_application_api/features/home/domain/entities/home_data_entities.dart';

class ProductModel {
  int? statusId;
  Resbody? resbody;

  ProductModel({
    this.statusId,
    this.resbody,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        statusId: json["statusId"],
        resbody: json["resbody"] == null ? null : Resbody.fromJson(json["resbody"]),
      );
}

class Resbody {
  int? totalSectionCount;
  List<ProductDataEntity>? sections;

  Resbody({
    this.totalSectionCount,
    this.sections,
  });

  factory Resbody.fromJson(Map<String, dynamic> json) => Resbody(
        totalSectionCount: json["totalSectionCount"],
        sections: json["sections"] == null ? [] : List<ProductDataEntity>.from(json["sections"]!.map((x) => Section.fromJson(x))),
      );
}

// ignore: must_be_immutable
class Section extends ProductDataEntity {
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

  Section({
    this.id,
    this.title,
    this.sequence,
    this.layoutType,
    this.isTitleEnabled,
    this.backgroundImg,
    this.backgroundColor,
    this.text,
    this.contentType,
    this.contentData,
  }) : super(
          id: id ?? 0,
          title: title??'',
          sequence: sequence??0,
          layoutType: layoutType??0,
          isTitleEnabled: isTitleEnabled??0,
          backgroundImg: backgroundImg??"",
          backgroundColor: backgroundColor??"",
          text: text?? '',
          contentType:contentType??  0,
          contentData: contentData?? [],
        );

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        id: json["id"],
        title: json["title"],
        sequence: json["sequence"],
        layoutType: json["layoutType"],
        isTitleEnabled: json["isTitleEnabled"],
        backgroundImg: json["backgroundImg"],
        backgroundColor: json["backgroundColor"],
        text: json["text"],
        contentType: json["contentType"],
        contentData: json["contentData"] == null
            ? []
            : List<ContentDatum>.from(json["contentData"]!.map((x) => ContentDatum.fromJson(x))),
      );
}

class ContentDatum {
  int? id;
  dynamic sectionId;
  String? webViewTitle;
  int? contentType;
  String? mediaUrl;
  String? prefix;
  ProductJson? productJson;
  String? mediaText;
  String? youtubeId;
  String? altText;
  String? hiddenText;
  String? redirectUrl;
  String? startDate;
  String? endDate;
  dynamic offerText;
  String? isTimerEnable;

  ContentDatum({
    this.id,
    this.sectionId,
    this.webViewTitle,
    this.contentType,
    this.mediaUrl,
    this.prefix,
    this.productJson,
    this.mediaText,
    this.youtubeId,
    this.altText,
    this.hiddenText,
    this.redirectUrl,
    this.startDate,
    this.endDate,
    this.offerText,
    this.isTimerEnable,
  });

  factory ContentDatum.fromJson(Map<String, dynamic> json) => ContentDatum(
        id: json["id"],
        sectionId: json["sectionId"],
        webViewTitle: json["webViewTitle"],
        contentType: json["contentType"],
        mediaUrl: json["mediaUrl"],
        prefix: json["prefix"],
        productJson: json["product_json"] == null ? null : ProductJson.fromJson(json["product_json"]),
        mediaText: json["mediaText"],
        youtubeId: json["youtube_id"],
        altText: json["altText"],
        hiddenText: json["hiddenText"],
        redirectUrl: json["redirectUrl"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        offerText: json["offerText"],
        isTimerEnable: json["isTimerEnable"],
      );
}

class ProductJson {
  int? id;
  String? title;
  dynamic bodyHtml;
  String? vendor;
  String? productType;
  DateTime? createdAt;
  String? handle;
  DateTime? updatedAt;
  DateTime? publishedAt;
  String? templateSuffix;
  String? publishedScope;
  String? tags;
  String? status;
  String? adminGraphqlApiId;
  List<Variant>? variants;
  List<Option>? options;
  List<dynamic>? images;
  Image? image;
  int? sugarType;
  bool? isComboProduct;
  List<SugarOption>? sugarOptions;
  String? youtubeId;
  dynamic htmlBodyV2;
  List<dynamic>? faqs;
  String? productFeature;
  Rating? rating;

  ProductJson({
    this.id,
    this.title,
    this.bodyHtml,
    this.vendor,
    this.productType,
    this.createdAt,
    this.handle,
    this.updatedAt,
    this.publishedAt,
    this.templateSuffix,
    this.publishedScope,
    this.tags,
    this.status,
    this.adminGraphqlApiId,
    this.variants,
    this.options,
    this.images,
    this.image,
    this.sugarType,
    this.isComboProduct,
    this.sugarOptions,
    this.youtubeId,
    this.htmlBodyV2,
    this.faqs,
    this.productFeature,
    this.rating,
  });

  factory ProductJson.fromJson(Map<String, dynamic> json) => ProductJson(
        id: json["id"],
        title: json["title"],
        bodyHtml: json["body_html"],
        vendor: json["vendor"],
        productType: json["product_type"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        handle: json["handle"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        publishedAt: json["published_at"] == null ? null : DateTime.parse(json["published_at"]),
        templateSuffix: json["template_suffix"],
        publishedScope: json["published_scope"],
        tags: json["tags"],
        status: json["status"],
        adminGraphqlApiId: json["admin_graphql_api_id"],
        variants: json["variants"] == null ? [] : List<Variant>.from(json["variants"]!.map((x) => Variant.fromJson(x))),
        options: json["options"] == null ? [] : List<Option>.from(json["options"]!.map((x) => Option.fromJson(x))),
        images: json["images"] == null ? [] : List<dynamic>.from(json["images"]!.map((x) => x)),
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        sugarType: json["sugar_type"],
        isComboProduct: json["is_combo_product"],
        sugarOptions: json["sugar_options"] == null
            ? []
            : List<SugarOption>.from(json["sugar_options"]!.map((x) => SugarOption.fromJson(x))),
        youtubeId: json["youtube_id"],
        htmlBodyV2: json["html_body_v2"],
        faqs: json["faqs"] == null ? [] : List<dynamic>.from(json["faqs"]!.map((x) => x)),
        productFeature: json["productFeature"],
        rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
      );
}

class Image {
  int? id;
  int? productId;
  int? position;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? alt;
  int? width;
  int? height;
  String? src;
  List<int>? variantIds;
  String? adminGraphqlApiId;

  Image({
    this.id,
    this.productId,
    this.position,
    this.createdAt,
    this.updatedAt,
    this.alt,
    this.width,
    this.height,
    this.src,
    this.variantIds,
    this.adminGraphqlApiId,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        productId: json["product_id"],
        position: json["position"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        alt: json["alt"],
        width: json["width"],
        height: json["height"],
        src: json["src"],
        variantIds: json["variant_ids"] == null ? [] : List<int>.from(json["variant_ids"]!.map((x) => x)),
        adminGraphqlApiId: json["admin_graphql_api_id"],
      );
}

class Option {
  int? id;
  int? productId;
  String? name;
  int? position;
  List<String>? values;

  Option({
    this.id,
    this.productId,
    this.name,
    this.position,
    this.values,
  });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: json["id"],
        productId: json["product_id"],
        name: json["name"],
        position: json["position"],
        values: json["values"] == null ? [] : List<String>.from(json["values"]!.map((x) => x)),
      );
}

class Rating {
  double? average;
  int? count;
  List<Review>? reviews;

  Rating({
    this.average,
    this.count,
    this.reviews,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        average: json["average"]?.toDouble(),
        count: json["count"],
        reviews: json["reviews"] == null ? [] : List<Review>.from(json["reviews"]!.map((x) => Review.fromJson(x))),
      );
}

class Review {
  Review();

  factory Review.fromJson(Map<String, dynamic> json) => Review();

  Map<String, dynamic> toJson() => {};
}

class SugarOption {
  String? title;
  int? swatch;
  List<Product>? products;

  SugarOption({
    this.title,
    this.swatch,
    this.products,
  });

  factory SugarOption.fromJson(Map<String, dynamic> json) => SugarOption(
        title: json["title"],
        swatch: json["swatch"],
        products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
      );
}

class Product {
  int? id;
  int? productId;
  String? title;
  String? price;
  String? sku;
  int? position;
  String? inventoryPolicy;
  String? compareAtPrice;
  String? fulfillmentService;
  String? inventoryManagement;
  String? option1;
  dynamic option2;
  dynamic option3;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? taxable;
  String? barcode;
  int? grams;
  int? imageId;
  double? weight;
  String? weightUnit;
  int? inventoryItemId;
  int? inventoryQuantity;
  int? oldInventoryQuantity;
  bool? requiresShipping;
  String? adminGraphqlApiId;
  bool? isSelected;
  String? parentTitle;
  int? swatchType;
  String? hexCode;
  String? swatchUrl;
  List<String>? images;

  Product({
    this.id,
    this.productId,
    this.title,
    this.price,
    this.sku,
    this.position,
    this.inventoryPolicy,
    this.compareAtPrice,
    this.fulfillmentService,
    this.inventoryManagement,
    this.option1,
    this.option2,
    this.option3,
    this.createdAt,
    this.updatedAt,
    this.taxable,
    this.barcode,
    this.grams,
    this.imageId,
    this.weight,
    this.weightUnit,
    this.inventoryItemId,
    this.inventoryQuantity,
    this.oldInventoryQuantity,
    this.requiresShipping,
    this.adminGraphqlApiId,
    this.isSelected,
    this.parentTitle,
    this.swatchType,
    this.hexCode,
    this.swatchUrl,
    this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        productId: json["product_id"],
        title: json["title"],
        price: json["price"],
        sku: json["sku"],
        position: json["position"],
        inventoryPolicy: json["inventory_policy"],
        compareAtPrice: json["compare_at_price"],
        fulfillmentService: json["fulfillment_service"],
        inventoryManagement: json["inventory_management"],
        option1: json["option1"],
        option2: json["option2"],
        option3: json["option3"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        taxable: json["taxable"],
        barcode: json["barcode"],
        grams: json["grams"],
        imageId: json["image_id"],
        weight: json["weight"]?.toDouble(),
        weightUnit: json["weight_unit"],
        inventoryItemId: json["inventory_item_id"],
        inventoryQuantity: json["inventory_quantity"],
        oldInventoryQuantity: json["old_inventory_quantity"],
        requiresShipping: json["requires_shipping"],
        adminGraphqlApiId: json["admin_graphql_api_id"],
        isSelected: json["isSelected"],
        parentTitle: json["parent_title"],
        swatchType: json["swatch_type"],
        hexCode: json["hexCode"],
        swatchUrl: json["swatch_url"],
        images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
      );
}

class Variant {
  int? id;
  int? productId;
  String? title;
  String? price;
  String? sku;
  int? position;
  String? inventoryPolicy;
  String? compareAtPrice;
  String? fulfillmentService;
  String? inventoryManagement;
  String? option1;
  dynamic option2;
  dynamic option3;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? taxable;
  String? barcode;
  int? grams;
  int? imageId;
  int? weight;
  String? weightUnit;
  dynamic inventoryItemId;
  int? inventoryQuantity;
  int? oldInventoryQuantity;
  bool? requiresShipping;
  String? adminGraphqlApiId;
  String? dispatchDate;
  String? dispatchLabel;
  bool? isSelected;
  List<dynamic>? images;
  bool? freeShipping;
  List<dynamic>? offers;
  int? variantId;
  String? handle;
  int? swatchType;
  String? hexCode;
  String? swatchUrl;

  Variant({
    this.id,
    this.productId,
    this.title,
    this.price,
    this.sku,
    this.position,
    this.inventoryPolicy,
    this.compareAtPrice,
    this.fulfillmentService,
    this.inventoryManagement,
    this.option1,
    this.option2,
    this.option3,
    this.createdAt,
    this.updatedAt,
    this.taxable,
    this.barcode,
    this.grams,
    this.imageId,
    this.weight,
    this.weightUnit,
    this.inventoryItemId,
    this.inventoryQuantity,
    this.oldInventoryQuantity,
    this.requiresShipping,
    this.adminGraphqlApiId,
    this.dispatchDate,
    this.dispatchLabel,
    this.isSelected,
    this.images,
    this.freeShipping,
    this.offers,
    this.variantId,
    this.handle,
    this.swatchType,
    this.hexCode,
    this.swatchUrl,
  });

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        id: json["id"],
        productId: json["product_id"],
        title: json["title"],
        price: json["price"],
        sku: json["sku"],
        position: json["position"],
        inventoryPolicy: json["inventory_policy"],
        compareAtPrice: json["compare_at_price"],
        fulfillmentService: json["fulfillment_service"],
        inventoryManagement: json["inventory_management"],
        option1: json["option1"],
        option2: json["option2"],
        option3: json["option3"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        taxable: json["taxable"],
        barcode: json["barcode"],
        grams: json["grams"],
        imageId: json["image_id"],
        weight: json["weight"],
        weightUnit: json["weight_unit"],
        inventoryItemId: json["inventory_item_id"],
        inventoryQuantity: json["inventory_quantity"],
        oldInventoryQuantity: json["old_inventory_quantity"],
        requiresShipping: json["requires_shipping"],
        adminGraphqlApiId: json["admin_graphql_api_id"],
        dispatchDate: json["dispatch_date"],
        dispatchLabel: json["dispatch_label"],
        isSelected: json["isSelected"],
        images: json["images"] == null ? [] : List<dynamic>.from(json["images"]!.map((x) => x)),
        freeShipping: json["free_shipping"],
        offers: json["offers"] == null ? [] : List<dynamic>.from(json["offers"]!.map((x) => x)),
        variantId: json["variant_id"],
        handle: json["handle"],
        swatchType: json["swatch_type"],
        hexCode: json["hexCode"],
        swatchUrl: json["swatch_url"],
      );
}
