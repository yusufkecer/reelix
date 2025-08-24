part of 'movies_view.dart';

mixin MoviesViewModel on State<_MovieList> {
  final ValueNotifier<bool> _isLoading = ValueNotifier(false);
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    fetchPage(2);
  }



  Future<void> fetchPage(int page) async {
    final movieCubit = context.read<MovieCubit>();

    if (_isLoading.value ||
        (movieCubit.state.moviesEntity?.movies?.length ?? 0) > page) {
      return;
    }
    _isLoading.value = true;
    await movieCubit.getMovies(page + 1);
    _isLoading.value = false;
  }
}
