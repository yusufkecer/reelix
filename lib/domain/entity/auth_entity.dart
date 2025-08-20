import 'package:date_app/domain/entity/index.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'auth_entity.g.dart';

@JsonSerializable()
@immutable
final class AuthEntity {
  final String token;
  final UserEntity user;

  const AuthEntity({
    required this.token,
    required this.user,
  });

    factory AuthEntity.fromJson(Map<String, dynamic> json) => _$AuthEntityFromJson(json);
  Map<String, dynamic> toJson() => _$AuthEntityToJson(this);
}
