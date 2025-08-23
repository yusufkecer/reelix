part of 'movie_cubit.dart';

sealed class MovieState extends Equatable {
  final MoviesEntity? moviesEntity;

  const MovieState({this.moviesEntity});

  @override
  List<Object> get props => [moviesEntity ?? []];
}

final class MovieInitial extends MovieState {}

final class MovieLoading extends MovieState {}

final class MovieLoaded extends MovieState {
  const MovieLoaded({super.moviesEntity});
}

final class MovieError extends MovieState {
  final String error;

  const MovieError({required this.error});
}
