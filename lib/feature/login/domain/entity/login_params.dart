import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_params.g.dart';

@JsonSerializable()
@immutable
final class LoginParams {
  final String email;
  final String password;

  const LoginParams({
    required this.email,
    required this.password,
  });

  factory LoginParams.fromJson(Map<String, dynamic> json) =>
      _$LoginParamsFromJson(json);

  Map<String, dynamic> toJson() => _$LoginParamsToJson(this);
}
