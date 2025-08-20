import 'package:date_app/core/index.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
@immutable
class CustomTheme implements BaseTheme {
  @override
  ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: ColorManager.instance.white,
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: AppFontSize.large.value,
          fontWeight: FontWeight.w600,
          color: ColorManager.instance.white,
        ),
        displayMedium: TextStyle(
          fontSize: AppFontSize.normal.value,
          fontWeight: FontWeight.w500,
          color: ColorManager.instance.white,
        ),
        bodyLarge: TextStyle(
          fontSize: AppFontSize.medium.value,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          fontSize: AppFontSize.small.value,
          fontWeight: FontWeight.w400,
        ),
      ),

      filledButtonTheme: _filledButtonTheme(),
      inputDecorationTheme: _inputDecorationTheme,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: ColorManager.instance.primaryColor,
      colorScheme: _CustomColorScheme(),
    );
  }

  FilledButtonThemeData _filledButtonTheme() {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: AppRadius.eighteen(),
        ),
        backgroundColor: ColorManager.instance.buttonPrimaryColor,
        foregroundColor: ColorManager.instance.white,
      ),
    );
  }

  InputDecorationTheme get _inputDecorationTheme {
    return InputDecorationTheme(
      filled: true,
      fillColor: ColorManager.instance.softBlack,

      hintStyle: TextStyle(
        color: ColorManager.instance.veryDarkWhiteText,
        fontSize: AppFontSize.small.value,
        fontWeight: FontWeight.w400,
      ),
      labelStyle: TextStyle(
        color: ColorManager.instance.veryDarkWhiteText,
        fontSize: AppFontSize.small.value,
        fontWeight: FontWeight.w400,
      ),

      border: OutlineInputBorder(
        borderRadius: const AppRadius.eighteen(),
        borderSide: BorderSide(
          color: ColorManager.instance.white.withAlpha(100),
        ),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: const AppRadius.eighteen(),
        borderSide: BorderSide(
          color: ColorManager.instance.white.withAlpha(100),
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: const AppRadius.eighteen(),
        borderSide: BorderSide(
          color: ColorManager.instance.white.withAlpha(100),
        ),
      ),
    );
  }

  //custom font size
}

class _CustomColorScheme extends ColorScheme {
  _CustomColorScheme()
    : super.dark(
        primary: ColorManager.instance.primaryColor,
      );
}
