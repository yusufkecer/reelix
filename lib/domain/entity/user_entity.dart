import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:reelix/core/index.dart';

part 'user_entity.g.dart';

@JsonSerializable()
@immutable
final class UserEntity extends Equatable implements BaseModel<UserEntity> {
  @override
  final String id;
  final String email;
  final String name;

  const UserEntity({
    required this.id,
    required this.email,
    required this.name,
  });

  @override
  String toString() => 'UserEntity(id: $id, email: $email, name: $name)';

  @override
  List<Object?> get props => [id, email, name];

  @override
  Map<String, dynamic> toJson() => _$UserEntityToJson(this);

  @override
  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}
