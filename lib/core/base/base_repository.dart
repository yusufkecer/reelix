import 'package:flutter/material.dart';

@immutable
///[BaseRepository] types are [T] for the return type, [U] for the return type with parameters, and [Params] for the parameters
abstract interface class BaseRepository<T, U, Params> {
  Future<U?>? executeWithParams(Params params);
  Future<T?>? execute();
}
