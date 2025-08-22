import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:reelix/core/index.dart';

@lazySingleton
@immutable
class CustomTheme implements BaseTheme {
  @override
  ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      appBarTheme: _appBarTheme,
      textButtonTheme: _textButtonTheme,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColor.instance.white,
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: AppFontSize.large.value.sp,
          fontWeight: FontWeight.w600,
          color: AppColor.instance.white,
        ),
        displayMedium: TextStyle(
          fontSize: AppFontSize.normal.value.sp,
          fontWeight: FontWeight.w500,
          color: AppColor.instance.white,
        ),
        bodyLarge: TextStyle(
          fontSize: AppFontSize.medium.value.sp,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          fontSize: AppFontSize.small.value.sp,
          fontWeight: FontWeight.w400,
        ),
      ),

      filledButtonTheme: _filledButtonTheme(),
      inputDecorationTheme: _inputDecorationTheme,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColor.instance.primaryColor,
      colorScheme: _CustomColorScheme(),
    );
  }

  AppBarTheme get _appBarTheme {
    return AppBarTheme(
      elevation: 0,
      backgroundColor: AppColor.instance.primaryColor,
      titleTextStyle: TextStyle(
        fontSize: AppFontSize.normal.value.sp,
        fontWeight: FontWeight.w500,
        color: AppColor.instance.white,
      ),
    );
  }

  FilledButtonThemeData _filledButtonTheme() {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: AppRadius.eighteen(),
        ),
        backgroundColor: AppColor.instance.buttonPrimaryColor,
        foregroundColor: AppColor.instance.white,
      ),
    );
  }

  InputDecorationTheme get _inputDecorationTheme {
    return InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(vertical: 16.h),
      filled: true,
      fillColor: AppColor.instance.softBlack,
      hintStyle: TextStyle(
        color: AppColor.instance.veryDarkWhiteText,
        fontSize: AppFontSize.small.value,
        fontWeight: FontWeight.w400,
      ),
      labelStyle: TextStyle(
        color: AppColor.instance.veryDarkWhiteText,
        fontSize: AppFontSize.small.value,
        fontWeight: FontWeight.w400,
      ),

      border: OutlineInputBorder(
        borderRadius: const AppRadius.eighteen(),
        borderSide: BorderSide(
          color: AppColor.instance.verySoftBlack,
        ),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: const AppRadius.eighteen(),
        borderSide: BorderSide(
          color: AppColor.instance.verySoftBlack,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: const AppRadius.eighteen(),
        borderSide: BorderSide(
          color: AppColor.instance.verySoftBlack,
        ),
      ),
    );
  }

  TextButtonThemeData get _textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColor.instance.white,
      ),
    );
  }
}

class _CustomColorScheme extends ColorScheme {
  _CustomColorScheme()
    : super.dark(
        primary: AppColor.instance.primaryColor,
      );
}
