import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:reelix/feature/login/presentation/login_view.dart';
import 'package:reelix/feature/register/presentation/register_view.dart';

part 'app_router.gr.dart';

@lazySingleton
@AutoRouterConfig()
final class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginView.page, initial: true),
    AutoRoute(page: RegisterView.page),
  ];
}
