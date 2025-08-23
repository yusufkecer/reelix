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

class _MoviesState extends State<Movies> with Dialogs, MoviesViewModel {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Locator.sl<MovieCubit>(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<MovieCubit, MovieState>(
            builder: (context, state) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  CacheImage(
                    imageUrl: state.moviesEntity?.movies?.first.posterUrl ?? '',
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
                    child: _MovieContent(
                      title: state.moviesEntity?.movies?.first.title ?? '',
                      description:
                          state.moviesEntity?.movies?.first.description ?? '',
                    ),
                  ),
                  if (state is MovieLoading)
                    const Center(
                      child: CustomLoading(),
                    ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
