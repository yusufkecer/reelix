// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieEntity _$MovieEntityFromJson(Map<String, dynamic> json) => MovieEntity(
  id: json['id'] as String?,
  title: json['title'] as String?,
  description: json['description'] as String?,
  posterUrl: json['posterUrl'] as String?,
  isFavorite: json['isFavorite'] as bool?,
);

Map<String, dynamic> _$MovieEntityToJson(MovieEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'posterUrl': instance.posterUrl,
      'isFavorite': instance.isFavorite,
    };
