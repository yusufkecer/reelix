import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:reelix/core/index.dart';

@lazySingleton
@immutable
final class NetworkManager implements BaseNetwork {
  final Dio _dio;
  final CacheManager _cacheManager;

  NetworkManager({required Dio dio, required CacheManager cacheManager}) : _dio = dio, _cacheManager = cacheManager {
    _setupDio();
  }

  void _setupDio() {
    'setup dio'.logInfo('Network Request');
    _dio.options = NetworkModel(
      baseUrl: Env.url,
      timeout: const Duration(seconds: 30),
    );

    _dio.options.followRedirects = true;
    _dio.options.maxRedirects = 5;
    _dio.options.validateStatus = (status) {
      return status != null && status < 500;
    };

    _dio.interceptors.addAll([
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          await _addAuthToken(options);
          return handler.next(options);
        },
        onError: (DioException e, handler) {
          handler.next(_mapDioError(e) as DioException);
        },
      ),
    ]);
  }

  Future<void> _addAuthToken(RequestOptions options) async {
    final token = await _cacheManager.getToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
  }

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
      'response: $response'.logInfo('Network Request');
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
