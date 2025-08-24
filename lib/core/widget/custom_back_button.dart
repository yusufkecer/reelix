import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reelix/core/index.dart';

@immutable
final class CustomLeadingButton extends StatelessWidget {
  const CustomLeadingButton({
    required this.onTap,
    required this.image,
    super.key,
  });
  final void Function()? onTap;
  final String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
          image,
          width: SizeValues.twentyFour.value.w,
          height: SizeValues.twentyFour.value.h,
        ),
      ),
    );
  }
}
