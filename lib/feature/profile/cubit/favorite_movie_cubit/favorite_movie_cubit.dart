import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:reelix/domain/index.dart';
import 'package:reelix/feature/profile/domain/use_case/profile_use_case.dart';

part 'favorite_movie_state.dart';

@injectable
final class FavoriteMovieCubit extends Cubit<FavoriteMovieState> {
  FavoriteMovieCubit(this._profileUseCase) : super(FavoriteMovieInitial());

  final ProfileUseCase _profileUseCase;

  Future<void> getFavoriteMovies() async {
    emit(const FavoriteMovieLoading());
    try {
      final movies = await _profileUseCase.executeWithParams(null);
      emit(FavoriteMovieLoaded(movies: movies));
    } on Exception catch (e) {
      emit(FavoriteMovieError(error: e.toString()));
    }
  }
}
