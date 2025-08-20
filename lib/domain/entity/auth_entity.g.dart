// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthEntity _$AuthEntityFromJson(Map<String, dynamic> json) => AuthEntity(
  token: json['token'] as String,
  user: UserEntity.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AuthEntityToJson(AuthEntity instance) => <String, dynamic>{
  'token': instance.token,
  'user': instance.user,
};
