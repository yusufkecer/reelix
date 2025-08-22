
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:reelix/core/index.dart';
import 'package:reelix/feature/upload_photo/domain/entity/upload_image_response.dart';
import 'package:reelix/feature/upload_photo/domain/repository/upload_image_repository.dart';

@injectable
@immutable
final class UploadImageUseCase implements BaseUseCase<UploadImageResponse, UploadImageResponse, UploadImageParams> {
  final UploadImageRepository _repository;

  const UploadImageUseCase(this._repository);

  @override
  Future<UploadImageResponse?>? executeWithParams(UploadImageParams params) {
    return _repository.executeWithParams(params);
  }

  @override
  Future<UploadImageResponse?>? execute() {
    throw UnimplementedError();
  }
}
