import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:reelix/core/base/base_model.dart';

part 'movie_entity.g.dart';

@JsonSerializable()
@immutable
class MovieEntity extends Equatable implements BaseModel<MovieEntity> {
  @override
  final String? id;
  @JsonKey(name: 'Title')
  final String? title;
  @JsonKey(name: 'Plot')
  final String? description;
  @JsonKey(name: 'Poster')
  final String? posterUrl;
  @JsonKey(name: 'IsFavorite')
  final bool? isFavorite;

  const MovieEntity({
    this.id,
    this.title,
    this.description,
    this.posterUrl,
    this.isFavorite,
  });

  MovieEntity copyWith({
    String? id,
    String? title,
    String? description,
    String? posterUrl,
    bool? isFavorite,
  }) => MovieEntity(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    posterUrl: posterUrl ?? this.posterUrl,
    isFavorite: isFavorite ?? this.isFavorite,
  );

  factory MovieEntity.fromJson(Map<String, dynamic> json) =>
      _$MovieEntityFromJson(json);

  @override
  List<Object?> get props => [id, title, description, posterUrl, isFavorite];

  @override
  Map<String, dynamic> toJson() => _$MovieEntityToJson(this);
}
