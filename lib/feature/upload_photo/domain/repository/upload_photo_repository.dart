import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:reelix/core/index.dart';
import 'package:reelix/feature/upload_photo/domain/entity/upload_photo_response.dart';

@injectable
final class UploadPhotoRepository
    implements BaseRepository<UploadPhotoResponse, UploadPhotoResponse, XFile, XFile> {
  final NetworkManager _networkManager;

  const UploadPhotoRepository(this._networkManager);

  @override
  Future<UploadPhotoResponse?> executeWithParams(XFile path) async {
    try {
      final response = await _networkManager.uploadFile(
        File(path.path),
        endpoint: '/user/upload_photo',
      );
      final data = response['data'] as Map<String, dynamic>;
      final res = response['response'] as Map<String, dynamic>;
      if (res['code'] == 200) {
        return UploadPhotoResponse.fromJson(data);
      } else {
        return UploadPhotoResponse.fromJson(res);
      }
    } catch (e) {
      'upload image error: $e'.logError('UploadImageRepository');
      rethrow;
    }
  }

  @override
  Future<UploadPhotoResponse?>? execute({XFile? param}) {
    throw UnimplementedError();
  }
}
