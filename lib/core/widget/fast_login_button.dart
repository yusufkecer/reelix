import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reelix/core/index.dart';

@immutable
final class FastLoginButton extends StatelessWidget {
  const FastLoginButton({required this.icon, super.key});

  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeValues.sixty.value.w,
      height: SizeValues.sixty.value.h,
      decoration: _CustomDecoration(),
      child: Padding(
        padding: const AppPadding.allTwenty(),
        child: SvgPicture.asset(
          icon,
        ),
      ),
    );
  }
}

final class _CustomDecoration extends BoxDecoration {
  _CustomDecoration()
    : super(
        border: Border.all(
          color: AppColor.instance.verySoftBlack,
        ),
        color: AppColor.instance.softBlack,
        borderRadius: AppRadius.eighteen(),
      );
}
