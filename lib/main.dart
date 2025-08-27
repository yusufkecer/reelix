import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reelix/core/index.dart';
import 'package:reelix/injection/locator.dart';

Future<void> main() async {
  await InitApp.init();

  runZonedGuarded(
    () {
      runApp(
        ScreenUtilInit(
          designSize: const Size(402, 844),
          minTextAdapt: true,
          splitScreenMode: true,
          child: AppLocalization(
            child: const Reelix(),
          ),
        ),
      );
    },
    (error, stackTrace) {
      FirebaseCrashlytics.instance.recordError(error, stackTrace);
    },
  );
}

class Reelix extends StatelessWidget {
  const Reelix({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppUtil.appName,
      theme: Locator.sl<CustomTheme>().theme,
      routerConfig: Locator.sl<AppRouter>().config(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
