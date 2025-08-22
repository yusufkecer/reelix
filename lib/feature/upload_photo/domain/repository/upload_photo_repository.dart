import 'package:injectable/injectable.dart';
import 'package:reelix/core/index.dart';
import 'package:reelix/feature/upload_photo/domain/entity/upload_photo_response.dart';

@injectable
final class UploadPhotoRepository implements BaseRepository<UploadPhotoResponse, UploadPhotoResponse, String> {
  final NetworkManager _networkManager;

  const UploadPhotoRepository(this._networkManager);

  @override
  Future<UploadPhotoResponse?> executeWithParams(String path) async {
    try {
      final response = await _networkManager.uploadFile<Map<String, dynamic>?>(
        '/user/upload_photo',
        filePath: path,
      );

      if (response != null) {
        return UploadPhotoResponse.fromJson(response);
      }
      return null;
    } catch (e) {
      'upload image error: $e'.logError('UploadImageRepository');
      rethrow;
    }
  }

  @override
  Future<UploadPhotoResponse?>? execute() {
    throw UnimplementedError();
  }
}
