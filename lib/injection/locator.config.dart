// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:reelix/core/cache/cache_manager.dart' as _i415;
import 'package:reelix/core/index.dart' as _i183;
import 'package:reelix/core/init/language/app_localization.dart' as _i396;
import 'package:reelix/core/network/network_manager.dart' as _i277;
import 'package:reelix/core/router/app_router.dart' as _i1068;
import 'package:reelix/core/theme/theme_data.dart' as _i338;
import 'package:reelix/feature/login/cubit/login_cubit.dart' as _i784;
import 'package:reelix/feature/login/domain/repository/login_repository.dart'
    as _i195;
import 'package:reelix/feature/login/domain/use_case/login_use_case.dart'
    as _i172;
import 'package:reelix/feature/register/cubit/register_cubit.dart' as _i431;
import 'package:reelix/feature/register/domain/repository/register_repository.dart'
    as _i286;
import 'package:reelix/feature/register/domain/use_case/register_use_case.dart'
    as _i772;
import 'package:reelix/injection/app_module.dart' as _i634;
import 'package:dio/dio.dart' as _i361;
import 'package:flutter/material.dart' as _i409;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.lazySingleton<_i415.CacheManager>(() => _i415.CacheManager());
    gh.lazySingleton<_i1068.AppRouter>(() => _i1068.AppRouter());
    gh.lazySingleton<_i338.CustomTheme>(() => _i338.CustomTheme());
    gh.lazySingleton<_i361.Dio>(() => appModule.dio);
    gh.lazySingleton<_i396.AppLocalization>(
      () => _i396.AppLocalization(
        child: gh<_i409.Widget>(),
        key: gh<_i409.Key>(),
      ),
    );
    gh.lazySingleton<_i277.NetworkManager>(
      () => _i277.NetworkManager(
        dio: gh<_i361.Dio>(),
        cacheManager: gh<_i183.CacheManager>(),
      ),
    );
    gh.factory<_i195.LoginRepository>(
      () => _i195.LoginRepository(gh<_i183.NetworkManager>()),
    );
    gh.factory<_i286.RegisterRepository>(
      () => _i286.RegisterRepository(gh<_i183.NetworkManager>()),
    );
    gh.factory<_i172.LoginUseCase>(
      () => _i172.LoginUseCase(gh<_i195.LoginRepository>()),
    );
    gh.factory<_i784.LoginCubit>(
      () =>
          _i784.LoginCubit(gh<_i172.LoginUseCase>(), gh<_i183.CacheManager>()),
    );
    gh.factory<_i772.RegisterUseCase>(
      () => _i772.RegisterUseCase(gh<_i286.RegisterRepository>()),
    );
    gh.factory<_i431.RegisterCubit>(
      () => _i431.RegisterCubit(
        gh<_i772.RegisterUseCase>(),
        gh<_i183.CacheManager>(),
      ),
    );
    return this;
  }
}

class _$AppModule extends _i634.AppModule {}
