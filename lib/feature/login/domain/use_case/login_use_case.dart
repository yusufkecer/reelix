import 'package:date_app/core/index.dart';
import 'package:date_app/feature/login/domain/entity/login_entity.dart';
import 'package:date_app/feature/login/domain/entity/login_params.dart';
import 'package:date_app/feature/login/domain/repository/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
@immutable
final class LoginUseCase implements BaseUseCase<LoginEntity, LoginEntity, LoginParams> {
  final LoginRepository _repository;

  const LoginUseCase(this._repository);

  @override
  Future<LoginEntity?>? executeWithParams(LoginParams params) {
    return _repository.executeWithParams(params);
  }

  @override
  Future<LoginEntity?>? execute() {
    throw UnimplementedError();
  }
}
