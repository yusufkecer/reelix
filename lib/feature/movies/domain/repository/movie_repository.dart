import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:reelix/core/index.dart';
import 'package:reelix/domain/entity/movie_entity.dart';
import 'package:reelix/feature/movies/domain/entity/favorite_entity.dart';
import 'package:reelix/feature/movies/domain/entity/movies_entity.dart';

@injectable
@immutable
final class MovieRepository
    implements BaseRepository<MoviesEntity, FavoriteEntity, String, int> {
  const MovieRepository(this._networkManager);
  final NetworkManager _networkManager;

  @override
  Future<MoviesEntity?> execute({int? param}) async {
    final response = await _networkManager.get<Map<String, dynamic>?>(
      '/movie/list',
      queryParameters: {
        'page': param,
      },
    );

    if (response == null) {
      'response is null'.logInfo();
      return null;
    }

    final responseData = response['response'] as Map<String, dynamic>;
    if (responseData['code'] != 200) {
      return null;
    }
    final messageEntity = MoviesEntity.fromJson(responseData);
    final data = response['data'] as Map<String, dynamic>;

    if (data.isEmpty && responseData['code'] != 200) {
      return messageEntity;
    }

    final moviesList = data['movies'] as List<dynamic>;

    if (moviesList.isEmpty) {
      return messageEntity;
    }

    final pagination = data['pagination'] as Map<String, dynamic>;
    final moviesEntity = MoviesEntity.fromJson(pagination);
    final updatedMovies = <MovieEntity>[];

    for (final movieData in moviesList) {
      if (movieData is Map<String, dynamic>) {
        final movie = MovieEntity.fromJson(movieData);

        if (movie.posterUrl != null && movie.posterUrl!.startsWith('http://')) {
          final updatedMovie = movie.copyWith(
            posterUrl: movie.posterUrl!.replaceAll('http://', 'https://'),
          );
          updatedMovies.add(updatedMovie);
        } else {
          updatedMovies.add(movie);
        }
      }
    }

    'updatedMovies length: ${updatedMovies.length}'.logInfo();
    'updatedMovies: $updatedMovies'.logInfo();

    final result = moviesEntity.copyWithMovies(movies: updatedMovies);

    return result;
  }

  @override
  Future<FavoriteEntity?> executeWithParams(String param) async {
    final response = await _networkManager.post<Map<String, dynamic>?>(
      '/movie/favorite/$param',
    );

    if (response == null) {
      'response is null'.logInfo();
      return null;
    }

    final responseData = response['response'] as Map<String, dynamic>;

    if (responseData['code'] != 200) {
      return null;
    }

    final data = response['data'] as Map<String, dynamic>;
    final movie = data['movie'] as Map<String, dynamic>;
    final favoriteEntity = FavoriteEntity.fromJson(movie);

    return favoriteEntity;
  }
}
