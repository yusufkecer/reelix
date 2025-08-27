part of '../movies_view.dart';

@immutable
final class _MovieContent extends StatelessWidget {
  const _MovieContent({
    required this.title,
    required this.description,
  });
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AssetPath.logo.path.svgImage,
          width: SizeValues.forty.value.w,
          height: SizeValues.forty.value.h,
        ),
        HorizontalSpace.sixteen(),
        SizedBox(
          width: context.sized.width - 140.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: context.general.textTheme.displayLarge,
              ),
              VerticalSpace.xxs(),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: description.length > 60 ? '${description.substring(0, 60)} ' : '$description ',
                      style: context.general.textTheme.bodyLarge,
                    ),
                    TextSpan(
                      text: LocaleKeys.home_movies_more.tr(),
                      style: context.general.textTheme.titleMedium,
                    ),
                  ],
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
