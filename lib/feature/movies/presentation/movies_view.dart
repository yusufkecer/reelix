import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kartal/kartal.dart';
import 'package:reelix/core/index.dart';
import 'package:reelix/domain/entity/movie_entity.dart';
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

class _MoviesState extends State<Movies> with Dialogs {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Locator.sl<MovieCubit>(),
      child: const _MovieList(),
    );
  }
}

class _MovieList extends StatefulWidget {
  const _MovieList();

  @override
  State<_MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<_MovieList> with MoviesViewModel {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieState>(
      builder: (context, state) {
        return PagingListener(
          controller: _pagingController,
          builder: (context, state, fetchNextPage) {
            return PagedPageView<int, MovieEntity>(
              scrollDirection: Axis.vertical,
              state: state,
              fetchNextPage: fetchNextPage,
              builderDelegate: PagedChildBuilderDelegate<MovieEntity>(
                itemBuilder: (context, item, index) => SizedBox.expand(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CacheImage(
                        imageUrl: item.posterUrl ?? '',
                      ),

                      Positioned(
                        bottom: SizeValues.oneHundredSeventyOne.value.h,
                        right: SizeValues.sixteen.value.w,
                        child: _FavoriteButton(
                          onTap: () {},
                          isFavorite: false,
                        ),
                      ),

                      Positioned(
                        bottom: SizeValues.ninetySeven.value.h,
                        left: SizeValues.sixteen.value.w,
                        right: SizeValues.sixteen.value.w,
                        child: _MovieContent(
                          title: item.title ?? '',
                          description: item.description ?? '',
                        ),
                      ),

                      if (state is MovieLoading)
                        const Center(
                          child: CustomLoading(),
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
