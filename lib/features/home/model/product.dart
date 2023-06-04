import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:market/core/utils/constants.dart';
import 'package:market/features/home/model/item.dart';

part 'product.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class Product extends Item {
  Product({required super.name, required super.image});

  String? productId;
  double? price;
  List<String>? offers;
  List<ProductDetail>? details;
  List<SupplyDetail>? supplies;
  int? quantity;
  int? maxQuantityPerOrder;

  @timestampConverter
  Timestamp? createdAt;

  /// Connect the generated [_$ProductFromJson] function to the `fromJson`
  /// factory.
  factory Product.fromJson(Map<String, dynamic> json, String? productId) {
    return _$ProductFromJson({
      ...json,
      'productId': productId,
    });
  }

  /// Connect the generated [_$ProductToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class ProductDetail {
  ProductDetail();

  String? title;
  String? description;

  /// Connect the generated [_$ProductDetailFromJson] function to the `fromJson`
  /// factory.
  factory ProductDetail.fromJson(Map<String, dynamic> json) {
    return _$ProductDetailFromJson(json);
  }

  /// Connect the generated [_$ProductDetailToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ProductDetailToJson(this);
}

@JsonSerializable(anyMap: true, explicitToJson: true)
class SupplyDetail {
  SupplyDetail();

  String? title;
  List<SupplyStep>? steps;

  @timestampConverter
  Timestamp? createdAt;

  /// Connect the generated [_$SupplyDetailFromJson] function to the `fromJson`
  /// factory.
  factory SupplyDetail.fromJson(Map<String, dynamic> json) {
    return _$SupplyDetailFromJson(json);
  }

  /// Connect the generated [_$SupplyDetailToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SupplyDetailToJson(this);
}

@JsonSerializable(anyMap: true, explicitToJson: true)
class SupplyStep {
  SupplyStep();

  String? title;
  String? image;
  String? message;
  @timestampConverter
  Timestamp? date;
  String? location;

  @timestampConverter
  Timestamp? createdAt;

  /// Connect the generated [_$SupplyStepFromJson] function to the `fromJson`
  /// factory.
  factory SupplyStep.fromJson(Map<String, dynamic> json) {
    return _$SupplyStepFromJson(json);
  }

  /// Connect the generated [_$SupplyStepToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SupplyStepToJson(this);
}
