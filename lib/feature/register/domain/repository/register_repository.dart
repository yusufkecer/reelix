import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:reelix/core/index.dart';
import 'package:reelix/domain/index.dart';
import 'package:reelix/feature/register/domain/entity/params_entity.dart';

@injectable
@immutable
final class RegisterRepository implements BaseRepository<AuthEntity, AuthEntity, RegisterParams,RegisterParams> {
  final NetworkManager _networkManager;

  const RegisterRepository(this._networkManager);

  @override
  Future<AuthEntity?> executeWithParams(RegisterParams params) async {
    final response = await _networkManager.post<Map<String, dynamic>>(
      'user/register',
      body: params.toJson(),
    );
    'response: $response'.logInfo('Register Repository');
    final responseData = response['response'] as Map<String, dynamic>;
    if (responseData['code'] != 200) {
      final authEntity = AuthEntity.fromJson(responseData);
      return authEntity;
    }
    final data = response['data'] as Map<String, dynamic>;
    final user = UserEntity.fromJson(data);
    final authEntity = AuthEntity.fromJson(data)..copyWith(user: user);
    return authEntity;
  }

  @override
  Future<AuthEntity?>? execute({RegisterParams? param}) {
    throw UnimplementedError();
  }
}
