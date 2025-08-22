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

  Future<void> selectProfileImage(ImageSource source) async {
    try {
      emit(const UploadImageLoading());

      final imageFile = await _uploadImageUseCase.execute(source);
      if (imageFile != null) {
        emit(UploadImageSuccessWithFile(imageFile));
      } else {
        emit(UploadImageFailure(LocaleKeys.upload_photo_failed_to_select_image.tr()));
      }
    } on Exception catch (e) {
      emit(UploadImageFailure(e.toString()));
    }
  }

  Future<void> uploadProfileImage(String imagePath) async {
    try {
      emit(const UploadImageLoading());

      final result = await _uploadImageUseCase.executeWithParams(imagePath);

      if (result != null) {
        emit(UploadImageSuccess(result.photoUrl));
      } else {
        emit(UploadImageFailure(LocaleKeys.upload_photo_failed_to_upload.tr()));
      }
    } on Exception catch (e) {
      emit(UploadImageFailure(e.toString()));
    }
  }
}
