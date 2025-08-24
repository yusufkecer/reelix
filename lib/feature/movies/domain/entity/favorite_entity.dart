import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'favorite_entity.g.dart';

@JsonSerializable()
@immutable
class FavoriteEntity extends Equatable {
  final bool isFavorite;
  final String? message;

  const FavoriteEntity({required this.isFavorite,  this.message});

  factory FavoriteEntity.fromJson(Map<String, dynamic> json) =>
      _$FavoriteEntityFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteEntityToJson(this);

  @override
  List<Object?> get props => [isFavorite, message];
}