// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [Login]
class LoginView extends PageRouteInfo<void> {
  const LoginView({List<PageRouteInfo>? children})
    : super(LoginView.name, initialChildren: children);

  static const String name = 'LoginView';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const Login();
    },
  );
}

/// generated route for
/// [Register]
class RegisterView extends PageRouteInfo<void> {
  const RegisterView({List<PageRouteInfo>? children})
    : super(RegisterView.name, initialChildren: children);

  static const String name = 'RegisterView';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const Register();
    },
  );
}
