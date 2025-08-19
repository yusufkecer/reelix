import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@immutable
class AppPadding extends EdgeInsets {
  const AppPadding.allTwenty() : super.all(20);
  const AppPadding.allEight() : super.all(8);
  const AppPadding.allTwentyFour() : super.all(24);
   AppPadding.horizontalThirtyNine() : super.symmetric(horizontal: 39.w);
}
