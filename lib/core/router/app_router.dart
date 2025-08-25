import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:reelix/feature/home/presentation/home_view.dart';
import 'package:reelix/feature/login/presentation/login_view.dart';
import 'package:reelix/feature/register/presentation/register_view.dart';
import 'package:reelix/feature/splash/presentation/splash_view.dart';
import 'package:reelix/feature/upload_photo/presentation/upload_photo_view.dart';

part 'app_router.gr.dart';

@lazySingleton
@AutoRouterConfig()
final class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashView.page, initial: true),
    AutoRoute(page: LoginView.page),
    AutoRoute(page: RegisterView.page),
    AutoRoute(page: UploadPhotoView.page),
    AutoRoute(page: HomeView.page),
  ];
}
