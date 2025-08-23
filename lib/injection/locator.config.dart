// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter/material.dart' as _i409;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:reelix/core/cache/cache_manager.dart' as _i208;
import 'package:reelix/core/index.dart' as _i395;
import 'package:reelix/core/init/language/app_localization.dart' as _i943;
import 'package:reelix/core/network/network_manager.dart' as _i191;
import 'package:reelix/core/router/app_router.dart' as _i439;
import 'package:reelix/core/theme/theme_data.dart' as _i93;
import 'package:reelix/feature/login/cubit/login_cubit.dart' as _i96;
import 'package:reelix/feature/login/domain/repository/login_repository.dart'
    as _i63;
import 'package:reelix/feature/login/domain/use_case/login_use_case.dart'
    as _i164;
import 'package:reelix/feature/movies/domain/repository/movie_repository.dart'
    as _i214;
import 'package:reelix/feature/movies/domain/use_case/movie_use_case.dart'
    as _i920;
import 'package:reelix/feature/register/cubit/register_cubit.dart' as _i319;
import 'package:reelix/feature/register/domain/repository/register_repository.dart'
    as _i766;
import 'package:reelix/feature/register/domain/use_case/register_use_case.dart'
    as _i442;
import 'package:reelix/feature/upload_photo/cubit/upload_image_cubit.dart'
    as _i423;
import 'package:reelix/feature/upload_photo/domain/repository/upload_photo_repository.dart'
    as _i434;
import 'package:reelix/feature/upload_photo/domain/use_case/upload_photo_use_case.dart'
    as _i406;
import 'package:reelix/injection/app_module.dart' as _i141;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.lazySingleton<_i208.CacheManager>(() => _i208.CacheManager());
    gh.lazySingleton<_i439.AppRouter>(() => _i439.AppRouter());
    gh.lazySingleton<_i93.CustomTheme>(() => _i93.CustomTheme());
    gh.lazySingleton<_i361.Dio>(() => appModule.dio);
    gh.lazySingleton<_i943.AppLocalization>(
      () => _i943.AppLocalization(
        child: gh<_i409.Widget>(),
        key: gh<_i409.Key>(),
      ),
    );
    gh.lazySingleton<_i191.NetworkManager>(
      () => _i191.NetworkManager(
        dio: gh<_i361.Dio>(),
        cacheManager: gh<_i395.CacheManager>(),
      ),
    );
    gh.factory<_i63.LoginRepository>(
      () => _i63.LoginRepository(gh<_i395.NetworkManager>()),
    );
    gh.factory<_i766.RegisterRepository>(
      () => _i766.RegisterRepository(gh<_i395.NetworkManager>()),
    );
    gh.factory<_i434.UploadPhotoRepository>(
      () => _i434.UploadPhotoRepository(gh<_i395.NetworkManager>()),
    );
    gh.factory<_i214.MovieRepository>(
      () => _i214.MovieRepository(gh<_i395.NetworkManager>()),
    );
    gh.factory<_i406.UploadPhotoUseCase>(
      () => _i406.UploadPhotoUseCase(gh<_i434.UploadPhotoRepository>()),
    );
    gh.factory<_i442.RegisterUseCase>(
      () => _i442.RegisterUseCase(gh<_i766.RegisterRepository>()),
    );
    gh.factory<_i164.LoginUseCase>(
      () => _i164.LoginUseCase(gh<_i63.LoginRepository>()),
    );
    gh.factory<_i920.MovieUseCase>(
      () => _i920.MovieUseCase(gh<_i214.MovieRepository>()),
    );
    gh.factory<_i96.LoginCubit>(
      () => _i96.LoginCubit(gh<_i164.LoginUseCase>(), gh<_i395.CacheManager>()),
    );
    gh.factory<_i319.RegisterCubit>(
      () => _i319.RegisterCubit(
        gh<_i442.RegisterUseCase>(),
        gh<_i395.CacheManager>(),
      ),
    );
    gh.factory<_i423.UploadImageCubit>(
      () => _i423.UploadImageCubit(gh<_i406.UploadPhotoUseCase>()),
    );
    return this;
  }
}

class _$AppModule extends _i141.AppModule {}
