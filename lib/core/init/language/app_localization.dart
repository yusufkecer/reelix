import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:reelix/core/index.dart';

@immutable
final class AppLocalization extends EasyLocalization {
  AppLocalization({required super.child, super.key})
    : super(
        startLocale: Lang.tr.locale,
        supportedLocales: _supportedItems,
        path: BasePaths.language,
        useOnlyLangCode: true,
      );

  static final List<Locale> _supportedItems = [
    Lang.tr.locale,
    Lang.en.locale,
  ];
}
