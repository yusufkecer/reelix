import 'package:date_app/core/index.dart';
import 'package:date_app/feature/login/domain/entity/login_entity.dart';
import 'package:date_app/feature/login/domain/entity/login_params.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
@immutable
final class LoginRepository implements BaseRepository<LoginEntity, LoginEntity, LoginParams> {
  final NetworkManager _networkManager;

  const LoginRepository(this._networkManager);

  @override
  Future<LoginEntity?> executeWithParams(LoginParams params) async {
    final response = await _networkManager.post<Map<String, dynamic>>(
      'user/login',
      body: params.toJson(),
    );
    return LoginEntity.fromJson(response);
  }

  @override
  Future<LoginEntity?>? execute() {
    throw UnimplementedError();
  }
}
