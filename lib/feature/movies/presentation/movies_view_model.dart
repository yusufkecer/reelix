part of 'movies_view.dart';

mixin MoviesViewModel on State<_MovieList> {
  Future<void> _addFavorite(int index) async {
    final movieCubit = context.read<MovieCubit>();
    final movie = movieCubit.state.moviesEntity?.movies?[index];
    if (movie != null) {
      await movieCubit.addFavorite(movie.id!);
    }
  }

  Future<void> _fetchPage(int index) async {
    final movieCubit = context.read<MovieCubit>();
    final currentPage = movieCubit.state.moviesEntity?.currentPage ?? 1;
    final maxPage = movieCubit.state.moviesEntity?.maxPage ?? 1;

    if (currentPage >= maxPage) return;

    final movies = movieCubit.state.moviesEntity?.movies ?? [];
    if (index >= movies.length - 2 && !movieCubit.state.isLoading) {
      await movieCubit.getMovies(currentPage + 1);
    }
  }
}
