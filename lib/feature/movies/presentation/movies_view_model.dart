part of 'movies_view.dart';

mixin MoviesViewModel on State<_MovieList> {
  final ValueNotifier<bool> _isLoading = ValueNotifier(false);

  Future<void> _addFavorite(int index) async {
    final movieCubit = context.read<MovieCubit>();
    final movie = movieCubit.state.moviesEntity?.movies?[index];
    if (movie != null) {
      await movieCubit.addFavorite(movie.id!);
    }
  }

  Future<void> _fetchPage(int page) async {
    final movieCubit = context.read<MovieCubit>();
    final movies = movieCubit.state.moviesEntity?.movies ?? [];
    final maxPage = movieCubit.state.moviesEntity?.maxPage ?? 1;
    final currentPage = movieCubit.state.moviesEntity?.currentPage ?? 1;
    final totalCount = movieCubit.state.moviesEntity?.totalCount ?? 1;
    if (_isLoading.value) return;

    if (maxPage <= currentPage) return;

    if (totalCount <= page) return;

    final shouldFetch = movies.isNotEmpty && page == movies.length - 2;

    if (shouldFetch) {
      _isLoading.value = true;
      await movieCubit.getMovies(currentPage + 1);
      _isLoading.value = false;
    }
  }
}
