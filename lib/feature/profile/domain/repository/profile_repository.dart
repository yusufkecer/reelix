import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:reelix/core/index.dart';
import 'package:reelix/domain/index.dart';

@injectable
@immutable
final class ProfileRepository
    implements
        BaseRepository<UserEntity, List<MovieEntity>, MovieEntity, UserEntity> {
  final NetworkManager _networkManager;

  const ProfileRepository(this._networkManager);

  @override
  Future<UserEntity?> execute({UserEntity? param}) async {
    try {
      final response = await _networkManager.get<Map<String, dynamic>>(
        '/user/profile',
      );

      if (response.isEmpty) return null;
      final res = response['data'] as Map<String, dynamic>;
      'res: $res'.logInfo();
      final user = UserEntity.fromJson(res);

      return user;
    } catch (e) {
      throw NetworkException(message: e.toString());
    }
  }

  @override
  Future<List<MovieEntity>?> executeWithParams(MovieEntity? params) async {
    try {
      final response = await _networkManager.get<Map<String, dynamic>>(
        '/user/favorite-movies',
      );
      if (response.isNotEmpty) return null;
      final res = response['data'] as Map<String, dynamic>;

      final movies = (res['movies'] as List<dynamic>)
          .map((e) => MovieEntity.fromJson(e as Map<String, dynamic>))
          .toList();

      return movies;
    } catch (e) {
      throw NetworkException(message: e.toString());
    }
  }
}
