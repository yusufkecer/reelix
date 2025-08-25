import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:reelix/core/index.dart';
import 'package:reelix/domain/entity/movie_entity.dart';
import 'package:reelix/feature/movies/domain/entity/movies_entity.dart';
import 'package:reelix/feature/movies/domain/use_case/movie_use_case.dart';
import 'package:reelix/feature/profile/cubit/favorite_movie_cubit/favorite_movie_cubit.dart';

part 'movie_state.dart';

@injectable
class MovieCubit extends Cubit<MovieState> {
  MovieCubit({
    required MovieUseCase movieUseCase,
    required FavoriteMovieCubit favoriteMovieCubit,
  }) : _movieUseCase = movieUseCase,
       _favoriteMovieCubit = favoriteMovieCubit,
       super(MovieInitial()) {
    getMovies(1);
  }

  final List<MovieEntity> _movieList = [];

  final MovieUseCase _movieUseCase;
  final FavoriteMovieCubit _favoriteMovieCubit;

  Future<void> getMovies(int page) async {
    emit(state.copyWith(isLoading: true));
    try {
      'getMovies: $page'.logInfo();

      final movies = await _movieUseCase.execute(param: page);

      if (movies?.movies != null) {
        _movieList.addAll(movies!.movies!);
        final newMoviesEntity = movies.copyWithMovies(
          movies: _movieList,
        );
        emit(MovieLoaded(moviesEntity: newMoviesEntity));
      } else {
        emit(MovieError(error: LocaleKeys.home_movies_error.tr()));
      }
    } on Exception catch (e) {
      emit(MovieError(error: e.toString()));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> addFavorite(String movieId) async {
    final favorite = await _movieUseCase.executeWithParams(movieId);
    if (favorite != null) {
      final newMoviesEntity = state.moviesEntity?.copyWithMovies(
        movies: state.moviesEntity?.movies?.map((movie) {
          if (movie.id == movieId) {
            return movie.copyWith(isFavorite: favorite.isFavorite);
          }
          return movie;
        }).toList(),
      );
      await _favoriteMovieCubit.getFavoriteMovies();
      emit(MovieLoaded(moviesEntity: newMoviesEntity));
    }
  }
}
