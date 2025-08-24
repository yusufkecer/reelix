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
  maxPage: (json['maxPage'] as num?)?.toInt(),
  perPage: (json['perPage'] as num?)?.toInt(),
  totalCount: (json['totalCount'] as num?)?.toInt(),
  currentPage: (json['currentPage'] as num?)?.toInt(),
);

Map<String, dynamic> _$MoviesEntityToJson(MoviesEntity instance) =>
    <String, dynamic>{
      'movies': instance.movies,
      'message': instance.message,
      'maxPage': instance.maxPage,
      'perPage': instance.perPage,
      'totalCount': instance.totalCount,
      'currentPage': instance.currentPage,
    };
