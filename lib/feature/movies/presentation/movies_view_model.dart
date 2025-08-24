part of 'movies_view.dart';

mixin MoviesViewModel on State<_MovieList> {
  late final _pagingController = PagingController<int, MovieEntity>(
    
    getNextPageKey: (state) =>
        state.lastPageIsEmpty ? null : state.nextIntPageKey,
    fetchPage: fetchPage,
  );

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Future<List<MovieEntity>> fetchPage(int page) async {
    final movieCubit = context.read<MovieCubit>()..page = page + 1;
    await movieCubit.getMovies(movieCubit.page);
    return movieCubit.state.moviesEntity?.movies ?? [];
  }
}
