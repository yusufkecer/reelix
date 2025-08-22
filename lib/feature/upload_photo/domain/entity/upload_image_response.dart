import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'upload_image_response.g.dart';

@JsonSerializable()
@immutable
final class UploadImageResponse extends Equatable {
  final String photoUrl;
  final String? message;

  const UploadImageResponse({
    required this.photoUrl,

    this.message,
  });

  factory UploadImageResponse.fromJson(Map<String, dynamic> json) => _$UploadImageResponseFromJson(json);

  @override
  List<Object?> get props => [photoUrl, message];
}
