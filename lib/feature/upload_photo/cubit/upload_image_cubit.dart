import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:reelix/core/index.dart';
import 'package:reelix/feature/upload_photo/domain/use_case/upload_photo_use_case.dart';

part 'upload_image_state.dart';

@injectable
final class UploadImageCubit extends Cubit<UploadImageState> {
  final UploadPhotoUseCase _uploadImageUseCase;

  UploadImageCubit(this._uploadImageUseCase) : super(const UploadImageInitial());

  Future<void> selectImage(ImageSource source) async {
    try {
      emit(const UploadImageLoading());

      final imageFile = await _uploadImageUseCase.execute(source);
      if (imageFile != null) {
        'image file: ${imageFile.path}'.logInfo('UploadImageCubit');
        emit(UploadImageSuccessWithFile(imageFile));
      } else {
        'image file is null'.logInfo('UploadImageCubit');
        emit(UploadImageFailure(LocaleKeys.upload_photo_failed_to_select_image.tr()));
      }
    } on Exception catch (e) {
      'error selecting image: $e'.logError('UploadImageCubit');
      emit(UploadImageFailure(e.toString()));
    }
  }

  Future<void> uploadImage(XFile imagePath) async {
    try {
      emit(const UploadImageLoading());
      'uploading image: ${imagePath.path}'.logInfo('UploadImageCubit');
      final result = await _uploadImageUseCase.executeWithParams(imagePath);
      'result: $result'.logInfo('UploadImageCubit');
      if (result != null && result.photoUrl != null) {
        emit(UploadImageSuccess(result.photoUrl!));
      } else {
        emit(UploadImageFailure(LocaleKeys.upload_photo_failed_to_upload.tr()));
      }
    } on Exception catch (e) {
      emit(UploadImageFailure(e.toString()));
    }
  }
}
