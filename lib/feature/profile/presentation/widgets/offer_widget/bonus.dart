part of '../../profile_view.dart';

class _BonusCard extends StatelessWidget {
  const _BonusCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeValues.threeHundredSixty.value.w,
      height: SizeValues.oneHundredSeventyOne.value.h,
      decoration: BoxDecoration(
        color: AppColor.instance.softBlack,
        borderRadius: AppRadius.thirtyOne(),
        border: Border.all(
          color: AppColor.instance.softBlack,
        ),
      ),
      child: Padding(
        padding: const AppPadding.allSixteen(),
        child: Column(
          children: [
            Text(
              LocaleKeys.profile_offer_bonus.tr(),
              style: context.general.textTheme.displayLarge?.copyWith(
                fontSize: AppFontSize.large.value.sp,
              ),
            ),
            VerticalSpace.fourteen(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _BonusItem(
                  image: AssetPath.gem.path.pngImage,
                  labelText: LocaleKeys.profile_offer_premium_account,
                ),
                _BonusItem(
                  image: AssetPath.multiHeart.path.pngImage,
                  labelText: LocaleKeys.profile_offer_more_match,
                ),
                _BonusItem(
                  image: AssetPath.arrow.path.pngImage,
                  labelText: LocaleKeys.profile_offer_be_featured,
                ),
                _BonusItem(
                  image: AssetPath.heart.path.pngImage,
                  labelText: LocaleKeys.profile_offer_more_likes,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BonusItem extends StatelessWidget {
  const _BonusItem({
    required this.labelText,
    required this.image,
  });
  final String labelText;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeValues.seventyFive.value.w,
      child: Column(
        children: [
          Container(
            width: SizeValues.fiftyFive.value.w,
            height: SizeValues.fiftyFive.value.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColor.instance.white,
                ),
                BoxShadow(
                  color: AppColor.instance.darkRed,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Image.asset(image),
          ),
          VerticalSpace.fourteen(),
          Text(
            labelText.tr(),
            textAlign: TextAlign.center,
            style: context.general.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
