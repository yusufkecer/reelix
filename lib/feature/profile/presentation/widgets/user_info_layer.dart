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
      padding: AppPadding.profilePadding(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipOval(
                child: imageUrl.isNotEmpty
                    ? Image.network(
                        imageUrl,
                        height: SizeValues.sixtyTwo.value.h,
                        width: SizeValues.sixtyTwo.value.w,
                        fit: BoxFit.cover,
                      )
                    : const SizedBox.shrink(),
              ),
              HorizontalSpace.nine(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fullName,
                    style: context.general.textTheme.displayMedium,
                  ),
                  VerticalSpace.five(),
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
            width: SizeValues.oneHundredTwentyOne.value.w,
            height: SizeValues.thirtySix.value.h,
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
