import 'package:date_app/core/index.dart';
import 'package:date_app/injection/locator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  await InitApp.init();
  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: AppLocalization(
        child: const DateApp(),
      ),
    ),
  );
}

class DateApp extends StatelessWidget {
  const DateApp({super.key});

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
