import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:reelix/core/cache/cache_manager.dart';
import 'package:reelix/core/router/app_router.dart';
import 'package:reelix/injection/locator.dart';
part 'splash_view_model.dart';

@RoutePage(name: "SplashView")
@immutable
final class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with _SplashViewModel {
  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
