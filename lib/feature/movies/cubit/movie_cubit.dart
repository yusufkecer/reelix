import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reelix/domain/entity/movie_entity.dart';
import 'package:reelix/feature/movies/domain/use_case/movie_use_case.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit({required this.movieUseCase}) : super(MovieInitial());

  final MovieUseCase movieUseCase;

  Future<void> getMovies() async {
    emit(MovieLoading());
    try {
      final movies = await movieUseCase.execute(null);
      if (movies != null) {
        emit(MovieLoaded(movies: movies));
      } else {
        emit(const MovieError(error: 'No movies found'));
      }
    } on Exception catch (e) {
      emit(MovieError(error: e.toString()));
    }
  }
}
