import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reelix/core/index.dart';

@immutable
final class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.maybePop(),
      child: Ink(
        width: SpaceValues.fortyFourPointThreeFour.value.w,
        height: SpaceValues.fortyFourPointThreeFour.value.h,
        decoration: BoxDecoration(
          color: AppColor.instance.softBlack,
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColor.instance.verySoftBlack,
            width: 1,
          ),
        ),
        child: Image.asset(
          AssetPath.back.path.pngImage,
          width: 24.w,
          height: 24.h,
        ),
      ),
    );
  }
}
