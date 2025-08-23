import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:reelix/domain/index.dart';

part 'movies_entity.g.dart';

@JsonSerializable()
@immutable
final class MoviesEntity extends MovieEntity {
  const MoviesEntity({required this.movies, this.message});
  final List<MovieEntity>? movies;
  final String? message;

  factory MoviesEntity.fromJson(Map<String, dynamic> json) =>
      _$MoviesEntityFromJson(json);

  MoviesEntity copyWith({
    List<MovieEntity>? movies,
    String? message,
  }) => MoviesEntity(
    movies: movies ?? this.movies,
    message: message ?? this.message,
  );

  @override
  Map<String, dynamic> toJson() => _$MoviesEntityToJson(this);

  @override
  List<Object?> get props => [movies, message];
}
