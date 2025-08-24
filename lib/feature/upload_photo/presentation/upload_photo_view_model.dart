part of 'upload_photo_view.dart';

mixin _UploadPhotoViewModel on State<_UploadPhotoViewBody>, Dialogs {
  XFile? selectedImage;

  Future<void> onTapUploadButton() async {
    final uploadImageCubit = context.read<UploadImageCubit>();
    final source = await showImageSourceSelectionDialog(
      context,
      title: LocaleKeys.upload_photo_image_source_selection_dialog_title.tr(),
      option1: LocaleKeys.upload_photo_image_source_selection_dialog_option1
          .tr(),
      option2: LocaleKeys.upload_photo_image_source_selection_dialog_option2
          .tr(),
      onOption1Tap: () => context.pop(ImageSource.camera),
      onOption2Tap: () => context.pop(ImageSource.gallery),
    );

    if (source != null) {
      await uploadImageCubit.selectImage(source);
    }
  }

  void onTapContinueButton() {
    final cubit = context.read<UploadImageCubit>();
    if (selectedImage != null) {
      cubit.uploadImage(selectedImage!);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select an image first')),
      );
    }
  }
}
