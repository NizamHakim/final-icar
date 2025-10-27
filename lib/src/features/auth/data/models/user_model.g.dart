// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  token: json['token'] as String,
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  email: json['email'] as String,
  tickets:
      (json['tickets'] as List<dynamic>?)
          ?.map((e) => TicketModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'tickets': instance.tickets,
    };
