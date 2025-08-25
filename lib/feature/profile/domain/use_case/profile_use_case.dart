import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:reelix/core/index.dart';
import 'package:reelix/domain/index.dart';
import 'package:reelix/feature/profile/domain/repository/profile_repository.dart';

@injectable
@immutable
final class ProfileUseCase
    implements
        BaseUseCase<UserEntity, List<MovieEntity>, MovieEntity, UserEntity> {
  final ProfileRepository _repository;

  const ProfileUseCase(this._repository);

  @override
  Future<List<MovieEntity>?>? executeWithParams(MovieEntity? params) {
    return _repository.executeWithParams(params);
  }

  @override
  Future<UserEntity?>? execute({UserEntity? param}) {
    return _repository.execute(param: param);
  }
}
