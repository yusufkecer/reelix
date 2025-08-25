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
        VerticalSpace.twentyThree(),
        CustomLeadingButton(
          onTap: () {
            AppLocalization.updateLanguage(
              context,
              context.locale == Lang.tr.locale ? Lang.en : Lang.tr,
            );
          },
          image: AssetPath.world.path.pngImage,
        ),
        VerticalSpace.eightyEight(),
        Text(
          widget.title.tr(),
          style: context.general.textTheme.displayMedium,
          textAlign: TextAlign.center,
        ),
        VerticalSpace.nineteen(),
        _OfferButton(
          onPressed: () {},
          label: LocaleKeys.profile_limited_offer,
        ),
        VerticalSpace.twentyFour(),
      ],
    );
  }
}
