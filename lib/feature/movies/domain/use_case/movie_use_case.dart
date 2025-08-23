import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:reelix/core/index.dart';
import 'package:reelix/domain/entity/movie_entity.dart';
import 'package:reelix/feature/movies/domain/repository/movie_repository.dart';

@injectable
@immutable
final class MovieUseCase
    implements BaseUseCase<List<MovieEntity>, List<MovieEntity>, int?, int?> {
  const MovieUseCase(this._repository);

  final MovieRepository _repository;

  @override
  Future<List<MovieEntity>?>? executeWithParams(int? params) {
    throw UnimplementedError();
  }

  @override
  Future<List<MovieEntity>?>? execute(int? param) async {
    return _repository.executeWithParams(null);
  }
}
