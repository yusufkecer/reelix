// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesEntity _$MoviesEntityFromJson(Map<String, dynamic> json) => MoviesEntity(
  movies: (json['movies'] as List<dynamic>?)
      ?.map((e) => MovieEntity.fromJson(e as Map<String, dynamic>))
      .toList(),
  message: json['message'] as String?,
);

Map<String, dynamic> _$MoviesEntityToJson(MoviesEntity instance) =>
    <String, dynamic>{'movies': instance.movies, 'message': instance.message};
