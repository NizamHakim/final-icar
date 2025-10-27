// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exception.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnauthorizedException _$UnauthorizedExceptionFromJson(
  Map<String, dynamic> json,
) => UnauthorizedException(
  statusCode: statusCodeConverter(json['statusCode'] as String),
  message: json['message'] as String,
);

Map<String, dynamic> _$UnauthorizedExceptionToJson(
  UnauthorizedException instance,
) => <String, dynamic>{
  'statusCode': instance.statusCode,
  'message': instance.message,
};

NotFoundException _$NotFoundExceptionFromJson(Map<String, dynamic> json) =>
    NotFoundException(
      statusCode: statusCodeConverter(json['statusCode'] as String),
      message: json['message'] as String,
    );

Map<String, dynamic> _$NotFoundExceptionToJson(NotFoundException instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
    };

UnprocessableContentException _$UnprocessableContentExceptionFromJson(
  Map<String, dynamic> json,
) => UnprocessableContentException(
  statusCode: statusCodeConverter(json['statusCode'] as String),
  message: json['message'] as String,
  errors: Map<String, String>.from(json['errors'] as Map),
);

Map<String, dynamic> _$UnprocessableContentExceptionToJson(
  UnprocessableContentException instance,
) => <String, dynamic>{
  'statusCode': instance.statusCode,
  'message': instance.message,
  'errors': instance.errors,
};

InternalServerErrorException _$InternalServerErrorExceptionFromJson(
  Map<String, dynamic> json,
) => InternalServerErrorException(
  statusCode: statusCodeConverter(json['statusCode'] as String),
  message: json['message'] as String,
);

Map<String, dynamic> _$InternalServerErrorExceptionToJson(
  InternalServerErrorException instance,
) => <String, dynamic>{
  'statusCode': instance.statusCode,
  'message': instance.message,
};
