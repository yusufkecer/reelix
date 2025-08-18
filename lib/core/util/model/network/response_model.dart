import 'package:flutter/material.dart';

@immutable
final class ResponseModel<T> {
  const ResponseModel({
    required this.data,
    this.message,
    this.statusCode,
  });

  final T data;
  final String? message;
  final int? statusCode;
}
