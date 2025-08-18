import 'package:flutter/material.dart';

@immutable
abstract interface class Cache {
  Future<void> saveString(String key, String value);
  Future<String?> getString(String key);

  Future<void> delete(String key);

  Future<void> init();
}
