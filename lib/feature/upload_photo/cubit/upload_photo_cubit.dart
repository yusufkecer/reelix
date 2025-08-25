import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:reelix/core/index.dart';
import 'package:reelix/feature/profile/cubit/profile_cubit/profile_cubit.dart';
import 'package:reelix/feature/upload_photo/domain/use_case/upload_photo_use_case.dart';

part 'upload_photo_state.dart';

@injectable
final class UploadPhotoCubit extends Cubit<UploadPhotoState> {
  UploadPhotoCubit(this._uploadImageUseCase, this._profileCubit)
    : super(const UploadPhotoInitial());
  final UploadPhotoUseCase _uploadImageUseCase;
  final ProfileCubit _profileCubit;

  Future<void> selectImage(ImageSource source) async {
    try {
      emit(const UploadPhotoLoading());

      final imageFile = await _uploadImageUseCase.execute(param: source);
      if (imageFile != null) {
        'image file: ${imageFile.path}'.logInfo('UploadImageCubit');

        emit(UploadPhotoSuccessWithFile(imageFile));
      } else {
        'image file is null'.logInfo('UploadImageCubit');
        emit(
          UploadPhotoFailure(
            LocaleKeys.upload_photo_failed_to_select_image.tr(),
          ),
        );
      }
    } on Exception catch (e) {
      'error selecting image: $e'.logError('UploadImageCubit');
      emit(UploadPhotoFailure(e.toString()));
    }
  }

  Future<void> uploadImage(XFile imagePath) async {
    try {
      emit(const UploadPhotoLoading());
      'uploading image: ${imagePath.path}'.logInfo('UploadImageCubit');
      final result = await _uploadImageUseCase.executeWithParams(imagePath);
      'result: $result'.logInfo('UploadImageCubit');
      if (result != null && result.photoUrl != null) {
        await _profileCubit.getProfile();
        emit(UploadPhotoSuccess(result.photoUrl!));
      } else {
        emit(UploadPhotoFailure(LocaleKeys.upload_photo_failed_to_upload.tr()));
      }
    } on Exception catch (e) {
      emit(UploadPhotoFailure(e.toString()));
    }
  }
}
