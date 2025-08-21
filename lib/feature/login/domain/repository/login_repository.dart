import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:reelix/core/index.dart';
import 'package:reelix/domain/index.dart';
import 'package:reelix/feature/login/domain/entity/login_params.dart';

@injectable
@immutable
final class LoginRepository implements BaseRepository<AuthEntity, AuthEntity, LoginParams> {
  final NetworkManager _networkManager;

  const LoginRepository(this._networkManager);

  @override
  Future<AuthEntity?> executeWithParams(LoginParams params) async {
    final response = await _networkManager.post<Map<String, dynamic>?>(
      'user/login',
      body: params.toJson(),
    );
    'response1: $response'.logInfo('Login Repository');
    print("response: alsdfşialsdkf");
    print(response.runtimeType);
    if (response == null) {
      return const AuthEntity();
    }
    final responseData = response['response'] as Map<String, dynamic>;

    if (responseData['code'] != 200) {
      final authEntity = AuthEntity.fromJson(responseData);
      return authEntity;
    } else {
      final data = response['data'] as Map<String, dynamic>;
      final user = UserEntity.fromJson(data);
      final authEntity = AuthEntity.fromJson(data)..copyWith(user: user);
      return authEntity;
    }
  }

  @override
  Future<AuthEntity?>? execute() {
    throw UnimplementedError();
  }
}
