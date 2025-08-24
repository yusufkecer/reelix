import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:reelix/core/index.dart';
import 'package:reelix/feature/upload_photo/domain/entity/upload_photo_response.dart';
import 'package:reelix/feature/upload_photo/domain/repository/upload_photo_repository.dart';

@injectable
@immutable
final class UploadPhotoUseCase
    implements BaseUseCase<XFile, UploadPhotoResponse, XFile, ImageSource> {
  final UploadPhotoRepository _repository;

  const UploadPhotoUseCase(this._repository);

  @override
  Future<UploadPhotoResponse?>? executeWithParams(XFile path) {
    return _repository.executeWithParams(path);
  }

  @override
  Future<XFile?>? execute({ImageSource? param}) async {
    try {
      XFile? imageFile;

      if (param == ImageSource.camera) {
        imageFile = await PickImage().takePhoto(source: ImageSource.camera);
      } else {
        imageFile = await PickImage().takePhoto();
      }
      return imageFile;
    } on Exception catch (e) {
      'error picking image: $e'.logError('UploadPhotoViewModel');
      return null;
    }
  }
}
