import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';

final class PickImage extends ImagePickerCameraDelegate {
  @override
  Future<XFile?> takePhoto({
    ImageSource source = ImageSource.gallery,
    ImagePickerCameraDelegateOptions options = const ImagePickerCameraDelegateOptions(),
  }) async {
    final image = await ImagePicker().pickImage(
      source: source,
      preferredCameraDevice: options.preferredCameraDevice,
    );
    return image;
  }

  @override
  Future<XFile?> takeVideo({
    ImageSource source = ImageSource.gallery,
    ImagePickerCameraDelegateOptions options = const ImagePickerCameraDelegateOptions(),
  }) async {
    final video = await ImagePicker().pickVideo(
      source: ImageSource.camera,
      preferredCameraDevice: options.preferredCameraDevice,
    );
    return video;
  }
}
