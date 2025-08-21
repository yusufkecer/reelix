import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:reelix/core/index.dart';
import 'package:reelix/injection/locator.dart';

@immutable
abstract final class InitApp {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Locator.initializeService();
    await Locator.sl<CacheManager>().init();
    await EasyLocalization.ensureInitialized();
  }
}
