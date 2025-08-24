import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:reelix/domain/index.dart';

part 'movies_entity.g.dart';

@JsonSerializable()
@immutable
final class MoviesEntity extends MovieEntity {
  const MoviesEntity({required this.movies, this.message, this.maxPage, this.perPage, this.totalCount, this.currentPage});
  final List<MovieEntity>? movies;
  final String? message;
  final int? maxPage;
  final int? perPage;
  final int? totalCount;
  final int? currentPage;

  factory MoviesEntity.fromJson(Map<String, dynamic> json) =>
      _$MoviesEntityFromJson(json);

  MoviesEntity copyWithMovies({
    List<MovieEntity>? movies,
    String? message,
    int? maxPage,
    int? perPage,
    int? totalCount,
    int? currentPage,
  }) => MoviesEntity(
    movies: movies ?? this.movies,
    message: message ?? this.message,
    maxPage: maxPage ?? this.maxPage,
    perPage: perPage ?? this.perPage,
    totalCount: totalCount ?? this.totalCount,
    currentPage: currentPage ?? this.currentPage,
  );

  @override
  Map<String, dynamic> toJson() => _$MoviesEntityToJson(this);

  @override
  List<Object?> get props => [movies, message, maxPage, perPage, totalCount, currentPage];
}
