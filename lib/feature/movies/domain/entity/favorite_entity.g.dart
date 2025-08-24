// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteEntity _$FavoriteEntityFromJson(Map<String, dynamic> json) =>
    FavoriteEntity(
      isFavorite: json['isFavorite'] as bool,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$FavoriteEntityToJson(FavoriteEntity instance) =>
    <String, dynamic>{
      'isFavorite': instance.isFavorite,
      'message': instance.message,
    };
