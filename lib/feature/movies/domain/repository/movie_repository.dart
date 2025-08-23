import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:reelix/core/index.dart';
import 'package:reelix/domain/entity/movie_entity.dart';
import 'package:reelix/feature/movies/domain/entity/movies_entity.dart';

@injectable
@immutable
final class MovieRepository
    implements BaseRepository<MoviesEntity, MoviesEntity, int> {
  const MovieRepository(this._networkManager);
  final NetworkManager _networkManager;

  @override
  Future<MoviesEntity?> execute(int params) async {
    final response = await _networkManager.get<Map<String, dynamic>?>(
      '/movie/list',
      queryParameters: {
        'page': params,
      },
    );
    'response: $response'.logInfo();

    if (response == null) {
      'response is null'.logInfo();
      return null;
    }

    final responseData = response['response'] as Map<String, dynamic>;
    final moviesEntity = MoviesEntity.fromJson(responseData);
    final data = response['data'] as Map<String, dynamic>;

    if (data.isEmpty && responseData['code'] != 200) {
      'data is empty'.logInfo();
      return moviesEntity;
    }
    'data: $data'.logInfo();

    final movieData = data['movies'].first as Map<String, dynamic>;
    'movieData: $movieData'.logInfo();

    if (movieData.isEmpty) {
      'movies is empty'.logInfo();
      return moviesEntity;
    }

    final movies = MovieEntity.fromJson(movieData);

    'movies: $movies'.logInfo();

    final copyWith = moviesEntity.copyWith(movies: [movies]);
    final posterUrl = copyWith.movies?.first.posterUrl;
    final replacedPosterUrl = posterUrl?.replaceAll('http://', 'https://');

    final updatedMovie = MovieEntity(
      id: copyWith.movies?.first.id,
      title: copyWith.movies?.first.title,
      description: copyWith.movies?.first.description,
      posterUrl: replacedPosterUrl,
      isFavorite: copyWith.movies?.first.isFavorite,
    );

    final replacedCopyWith = copyWith.copyWith(movies: [updatedMovie]);

    return replacedCopyWith;
  }

  @override
  Future<MoviesEntity?> executeWithParams(int params) async {
    return execute(params);
  }
}
