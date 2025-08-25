// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieEntity _$MovieEntityFromJson(Map<String, dynamic> json) => MovieEntity(
  id: json['id'] as String?,
  title: json['Title'] as String?,
  description: json['Plot'] as String?,
  posterUrl: json['Poster'] as String?,
  isFavorite: json['isFavorite'] as bool?,
  genre: json['Genre'] as String?,
);

Map<String, dynamic> _$MovieEntityToJson(MovieEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'Title': instance.title,
      'Plot': instance.description,
      'Poster': instance.posterUrl,
      'isFavorite': instance.isFavorite,
      'Genre': instance.genre,
    };
