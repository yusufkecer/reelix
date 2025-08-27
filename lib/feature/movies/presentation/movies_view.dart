import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kartal/kartal.dart';
import 'package:reelix/core/index.dart';
import 'package:reelix/feature/movies/cubit/movie_cubit.dart';
import 'package:reelix/injection/locator.dart';

part 'movies_view_model.dart';
part 'widgets/favorite_button.dart';
part 'widgets/movie_content.dart';

@immutable
final class Movies extends StatefulWidget {
  const Movies({super.key});

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Locator.sl<MovieCubit>(),
      child: const _MovieList(),
    );
  }
}

@immutable
final class _MovieList extends StatefulWidget {
  const _MovieList();

  @override
  State<_MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<_MovieList> with MoviesViewModel {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieState>(
      builder: (context, state) {
        return RefreshIndicator(
          color: AppColor.instance.redColor,
          onRefresh: () async {
            await _fetchPage(0);
          },
          child: PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: state.moviesEntity?.movies?.length ?? 0,
            onPageChanged: (index) async {
              await _fetchPage(index);
            },
            itemBuilder: (context, index) {
              return !state.isLoading
                  ? SizedBox.expand(
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          CacheImage(
                            imageUrl: state.moviesEntity?.movies?[index].posterUrl ?? '',
                          ),
                          Positioned(
                            bottom: SizeValues.oneHundredSeventyOne.value.h,
                            right: SizeValues.sixteen.value.w,
                            child: _FavoriteButton(
                              onTap: () => _addFavorite(index),
                              isFavorite: state.moviesEntity?.movies?[index].isFavorite ?? false,
                            ),
                          ),
                          Positioned(
                            bottom: SizeValues.ninetySeven.value.h,
                            left: SizeValues.thirtyFive.value.w,
                            child: _MovieContent(
                              title: state.moviesEntity?.movies?[index].title ?? '',
                              description: state.moviesEntity?.movies?[index].description ?? '',
                            ),
                          ),
                        ],
                      ),
                    )
                  : Center(
                      child: ColoredBox(
                        color: AppColor.instance.primaryColor,
                        child: const CustomLoading(),
                      ),
                    );
            },
          ),
        );
      },
    );
  }
}
