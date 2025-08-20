import 'package:date_app/core/index.dart';
import 'package:date_app/domain/index.dart';
import 'package:date_app/feature/register/domain/entity/params_entity.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
@immutable
final class RegisterRepository implements BaseRepository<AuthEntity, AuthEntity, RegisterParams> {
  final NetworkManager _networkManager;

  const RegisterRepository(this._networkManager);

  @override
  Future<AuthEntity?> executeWithParams(RegisterParams params) async {
    final response = await _networkManager.post<Map<String, dynamic>>(
      'user/register',
      body: params.toJson(),
    );
    return AuthEntity.fromJson(response);
  }

  @override
  Future<AuthEntity?>? execute() {
    throw UnimplementedError();
  }
}
