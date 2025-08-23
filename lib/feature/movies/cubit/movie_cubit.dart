import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:reelix/core/index.dart';
import 'package:reelix/feature/movies/domain/entity/movies_entity.dart';
import 'package:reelix/feature/movies/domain/use_case/movie_use_case.dart';

part 'movie_state.dart';

@injectable
class MovieCubit extends Cubit<MovieState> {
  MovieCubit({required this.movieUseCase}) : super(MovieInitial()) {
    getMovies(2);
  }

  final MovieUseCase movieUseCase;

  Future<void> getMovies(int page) async {
    emit(MovieLoading());
    'movie loading'.logInfo();
    try {
      final movies = await movieUseCase.execute(page);
      'movie loaded $movies'.logInfo();
      if (movies != null && movies.movies != null) {
        'success'.logInfo();

        emit(
          MovieLoaded(
            moviesEntity: movies.copyWith(
              movies: [
                ...?state.moviesEntity?.movies,
                ...movies.movies!,
              ],
            ),
          ),
        );
      } else {
        'error ${movies?.message}'.logInfo();
        emit(MovieError(error: LocaleKeys.home_movies_error.tr()));
      }
    } on Exception catch (e) {
      emit(MovieError(error: e.toString()));
    }
  }
}
