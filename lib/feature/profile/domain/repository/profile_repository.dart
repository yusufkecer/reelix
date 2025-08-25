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
    final updatedMovies = <MovieEntity>[];
    final response = await _networkManager.get<Map<String, dynamic>>(
      '/movie/favorites',
    );
    'response: $response'.logInfo();
    final res = response['response'] as Map<String, dynamic>;
    if (response.isEmpty && res['code'] != 200) return null;
    final data = response['data'] as List<dynamic>;

    final movies = data
        .map((e) => MovieEntity.fromJson(e as Map<String, dynamic>))
        .toList();

    for (final movieData in movies) {
      if (movieData.posterUrl != null &&
          movieData.posterUrl!.startsWith('http://')) {
        final updatedMovie = movieData.copyWith(
          posterUrl: movieData.posterUrl!.replaceAll('http://', 'https://'),
        );
        updatedMovies.add(updatedMovie);
      } else {
        updatedMovies.add(movieData);
      }
    }
    return updatedMovies;
  }
}
