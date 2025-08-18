import 'package:dio/dio.dart';

/// Base API exception
abstract class ApiException implements Exception {
  final String message;

  ApiException(this.message);

  @override
  String toString() => message;

  factory ApiException.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkException.connectionTimeout();
      case DioExceptionType.cancel:
        return NetworkException.requestCancelled();
      case DioExceptionType.connectionError:
        return NetworkException.connectionError();
      case DioExceptionType.badCertificate:
        return NetworkException.badCertificate();
      case DioExceptionType.badResponse:
        return NetworkException.fromResponse(error.response);
      case DioExceptionType.unknown:
        return NetworkException.unknown(error.message ?? 'Unknown error');
    }
  }
}

class NetworkException extends ApiException {
  final int? code;
  final Map<String, dynamic>? errors;

  NetworkException({
    required String message,
    this.code,
    this.errors,
  }) : super(message);

  factory NetworkException.connectionTimeout() => NetworkException(message: 'Connection timeout', code: -1);

  factory NetworkException.requestCancelled() => NetworkException(message: 'Request cancelled', code: -1);

  factory NetworkException.connectionError() => NetworkException(message: 'Connection error', code: -1);

  factory NetworkException.badCertificate() => NetworkException(message: 'Bad certificate', code: -1);

  factory NetworkException.unknown([String? message]) =>
      NetworkException(message: message ?? 'Unknown error', code: -1);

  factory NetworkException.fromResponse(Response<dynamic>? response) {
    final statusCode = response?.statusCode;
    final data = response?.data;

    final message = _extractMessage(data);

    switch (statusCode) {
      case 400:
        return NetworkException(message: message ?? 'Bad request', code: 400);
      case 401:
        return NetworkException(message: message ?? 'Unauthorized', code: 401);
      case 403:
        return NetworkException(message: message ?? 'Forbidden', code: 403);
      case 404:
        return NetworkException(message: message ?? 'Not found', code: 404);
      case 409:
        return NetworkException(message: message ?? 'Conflict', code: 409);
      case 422:
        return NetworkException(
          message: message ?? 'Unprocessable entity',
          code: 422,
          errors: data is Map<String, dynamic> ? data['errors'] as Map<String, dynamic>? : null,
        );
      case 500:
        return NetworkException(message: message ?? 'Internal server error', code: 500);
      default:
        return NetworkException(message: message ?? 'Unknown error', code: statusCode);
    }
  }

  static String? _extractMessage(dynamic data) {
    if (data is Map<String, dynamic>) {
      return data['message'] as String? ?? data['error'] as String?;
    }
    return data?.toString();
  }

  @override
  String toString() => 'NetworkException(code: $code, message: $message)';
}
