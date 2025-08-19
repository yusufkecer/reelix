import 'package:date_app/core/index.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
@immutable
class CustomTheme implements BaseTheme {
  ThemeData get theme {
    return ThemeData(
      useMaterial3: true,

      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: ProjectFonts.large.value,
          fontWeight: FontWeight.w600,
          color: ColorManager.instance.white,
        ),
        displayMedium: TextStyle(
          fontSize: ProjectFonts.normal.value,
          fontWeight: FontWeight.w500,
          color: ColorManager.instance.white,
        ),
        bodyLarge: TextStyle(
          fontSize: ProjectFonts.medium.value,
          fontWeight: FontWeight.w400,
          color: ColorManager.instance.white.withAlpha(200),
        ),
        bodyMedium: TextStyle(
          fontSize: ProjectFonts.small.value,
          fontWeight: FontWeight.w400,
          color: ColorManager.instance.white.withAlpha(150),
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
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),

      hintStyle: TextStyle(
        color: ColorManager.instance.white.withAlpha(150),
      ),
      labelStyle: TextStyle(
        color: ColorManager.instance.white.withAlpha(200),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: const AppRadius.eighteen(),
        borderSide: BorderSide(
          color: ColorManager.instance.white.withAlpha(100),
          width: 1,
        ),
      ),
    );
  }

  //custom font size
}

class _CustomColorScheme extends ColorScheme {
  _CustomColorScheme() : super.dark(primary: ColorManager.instance.primaryColor);
}
