// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginationModel _$PaginationModelFromJson(Map<String, dynamic> json) =>
    _PaginationModel(
      hasNextCursor: json['hasNextCursor'] as bool,
      nextCursor: (json['nextCursor'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PaginationModelToJson(_PaginationModel instance) =>
    <String, dynamic>{
      'hasNextCursor': instance.hasNextCursor,
      'nextCursor': instance.nextCursor,
    };
