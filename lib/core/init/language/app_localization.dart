import 'package:date_app/core/index.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@immutable
@lazySingleton
final class AppLocalization extends EasyLocalization {
  AppLocalization({
    required super.child,
    super.key,
  }) : super(
         startLocale: Lang.tr.locale,
         supportedLocales: _supportedItems,
         path: BasePaths.language,
         useOnlyLangCode: true,
       );

  static final List<Locale> _supportedItems = [
    Lang.tr.locale,
    Lang.en.locale,
  ];

  Future<void> updateLanguage({
    required BuildContext context,
    required Lang value,
  }) => context.setLocale(value.locale);
}
