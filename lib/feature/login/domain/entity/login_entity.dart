import 'package:date_app/domain/entity/index.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'login_entity.g.dart';

@JsonSerializable()
@immutable
final class LoginEntity {
  final String token;
  final UserEntity user;

  const LoginEntity({
    required this.token,
    required this.user,
  });

  factory LoginEntity.fromJson(Map<String, dynamic> json) => _$LoginEntityFromJson(json);
  Map<String, dynamic> toJson() => _$LoginEntityToJson(this);
}
