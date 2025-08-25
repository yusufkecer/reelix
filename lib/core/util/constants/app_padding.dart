import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@immutable
class AppPadding extends EdgeInsets {
  const AppPadding.allTwenty() : super.all(20);
  const AppPadding.allEight() : super.all(8);
  const AppPadding.allNine() : super.all(9);
  const AppPadding.allTen() : super.all(10);
  AppPadding.horizontalThirtyFour() : super.symmetric(horizontal: 34.w);
  const AppPadding.allTwentyFour() : super.all(24);
  AppPadding.bottomSixteen() : super.only(bottom: 16.h);
  AppPadding.horizontalThirtyNine() : super.symmetric(horizontal: 39.w);
  AppPadding.leftTwentyThree() : super.only(left: 23.43.w);
  AppPadding.leftForty() : super.only(left: 40.w);
  AppPadding.rightTwentyFive() : super.only(right: 25.w);
  AppPadding.horizontalSixtySeven() : super.symmetric(horizontal: 67.w);
  AppPadding.textFieldPadding() : super.only(left: 25.w, right: 10.w);
}
