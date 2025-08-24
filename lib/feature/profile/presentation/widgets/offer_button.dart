part of '../profile_view.dart';

@immutable
final class _OfferButton extends StatelessWidget {
  const _OfferButton({required this.onPressed, required this.label});
  final void Function()? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 111.w,
      height: 33.h,
      child: FilledButton(
        style: FilledButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: AppRadius.fifty(),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            SizedBox(width: SizeValues.eleven.value.w),
            SvgPicture.asset(
              AssetPath.diamond.path.svgImage,
              width: 14.w,
              height: 12.h,
            ),
            SizedBox(width: SizeValues.xxs.value.w),
            Text(
              label,
              style: context.general.textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
