part of '../profile_view.dart';

@immutable
final class _OfferButton extends StatelessWidget {
  const _OfferButton({required this.onPressed, required this.label});
  final void Function()? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeValues.oneHundredEleven.value.w,
      height: SizeValues.thirtyThree.value.h,
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
            HorizontalSpace.ss(),
            SvgPicture.asset(
              AssetPath.diamond.path.svgImage,
              width: SizeValues.fourteen.value.w,
              height: SizeValues.ss.value.h,
            ),
            HorizontalSpace.xxs(),
            Text(
              label.tr(),
              style: context.general.textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
