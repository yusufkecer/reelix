import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:reelix/domain/entity/index.dart';

part 'auth_entity.g.dart';

@JsonSerializable()
@immutable
final class AuthEntity {
  final String? token;
  final UserEntity? user;
  final String? message;

  const AuthEntity({
    this.token,
    this.user,
    this.message,
  });

  AuthEntity copyWith({
    String? token,
    UserEntity? user,
    String? message,
  }) => AuthEntity(
    token: token ?? this.token,
    user: user ?? this.user,
    message: message ?? this.message,
  );

  factory AuthEntity.fromJson(Map<String, dynamic> json) =>
      _$AuthEntityFromJson(json);
  Map<String, dynamic> toJson() => _$AuthEntityToJson(this);
}
