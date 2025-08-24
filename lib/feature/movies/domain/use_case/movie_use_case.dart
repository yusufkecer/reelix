import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:reelix/core/index.dart';
import 'package:reelix/feature/movies/domain/entity/favorite_entity.dart';
import 'package:reelix/feature/movies/domain/entity/movies_entity.dart';
import 'package:reelix/feature/movies/domain/repository/movie_repository.dart';

@injectable
@immutable
final class MovieUseCase
    implements BaseUseCase<MoviesEntity, FavoriteEntity, String, int> {
  const MovieUseCase(this._repository);

  final MovieRepository _repository;
  @override
  Future<MoviesEntity?>? execute({int? param}) async {
    return _repository.execute(param: param);
  }

  @override
  Future<FavoriteEntity?>? executeWithParams(String params) {
    return _repository.executeWithParams(params);
  }
}
