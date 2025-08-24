part of '../profile_view.dart';

@immutable
final class _CustomAppBar extends StatefulWidget {
  const _CustomAppBar({required this.title});
  final String title;

  @override
  State<_CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<_CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: SizeValues.twentyThree.value.w),
        CustomLeadingButton(
          onTap: () {
            AppLocalization.updateLanguage(
              context: context,
              value: context.locale == Lang.tr.locale ? Lang.en : Lang.tr,
            );
          },
          image: AssetPath.world.path.pngImage,
        ),
        SizedBox(width: SizeValues.eightyEight.value.w),
        Text(
          widget.title,
          style: context.general.textTheme.displayMedium,
          textAlign: TextAlign.center,
        ),
        SizedBox(width: SizeValues.nineteen.value.w),
        _OfferButton(
          onPressed: () {},
          label: LocaleKeys.profile_limited_offer.tr(),
        ),
        SizedBox(width: SizeValues.twentyFour.value.w),
      ],
    );
  }
}
