part of 'movie_cubit.dart';

class MovieState extends Equatable {
  final MoviesEntity? moviesEntity;
  final bool isLoading;

  const MovieState({this.moviesEntity, this.isLoading = false});

  MovieState copyWith({MoviesEntity? moviesEntity, bool? isLoading}) {
    return MovieState(
      moviesEntity: moviesEntity ?? this.moviesEntity,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [moviesEntity ?? [], isLoading];
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
