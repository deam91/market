// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map json) => Product(
      name: json['name'] as String,
      image: json['image'] as String,
    )
      ..productId = json['productId'] as String?
      ..price = (json['price'] as num?)?.toDouble()
      ..offers =
          (json['offers'] as List<dynamic>?)?.map((e) => e as String).toList()
      ..details = (json['details'] as List<dynamic>?)
          ?.map((e) =>
              ProductDetail.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList()
      ..supplies = (json['supplies'] as List<dynamic>?)
          ?.map(
              (e) => SupplyDetail.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList()
      ..quantity = json['quantity'] as int?
      ..maxQuantityPerOrder = json['maxQuantityPerOrder'] as int?
      ..createdAt = timestampConverter.fromJson(json['createdAt']);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'productId': instance.productId,
      'price': instance.price,
      'offers': instance.offers,
      'details': instance.details?.map((e) => e.toJson()).toList(),
      'supplies': instance.supplies?.map((e) => e.toJson()).toList(),
      'quantity': instance.quantity,
      'maxQuantityPerOrder': instance.maxQuantityPerOrder,
      'createdAt': timestampConverter.toJson(instance.createdAt),
    };

ProductDetail _$ProductDetailFromJson(Map<String, dynamic> json) =>
    ProductDetail()
      ..title = json['title'] as String?
      ..description = json['description'] as String?;

Map<String, dynamic> _$ProductDetailToJson(ProductDetail instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
    };

SupplyDetail _$SupplyDetailFromJson(Map json) => SupplyDetail()
  ..title = json['title'] as String?
  ..steps = (json['steps'] as List<dynamic>?)
      ?.map((e) => SupplyStep.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList()
  ..createdAt = timestampConverter.fromJson(json['createdAt']);

Map<String, dynamic> _$SupplyDetailToJson(SupplyDetail instance) =>
    <String, dynamic>{
      'title': instance.title,
      'steps': instance.steps?.map((e) => e.toJson()).toList(),
      'createdAt': timestampConverter.toJson(instance.createdAt),
    };

SupplyStep _$SupplyStepFromJson(Map json) => SupplyStep()
  ..title = json['title'] as String?
  ..image = json['image'] as String?
  ..message = json['message'] as String?
  ..date = timestampConverter.fromJson(json['date'])
  ..location = json['location'] as String?
  ..createdAt = timestampConverter.fromJson(json['createdAt']);

Map<String, dynamic> _$SupplyStepToJson(SupplyStep instance) =>
    <String, dynamic>{
      'title': instance.title,
      'image': instance.image,
      'message': instance.message,
      'date': timestampConverter.toJson(instance.date),
      'location': instance.location,
      'createdAt': timestampConverter.toJson(instance.createdAt),
    };
