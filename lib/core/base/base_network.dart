abstract interface class BaseNetwork {
  Future<T> get<T>(String url, {Map<String, dynamic>? queryParameters});
  Future<T> post<T>(String url, {Map<String, dynamic>? body});
}
