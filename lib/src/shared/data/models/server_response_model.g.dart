// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServerResponseModel _$ServerResponseModelFromJson(Map<String, dynamic> json) =>
    _ServerResponseModel(
      statusCode: statusCodeConverter(json['statusCode'] as String),
      data: json['data'],
      message: json['message'] as String?,
      pagination:
          json['pagination'] == null
              ? null
              : PaginationModel.fromJson(
                json['pagination'] as Map<String, dynamic>,
              ),
    );

Map<String, dynamic> _$ServerResponseModelToJson(
  _ServerResponseModel instance,
) => <String, dynamic>{
  'statusCode': instance.statusCode,
  'data': instance.data,
  'message': instance.message,
  'pagination': instance.pagination,
};
