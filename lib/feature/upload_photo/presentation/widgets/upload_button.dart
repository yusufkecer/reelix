part of '../upload_photo_view.dart';

@immutable
final class UploadButton extends StatelessWidget {
  final String? image;
  final VoidCallback? onTap;
  const UploadButton({super.key, this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        height: 164.h,
        width: 169.w,
        decoration: _CustomDecoration(),
        child: image == null ? Image.asset(
          AssetPath.addPhoto.path.pngImage,
          width: 85.25.w,
          height: 85.25.h,
        ) : Image.network(
          image!,
          width: 85.25.w,
          height: 85.25.h,
        ),
      ),
    );
  }
}

final class _CustomDecoration extends BoxDecoration {
  _CustomDecoration()
    : super(
        color: AppColor.instance.verySoftBlack,
        borderRadius: const AppRadius.thirtyOne(),
        border: Border.all(
          color: AppColor.instance.verySoftBlack,
          width: 1.5.w,
        ),
      );
}
