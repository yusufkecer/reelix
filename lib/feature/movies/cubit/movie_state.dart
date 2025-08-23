part of 'movie_cubit.dart';

sealed class MovieState extends Equatable {
  final List<MovieEntity>? movies;

  const MovieState({this.movies});

  @override
  List<Object> get props => [movies ?? []];
}

final class MovieInitial extends MovieState {}

final class MovieLoading extends MovieState {}

final class MovieLoaded extends MovieState {
  const MovieLoaded({super.movies});
}

final class MovieError extends MovieState {
  final String error;

  const MovieError({required this.error});
}
