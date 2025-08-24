import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kartal/kartal.dart';
import 'package:reelix/core/index.dart';

part 'profile_view_model.dart';
part 'widgets/offer_button.dart';
part 'widgets/custom_app_bar.dart';
part 'widgets/user_info_layer.dart';

@immutable
final class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const _ProfileBody();
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
    return Column(
      children: [
        SizedBox(height: SizeValues.fifty.value.h),
        _CustomAppBar(
          title: LocaleKeys.upload_photo_app_bar_title.tr(),
        ),
        SizedBox(height: SizeValues.thirtySix.value.h),
        const _UserInfoLayer(
          imageUrl:
              'https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/396e9/MainBefore.jpg',
          fullName: 'John Doe',
        ),
      ],
    );
  }
}
