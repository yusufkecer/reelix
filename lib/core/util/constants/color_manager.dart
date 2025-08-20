import 'package:flutter/material.dart';

@immutable
final class ColorManager {
  static final ColorManager instance = ColorManager._internal();

  factory ColorManager() {
    return instance;
  }
  ColorManager._internal();

  final Color primaryColor = const Color(0xFF090909);

  final Color softBlack = const Color(0x1AFFFFFF);
  final Color verySoftBlack = const Color(0x33FFFFFF);
  final Color white = Colors.white;
  final Color buttonPrimaryColor = const Color(0xFFE50914);
  final Color veryDarkWhiteText = const Color(0x80FFFFFF);
}
