import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';
import 'package:reelix/core/index.dart';
import 'package:reelix/feature/profile/cubit/favorite_movie_cubit/favorite_movie_cubit.dart';
import 'package:reelix/feature/profile/cubit/profile_cubit/profile_cubit.dart';
import 'package:reelix/injection/locator.dart';

part 'profile_view_model.dart';
part 'widgets/offer_button.dart';
part 'widgets/custom_app_bar.dart';
part 'widgets/user_info_layer.dart';
part 'widgets/movie_card.dart';
part 'widgets/offer_widget/bottom_sheet.dart';
part 'mixin/bottom_sheet_mixin.dart';
part 'widgets/offer_widget/bonus.dart';
part 'widgets/offer_widget/price_card.dart';

@immutable
final class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => Locator.sl<ProfileCubit>()),
        BlocProvider(create: (context) => Locator.sl<FavoriteMovieCubit>()),
      ],
      child: const _ProfileBody(),
    );
  }
}

class _ProfileBody extends StatefulWidget {
  const _ProfileBody();

  @override
  State<_ProfileBody> createState() => __ProfileBodyState();
}

class __ProfileBodyState extends State<_ProfileBody> with _ProfileViewModel {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSpace.fifty(),
            const _CustomAppBar(
              title: LocaleKeys.upload_photo_app_bar_title,
            ),
            VerticalSpace.thirtySix(),
            _UserInfoLayer(
              id: state.userEntity?.id ?? '',
              imageUrl: state.userEntity?.photoUrl ?? '',
              fullName: state.userEntity?.name ?? '',
            ),
            VerticalSpace.twentyEight(),
            Padding(
              padding: AppPadding.leftForty(),
              child: Text(
                LocaleKeys.profile_liked_movies.tr(),
                style: context.general.textTheme.titleMedium,
              ),
            ),
            VerticalSpace.twentyThree(),

            BlocBuilder<FavoriteMovieCubit, FavoriteMovieState>(
              builder: (context, state) {
                return state.movies?.isEmpty ?? true
                    ? SizedBox(
                        height: SizeValues.fourHundred.value.h,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Lottie.asset(
                                AssetPath.notFound.path.lottie,
                                width: 100.w,
                                height: 100.h,
                              ),
                              VerticalSpace.six(),
                              Text(
                                LocaleKeys.profile_no_liked_movies.tr(),
                                style: context.general.textTheme.displayLarge
                                    ?.copyWith(
                                      color: AppColor.instance.white,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Expanded(
                        child: Padding(
                          padding: AppPadding.horizontalThirtyNine(),
                          child: GridView.builder(
                            padding: EdgeInsets.only(bottom: 95.h),
                            itemCount: state.movies?.length ?? 0,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 16.w,
                                  mainAxisSpacing: 13.h,
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.54,
                                ),
                            itemBuilder: (context, index) {
                              return MovieCard(
                                imageUrl: state.movies?[index].posterUrl ?? '',
                                title: state.movies?[index].title ?? '',
                                genre: state.movies?[index].genre ?? '',
                              );
                            },
                          ),
                        ),
                      );
              },
            ),
          ],
        );
      },
    );
  }
}
