part of 'favorite_movie_cubit.dart';

sealed class FavoriteMovieState extends Equatable {
  final List<MovieEntity>? movies;
  const FavoriteMovieState({this.movies});

  @override
  List<Object?> get props => [movies];
}

final class FavoriteMovieInitial extends FavoriteMovieState {
  const FavoriteMovieInitial() : super();
}

final class FavoriteMovieLoading extends FavoriteMovieState {
  const FavoriteMovieLoading() : super();
}

final class FavoriteMovieLoaded extends FavoriteMovieState {
  const FavoriteMovieLoaded({super.movies});
}

final class FavoriteMovieError extends FavoriteMovieState {
  final String error;
  const FavoriteMovieError({required this.error});
}
