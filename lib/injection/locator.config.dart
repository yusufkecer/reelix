// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:date_app/core/cache/cache_manager.dart' as _i415;
import 'package:date_app/core/index.dart' as _i183;
import 'package:date_app/core/init/language/app_localization.dart' as _i396;
import 'package:date_app/core/router/app_router.dart' as _i1068;
import 'package:date_app/core/theme/theme_data.dart' as _i338;
import 'package:date_app/feature/login/cubit/cubit/login_cubit.dart' as _i784;
import 'package:date_app/feature/login/domain/repository/login_repository.dart'
    as _i195;
import 'package:date_app/feature/login/domain/use_case/login_use_case.dart'
    as _i172;
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
    gh.lazySingleton<_i415.CacheManager>(() => _i415.CacheManager());
    gh.lazySingleton<_i1068.AppRouter>(() => _i1068.AppRouter());
    gh.lazySingleton<_i338.CustomTheme>(() => _i338.CustomTheme());
    gh.factory<_i195.LoginRepository>(
      () => _i195.LoginRepository(gh<_i183.NetworkManager>()),
    );
    gh.factory<_i172.LoginUseCase>(
      () => _i172.LoginUseCase(gh<_i195.LoginRepository>()),
    );
    gh.lazySingleton<_i396.AppLocalization>(
      () => _i396.AppLocalization(
        child: gh<_i409.Widget>(),
        key: gh<_i409.Key>(),
      ),
    );
    gh.factory<_i784.LoginCubit>(
      () =>
          _i784.LoginCubit(gh<_i172.LoginUseCase>(), gh<_i183.CacheManager>()),
    );
    return this;
  }
}
