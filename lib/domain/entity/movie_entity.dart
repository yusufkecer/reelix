import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:reelix/core/base/base_model.dart';

part 'movie_entity.g.dart';

@JsonSerializable()
@immutable
final class MovieEntity extends Equatable implements BaseModel<MovieEntity> {
  @override
  final String? id;
  final String? title;
  final String? description;
  final String? posterUrl;
  final bool? isFavorite;

  const MovieEntity({
    this.id,
    this.title,
    this.description,
    this.posterUrl,
    this.isFavorite,
  });

  factory MovieEntity.fromJson(Map<String, dynamic> json) =>
      _$MovieEntityFromJson(json);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() => _$MovieEntityToJson(this);
}
