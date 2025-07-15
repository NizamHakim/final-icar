// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_options_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReviewOptionsResponse _$ReviewOptionsResponseFromJson(
  Map<String, dynamic> json,
) => _ReviewOptionsResponse(
  reviewOptions: (json['reviewOptions'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(
      int.parse(k),
      (e as List<dynamic>).map((e) => e as String).toList(),
    ),
  ),
);

Map<String, dynamic> _$ReviewOptionsResponseToJson(
  _ReviewOptionsResponse instance,
) => <String, dynamic>{
  'reviewOptions': instance.reviewOptions.map(
    (k, e) => MapEntry(k.toString(), e),
  ),
};
