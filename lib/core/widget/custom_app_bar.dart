import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';
import 'package:reelix/core/index.dart';

@immutable
final class CustomAppBar extends StatelessWidget {
  const CustomAppBar({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: AppPadding.leftTwentyThree(),
          child: const CustomBackButton(),
        ),
        Text(
          title,
          style: context.general.textTheme.displayMedium,
          textAlign: TextAlign.center,
        ),
        SizedBox(width: SpaceValues.fortyFourPointThreeFour.value.w),
      ],
    );
  }
}
