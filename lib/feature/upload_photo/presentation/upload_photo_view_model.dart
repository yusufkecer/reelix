part of 'upload_photo_view.dart';

mixin _UploadPhotoViewModel on State<_UploadPhotoViewBody>, Dialogs {
  XFile? _selectedImage;

  Future<void> _onTapUploadButton() async {
    final uploadImageCubit = context.read<UploadPhotoCubit>();
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

  Future<void> _onTapContinueButton() async {
    final cubit = context.read<UploadPhotoCubit>();
    if (_selectedImage != null) {
      await cubit.uploadImage(_selectedImage!);
      if (!mounted) return;
      if (cubit.state is UploadPhotoSuccess) {
        showSuccessDialog(
          context,
          LocaleKeys.upload_photo_photo_uploaded_successfully.tr(),
          onPressed: () {
            context.pop();
          },
        );
      }
    } else {
      showErrorDialog(
        context,
        LocaleKeys.upload_photo_failed_to_select_image.tr(),
      );
    }
  }
}
