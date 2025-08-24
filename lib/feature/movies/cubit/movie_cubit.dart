import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:reelix/core/index.dart';
import 'package:reelix/domain/entity/movie_entity.dart';
import 'package:reelix/feature/movies/domain/entity/movies_entity.dart';
import 'package:reelix/feature/movies/domain/use_case/movie_use_case.dart';

part 'movie_state.dart';

@injectable
class MovieCubit extends Cubit<MovieState> {
  MovieCubit({required this.movieUseCase}) : super(MovieInitial()) {
    getMovies(page);
  }

  int page = 1;
  List<MovieEntity> movieList = [];

  final MovieUseCase movieUseCase;

  Future<void> getMovies(int page) async {
    'get movies $page'.logInfo();

    try {
      emit(MovieLoading());
      final movies = await movieUseCase.execute(page);

      if (movies?.movies != null) {
        movieList.add(movies!.movies!.first);
        'movieList: ${jsonEncode(movieList)}'.logInfo();
        final newMoviesEntity = movies.copyWith(
          movies: [
            ...movieList,
          ],
        );
        emit(MovieLoaded(moviesEntity: newMoviesEntity));
      } else {
        emit(MovieError(error: LocaleKeys.home_movies_error.tr()));
      }
    } on Exception catch (e) {
      emit(MovieError(error: e.toString()));
    }
  }
}
