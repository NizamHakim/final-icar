// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => _ReviewModel(
  rating: (json['rating'] as num).toInt(),
  review: (json['review'] as List<dynamic>).map((e) => e as String).toList(),
  suggestion: json['suggestion'] as String,
);

Map<String, dynamic> _$ReviewModelToJson(_ReviewModel instance) =>
    <String, dynamic>{
      'rating': instance.rating,
      'review': instance.review,
      'suggestion': instance.suggestion,
    };
