import 'package:flutter/material.dart';

final class AppColor {
  static final AppColor instance = AppColor._internal();

  factory AppColor() {
    return instance;
  }
  AppColor._internal();

  final Color primaryColor = const Color(0xFF090909);

  final Color softBlack = const Color(0x1AFFFFFF);
  final Color verySoftBlack = const Color(0x33FFFFFF);
  final Color white = Colors.white;
  final Color redColor = const Color(0xFFE50914);
  final Color softRed = const Color(0xFFE50914).withAlpha(127);
  final Color veryDarkWhiteText = const Color(0x80FFFFFF);
  final Color darkRed = const Color(0xFF6F060B);
  final Color blueColor = const Color(0xFF5949E6);

  final Color black = Colors.black;
  final Color transparent = Colors.transparent;
}
