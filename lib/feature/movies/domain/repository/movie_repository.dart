import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:reelix/core/index.dart';
import 'package:reelix/domain/entity/movie_entity.dart';

@injectable
@immutable
final class MovieRepository
    implements BaseRepository<List<MovieEntity>, List<MovieEntity>, int?> {
  final NetworkManager _networkManager;

  const MovieRepository(this._networkManager);

  @override
  Future<List<MovieEntity>?> executeWithParams(int? params) async {
    try {
      final response = await _networkManager.get<Map<String, dynamic>?>(
        'movies',
      );

      if (response == null) {
        return [];
      }

      final responseData = response['response'] as Map<String, dynamic>;

      if (responseData['code'] != 200) {
        throw Exception(responseData['message'] ?? 'Failed to fetch movies');
      }

      final data = response['data'] as List<dynamic>;
      final movies = data
          .map((json) => MovieEntity.fromJson(json as Map<String, dynamic>))
          .toList();

      return movies;
    } catch (e) {
      throw Exception('Failed to fetch movies: $e');
    }
  }

  @override
  Future<List<MovieEntity>?>? execute() async {
    return executeWithParams(null);
  }
}
