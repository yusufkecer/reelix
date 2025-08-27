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
      textButtonTheme: _textButtonTheme,
      bottomSheetTheme: _bottomSheetTheme,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColor.instance.white,
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: AppFontSize.xxLarge.value.sp,
          fontWeight: FontWeight.w900,
          color: AppColor.instance.white,
          fontFamily: 'EuclidCircular',
        ),
        displayLarge: TextStyle(
          fontSize: AppFontSize.large.value.sp,
          fontWeight: FontWeight.w600,
          color: AppColor.instance.white,
          fontFamily: 'EuclidCircular',
        ),
        labelLarge: TextStyle(
          fontSize: AppFontSize.extraLarge.value.sp,
          fontWeight: FontWeight.w600,
          color: AppColor.instance.white,
          fontFamily: 'EuclidCircular',
        ),
        displaySmall: TextStyle(
          fontSize: AppFontSize.small.value.sp,
          fontWeight: FontWeight.w500,
          color: AppColor.instance.white,
          fontFamily: 'EuclidCircular',
        ),
        displayMedium: TextStyle(
          fontSize: AppFontSize.normal.value.sp,
          fontWeight: FontWeight.w500,
          color: AppColor.instance.white,
          fontFamily: 'EuclidCircular',
        ),
        bodyLarge: TextStyle(
          fontSize: AppFontSize.medium.value.sp,
          fontWeight: FontWeight.w400,
          fontFamily: 'EuclidCircular',
        ),
        titleMedium: TextStyle(
          fontSize: AppFontSize.medium.value.sp,
          fontWeight: FontWeight.w700,
          fontFamily: 'EuclidCircular',
        ),
        titleSmall: TextStyle(
          fontSize: AppFontSize.small.value.sp,
          fontWeight: FontWeight.w600,
          fontFamily: 'EuclidCircular',
        ),
        bodyMedium: TextStyle(
          fontSize: AppFontSize.small.value.sp,
          fontWeight: FontWeight.w400,
          fontFamily: 'EuclidCircular',
        ),
      ),

      filledButtonTheme: _filledButtonTheme,
      inputDecorationTheme: _inputDecorationTheme,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColor.instance.primaryColor,
      colorScheme: _CustomColorScheme(),
    );
  }

  FilledButtonThemeData get _filledButtonTheme {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        textStyle: TextStyle(
          fontSize: AppFontSize.normal.value.sp,
          fontWeight: FontWeight.w500,
          color: AppColor.instance.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.eighteen(),
        ),
        backgroundColor: AppColor.instance.redColor,
        foregroundColor: AppColor.instance.white,
      ),
    );
  }

  InputDecorationTheme get _inputDecorationTheme {
    return InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(vertical: 19.h),
      filled: true,
      prefixIconConstraints: BoxConstraints(
        minWidth: 25.w,
        minHeight: 17.h,
      ),
      suffixIconConstraints: BoxConstraints(
        minWidth: 25.w,
        minHeight: 17.h,
      ),
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
        borderRadius: AppRadius.eighteen(),
        borderSide: BorderSide(
          color: AppColor.instance.verySoftBlack,
        ),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: AppRadius.eighteen(),
        borderSide: BorderSide(
          color: AppColor.instance.verySoftBlack,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: AppRadius.eighteen(),
        borderSide: BorderSide(
          color: AppColor.instance.verySoftBlack,
        ),
      ),
    );
  }

  BottomSheetThemeData get _bottomSheetTheme {
    return BottomSheetThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.bottomSheetRadius(),
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

@immutable
final class _CustomColorScheme extends ColorScheme {
  _CustomColorScheme()
    : super.dark(
        primary: AppColor.instance.primaryColor,
      );
}
