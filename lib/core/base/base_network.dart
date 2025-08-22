import 'dart:io';

abstract interface class BaseNetwork {
  Future<T> get<T>(String url, {Map<String, dynamic>? queryParameters});
  Future<T> post<T>(String url, {Map<String, dynamic>? body});
  Future<Map<String, dynamic>> uploadFile(
    File file, {
    required String endpoint,
    String? fieldName,
    Map<String, dynamic>? additionalData,
  });
}
