// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  token: json['token'] as String,
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  email: json['email'] as String,
  password: json['password'] as String,
  tickets:
      (json['tickets'] as List<dynamic>?)
          ?.map((e) => Ticket.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'token': instance.token,
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'password': instance.password,
  'tickets': instance.tickets,
};
