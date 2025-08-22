import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'upload_photo_response.g.dart';

@JsonSerializable()
@immutable
final class UploadPhotoResponse extends Equatable {
  final String? photoUrl;
  final String? message;

  const UploadPhotoResponse({
    this.photoUrl,

    this.message,
  });

  factory UploadPhotoResponse.fromJson(Map<String, dynamic> json) => _$UploadPhotoResponseFromJson(json);

  @override
  List<Object?> get props => [photoUrl, message];
}
