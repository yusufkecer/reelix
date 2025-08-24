part of '../upload_photo_view.dart';

@immutable
final class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: AppPadding.leftTwentyThree(),
          child: CustomLeadingButton(
            onTap: () => context.router.maybePop(),
            image: AssetPath.back.path.pngImage,
          ),
        ),
        Text(
          title,
          style: context.general.textTheme.displayMedium,
          textAlign: TextAlign.center,
        ),
        SizedBox(width: SizeValues.fortyFourPointThreeFour.value.w),
      ],
    );
  }
}
