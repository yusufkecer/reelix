part of 'splash_view.dart';

mixin _SplashViewModel on State<Splash> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _initServices();
    });
  }

  Future<void> _initServices() async {
    await Locator.sl<CacheManager>().init();

    await _checkToken();
    FlutterNativeSplash.remove();
  }

  Future<void> _checkToken() async {
    await Locator.sl<CacheManager>().deleteToken();
    final token = await Locator.sl<CacheManager>().getToken();
    if (token != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.router.pushAndPopUntil(
          const HomeView(),
          predicate: (route) => false,
        );
      });
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.router.pushAndPopUntil(
          const LoginView(),
          predicate: (route) => false,
        );
      });
    }
  }
}
