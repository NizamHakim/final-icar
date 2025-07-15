// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_success_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthSuccessResponse _$AuthSuccessResponseFromJson(Map<String, dynamic> json) =>
    _AuthSuccessResponse(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String,
    );

Map<String, dynamic> _$AuthSuccessResponseToJson(
  _AuthSuccessResponse instance,
) => <String, dynamic>{'user': instance.user, 'token': instance.token};
