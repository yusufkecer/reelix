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
        width: SizeValues.fortyFourPointThreeFour.value.w,
        height: SizeValues.fortyFourPointThreeFour.value.h,
        decoration: BoxDecoration(
          color: AppColor.instance.softBlack,
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColor.instance.verySoftBlack,
            width: SizeValues.one.value.w,
          ),
        ),
        child: Image.asset(
          AssetPath.back.path.pngImage,
          width: SizeValues.twentyFour.value.w,
          height: SizeValues.twentyFour.value.h,
        ),
      ),
    );
  }
}
