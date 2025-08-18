import 'package:flutter/material.dart';

@immutable
final class ColorManager {
  static final ColorManager instance = ColorManager._internal();

  factory ColorManager() {
    return instance;
  }
  ColorManager._internal();

  final Color primaryColor = const Color(0xFF090909);

  final Color softBlack = Colors.black.withAlpha(25);
  final Color verySoftBlack = Colors.black.withAlpha(50);
  final Color white = Colors.white;
  final Color buttonPrimaryColor = const Color(0xFFE50914);
  final Color greyText = Colors.white.withAlpha(125);
}
