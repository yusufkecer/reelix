import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:reelix/core/index.dart';

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

  static Future<void> updateLanguage({
    required BuildContext context,
    required Lang value,
  }) async {
    await context.setLocale(value.locale);
  }
}
