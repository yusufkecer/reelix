import 'package:date_app/core/index.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
@immutable
class CustomTheme implements BaseTheme {
  ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      // appBarTheme: _appBarTheme,
      // cardTheme: _cardTheme,
      // chipTheme: _chipTheme,
      //dialogTheme: _dialogTheme,
      // expansionTileTheme: _expansionTileThemeData,
      // listTileTheme: _listTileThemeData,
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
          borderRadius: ProductRadius.eighteen(),
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
        borderRadius: ProductRadius.eighteen(),
        borderSide: BorderSide(
          color: ColorManager.instance.white.withAlpha(100),
          width: 1,
        ),
      ),
    );
  }
}

class _CustomColorScheme extends ColorScheme {
  _CustomColorScheme() : super.dark(primary: ColorManager.instance.primaryColor);
}
