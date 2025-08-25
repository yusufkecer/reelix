part of '../profile_view.dart';

class _UserInfoLayer extends StatelessWidget {
  const _UserInfoLayer({
    required this.imageUrl,
    required this.fullName,
    required this.id,
  });
  final String imageUrl;
  final String fullName;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 26.w,
        left: 35.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipOval(
                child: imageUrl.isNotEmpty
                    ? Image.network(
                        imageUrl,
                        height: 62.h,
                        width: 62.w,
                        fit: BoxFit.cover,
                      )
                    : const SizedBox.shrink(),
              ),
              SizedBox(width: SizeValues.nine.value.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fullName,
                    style: context.general.textTheme.displayMedium,
                  ),
                  SizedBox(height: SizeValues.five.value.h),
                  Text(
                    'ID ${id.length > 10 ? id.substring(0, 10) : id}...',
                    style: context.general.textTheme.bodyMedium?.copyWith(
                      color: AppColor.instance.veryDarkWhiteText,
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(
            width: 121.w,
            height: 36.h,
            child: FilledButton(
              style: FilledButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: AppRadius.eight(),
                ),
              ),
              onPressed: () {
                context.pushRoute(const UploadPhotoView());
              },
              child: Text(
                LocaleKeys.profile_add_photo.tr(),
                style: context.general.textTheme.titleMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
