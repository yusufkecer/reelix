import 'package:date_app/core/index.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

@immutable
final class NetworkManager implements BaseNetwork {
  final Dio _dio;

  NetworkManager({required Dio dio}) : _dio = dio {
    _setupDio();
  }

  void _setupDio() {
    _dio.options = NetworkModel(
      baseUrl: Env.url,
      timeout: const Duration(seconds: 30),
    );

    _dio.interceptors.addAll([
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (obj) => obj.logInfo('Network Request'),
      ),
      InterceptorsWrapper(
        onRequest: (options, handler) {
          _addAuthToken(options);
          return handler.next(options);
        },
        onError: (DioException e, handler) {
          handler.next(_mapDioError(e) as DioException);
        },
      ),
    ]);
  }

  void _addAuthToken(RequestOptions options) {}

  @override
  Future<T> get<T>(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      'fetching data from: $path'.logInfo('Network Request');
      final response = await _dio.get<T>(path, queryParameters: queryParameters);
      return _parseResponse<T>(response);
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  @override
  Future<T> post<T>(String path, {Map<String, dynamic>? body}) async {
    try {
      'sending data to: $path'.logInfo('Network Request');
      final response = await _dio.post<T>(path, data: body);
      return _parseResponse<T>(response);
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  T _parseResponse<T>(Response<T> response) {
    if (response.data == null) {
      throw NetworkException(message: 'Empty response', code: response.statusCode);
    }
    return response.data as T;
  }

  ApiException _mapDioError(DioException error) {
    return ApiException.fromDioError(error);
  }
}
