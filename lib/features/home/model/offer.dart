import 'package:json_annotation/json_annotation.dart';
import 'package:market/features/home/model/item.dart';

part 'offer.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class Offer extends Item {
  Offer({required super.name, required super.image});

  double? percent_discount;
  String? offerId;

  /// Connect the generated [_$OfferFromJson] function to the `fromJson`
  /// factory.
  factory Offer.fromJson(Map<String, dynamic> json, String? offerId) {
    return _$OfferFromJson({
      ...json,
      'offerId': offerId,
    });
  }

  /// Connect the generated [_$OfferToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$OfferToJson(this);
}
