import 'package:date_app/core/index.dart';
import 'package:date_app/injection/locator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

@immutable
abstract final class InitApp {
  static Future<void> init() async {
    final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    await Locator.initializeService();
    await Locator.sl<CacheManager>().init();
    await EasyLocalization.ensureInitialized();
  }
}
