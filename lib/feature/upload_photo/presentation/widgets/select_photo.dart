part of '../upload_photo_view.dart';

@immutable
final class _SelectPhotoButton extends StatelessWidget {
  final XFile? image;
  final VoidCallback? onTap;
  const _SelectPhotoButton({this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        height: SizeValues.oneHundredSixtyFour.value.h,
        width: SizeValues.oneHundredSixtyNine.value.w,
        decoration: _CustomDecoration(),
        child: image == null
            ? Image.asset(
                AssetPath.addPhoto.path.pngImage,
                width: SizeValues.eightyFivePointTwoFive.value.w,
                height: SizeValues.eightyFivePointTwoFive.value.h,
              )
            : Image.file(
                File(image!.path),
                fit: BoxFit.cover,
                width: SizeValues.eightyFivePointTwoFive.value.w,
                height: SizeValues.eightyFivePointTwoFive.value.h,
              ),
      ),
    );
  }
}

final class _CustomDecoration extends BoxDecoration {
  _CustomDecoration()
    : super(
        color: AppColor.instance.softBlack,
        borderRadius: AppRadius.thirtyOne(),
        border: Border.all(
          color: AppColor.instance.verySoftBlack,
          width: SizeValues.onePointFive.value.w,
        ),
      );
}
