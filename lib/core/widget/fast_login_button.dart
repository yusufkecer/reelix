import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reelix/core/index.dart';

@immutable
final class FastLoginButton extends StatelessWidget {
  const FastLoginButton({required this.icon, super.key});

  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.w,
      height: 60.h,
      decoration: _CustomDecoration(),
      child: Padding(
        padding: const AppPadding.allTwenty(),
        child: Image.asset(
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
        borderRadius: const AppRadius.eighteen(),
      );
}
