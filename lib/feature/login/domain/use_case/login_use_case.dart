import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:reelix/core/index.dart';
import 'package:reelix/domain/index.dart';
import 'package:reelix/feature/login/domain/entity/login_params.dart';
import 'package:reelix/feature/login/domain/repository/login_repository.dart';

@injectable
@immutable
final class LoginUseCase
    implements BaseUseCase<AuthEntity, AuthEntity, LoginParams, LoginParams> {
  final LoginRepository _repository;

  const LoginUseCase(this._repository);

  @override
  Future<AuthEntity?>? executeWithParams(LoginParams params) {
    return _repository.executeWithParams(params);
  }

  @override
  Future<AuthEntity?>? execute({LoginParams? param}) {
    throw UnimplementedError();
  }
}
