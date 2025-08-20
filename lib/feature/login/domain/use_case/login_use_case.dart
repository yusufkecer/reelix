import 'package:date_app/core/index.dart';
import 'package:date_app/domain/index.dart';
import 'package:date_app/feature/login/domain/entity/login_params.dart';
import 'package:date_app/feature/login/domain/repository/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
@immutable
final class LoginUseCase implements BaseUseCase<AuthEntity, AuthEntity, LoginParams> {
  final LoginRepository _repository;

  const LoginUseCase(this._repository);

  @override
  Future<AuthEntity?>? executeWithParams(LoginParams params) {
    return _repository.executeWithParams(params);
  }

  @override
  Future<AuthEntity?>? execute() {
    throw UnimplementedError();
  }
}
