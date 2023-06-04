// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Offer _$OfferFromJson(Map json) => Offer(
      name: json['name'] as String,
      image: json['image'] as String,
    )
      ..percent_discount = (json['percent_discount'] as num?)?.toDouble()
      ..offerId = json['offerId'] as String?;

Map<String, dynamic> _$OfferToJson(Offer instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'percent_discount': instance.percent_discount,
      'offerId': instance.offerId,
    };
