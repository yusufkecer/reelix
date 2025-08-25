import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kartal/kartal.dart';
import 'package:reelix/core/index.dart';
import 'package:reelix/feature/profile/cubit/favorite_movie_cubit/favorite_movie_cubit.dart';
import 'package:reelix/feature/profile/cubit/profile_cubit/profile_cubit.dart';
import 'package:reelix/injection/locator.dart';

part 'profile_view_model.dart';
part 'widgets/offer_button.dart';
part 'widgets/custom_app_bar.dart';
part 'widgets/user_info_layer.dart';
part 'widgets/movie_card.dart';

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
            SizedBox(height: SizeValues.fifty.value.h),
            const _CustomAppBar(
              title: LocaleKeys.upload_photo_app_bar_title,
            ),
            SizedBox(height: SizeValues.thirtySix.value.h),
            _UserInfoLayer(
              id: state.userEntity?.id ?? '',
              imageUrl: state.userEntity?.photoUrl ?? '',
              fullName: state.userEntity?.name ?? '',
            ),
            SizedBox(height: SizeValues.twentyEight.value.h),
            Padding(
              padding: AppPadding.leftForty(),
              child: Text(
                LocaleKeys.profile_liked_movies.tr(),
                style: context.general.textTheme.titleMedium,
              ),
            ),
            VerticalSpace.twentyThree(),

            Expanded(
              child: Padding(
                padding: AppPadding.horizontalThirtyNine(),
                child: GridView.builder(
                  padding: EdgeInsets.only(bottom: 95.h),
                  itemCount: 8,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 13.h,
                    crossAxisCount: 2,
                    childAspectRatio: 0.54,
                  ),
                  itemBuilder: (context, index) {
                    return const MovieCard(
                      imageUrl:
                          'https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/396e9/MainBefore.jpg',
                      title: 'Movie Title',
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
