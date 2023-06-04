import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

const timestampConverter = TimestampConverter();

class TimestampConverter extends JsonConverter<Timestamp?, dynamic> {
  const TimestampConverter();

  @override
  Timestamp? fromJson(dynamic json) {
    if (json is Timestamp) return json;
    if (json is Map) {
      final map = Map<String, dynamic>.from(json);
      final seconds = map['_seconds'] as int;
      final nanoseconds = map['_nanoseconds'] as int;
      return Timestamp(seconds, nanoseconds);
    }
    return null;
  }

  @override
  dynamic toJson(Timestamp? object) {
    return object?.toDate().toString() ?? '';
  }
}