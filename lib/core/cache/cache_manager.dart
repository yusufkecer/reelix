import 'package:injectable/injectable.dart';
import 'package:reelix/core/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
final class CacheManager implements Cache {
  late final SharedPreferences _preferences;
  @override
  Future<void> delete(String key) async {
    await _preferences.remove(key);
  }

  @override
  Future<String?> getString(String key) async {
    return _preferences.getString(key);
  }

  @override
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  @override
  Future<void> saveString(String key, String value) async {
    await _preferences.setString(key, value);
  }

  @override
  Future<String?> getToken() async {
    return _preferences.getString('token');
  }

  @override
  Future<void> saveToken(String token) {
    return _preferences.setString('token', token);
  }
}
