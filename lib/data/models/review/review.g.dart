// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Review _$ReviewFromJson(Map<String, dynamic> json) => _Review(
  rating: (json['rating'] as num).toInt(),
  review: (json['review'] as List<dynamic>).map((e) => e as String).toList(),
  suggestion: json['suggestion'] as String,
);

Map<String, dynamic> _$ReviewToJson(_Review instance) => <String, dynamic>{
  'rating': instance.rating,
  'review': instance.review,
  'suggestion': instance.suggestion,
};
