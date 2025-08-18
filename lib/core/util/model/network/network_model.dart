import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final class NetworkModel extends BaseOptions {
  NetworkModel({
    required this.baseUrl,
    this.timeout = Durations.medium1,
  });

  @override
  final String baseUrl;

  final Duration timeout;

  @override
  Duration get connectTimeout => timeout;

  @override
  Duration get receiveTimeout => timeout;

  @override
  String toString() {
    return 'NetworkModel(baseUrl: $baseUrl, timeout: $timeout)';
  }
}
