part of '../movies_view.dart';

@immutable
final class _MovieContent extends StatelessWidget {
  const _MovieContent({
    required this.title,
    required this.description,
    required this.onTap,
  });
  final String title;
  final String description;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.horizontalThirtyFour(),
      child: Row(
        children: [
          SvgPicture.asset(
            AssetPath.logo.path.svgImage,
            width: SizeValues.thirty.value.w,
            height: SizeValues.thirty.value.h,
          ),
          HorizontalSpace.sixteen(),
          RichText(
            maxLines: 2,
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$title\n',
                  style: context.general.textTheme.displayLarge,
                ),
                TextSpan(
                  text: '$description ',
                  style: context.general.textTheme.bodyLarge,
                ),
                TextSpan(
                  text: 'Daha fazla bilgi için tıklayınız',
                  style: context.general.textTheme.displayLarge,
                  recognizer: TapGestureRecognizer()..onTap = onTap,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
