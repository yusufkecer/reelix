import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:reelix/core/index.dart';
import 'package:reelix/feature/upload_photo/domain/entity/upload_image_response.dart';

@injectable
final class UploadImageRepository
    implements BaseRepository<UploadImageResponse, UploadImageResponse, UploadImageParams> {
  final NetworkManager _networkManager;

  const UploadImageRepository(this._networkManager);

  @override
  Future<UploadImageResponse?> executeWithParams(UploadImageResponse params) async {
    try {
      // FormData oluştur
      final formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(params.imagePath),
      });

      final response = await _networkManager.uploadFile<Map<String, dynamic>?>(
        '/user/upload_photo',
        filePath: params.imagePath,
      );

      if (response != null) {
        return UploadImageResponse.fromJson(response);
      }
      return null;
    } catch (e) {
      'upload image error: $e'.logError('UploadImageRepository');
      rethrow;
    }
  }

  @override
  Future<UploadImageResponse?>? execute() {
    // TODO: implement execute
    throw UnimplementedError();
  }
}
