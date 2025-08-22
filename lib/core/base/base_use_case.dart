import 'package:flutter/material.dart';

@immutable
///[BaseUseCase] types are [T] for the return type, [U] for the return type with parameters,
///and [Params] for the parameters type and [Param] for the parameter type
abstract interface class BaseUseCase<T, U, Params, Param> {
  Future<U?>? executeWithParams(Params params);
  Future<T?>? execute(Param param);
}
