part of '../../profile_view.dart';

class _PriceCard extends StatelessWidget {
  const _PriceCard({
    required this.sale,
    required this.old,
    required this.token,
    required this.price,
    required this.color,
  });

  final String sale;
  final String old;
  final String token;
  final String price;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110.w,
      height: 230.h,
      child: Stack(
        children: [
          Positioned(
            top: 10.h,
            child: Container(
              height: 210.h,
              width: 110.w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    color,
                    AppColor.instance.redColor,
                  ],
                ),
                border: Border.all(
                  color: AppColor.instance.veryDarkWhiteText,
                  width: 1.5,
                ),
                borderRadius: AppRadius.twenty(),
              ),
              child: Column(
                children: [
                  VerticalSpace.fortyFive(),
                  Text(
                    old,
                    style: context.general.textTheme.displayMedium?.copyWith(
                      decoration: TextDecoration.lineThrough,
                      decorationColor: AppColor.instance.white,
                    ),
                  ),
                  Text(token, style: context.general.textTheme.titleLarge),
                  Text(
                    LocaleKeys.profile_offer_token.tr(),
                    style: context.general.textTheme.displaySmall,
                  ),
                  VerticalSpace.twentyFive(),
                  Container(
                    width: 80.w,
                    height: 0.5.h,
                    color: AppColor.instance.veryDarkWhiteText,
                  ),
                  VerticalSpace.s(),
                  Text(
                    price,
                    style: context.general.textTheme.titleLarge?.copyWith(
                      fontSize: AppFontSize.normal.value.sp,
                    ),
                  ),
                  Text(
                    LocaleKeys.profile_offer_premium_per_week.tr(),
                    style: context.general.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 25.w,
            right: 25.w,
            child: Container(
              height: 25.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: RadialGradient(
                  colors: [
                    AppColor.instance.white,
                    color,
                  ],
                  focal: Alignment.center,
                  focalRadius: 5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.instance.white,
                    blurRadius: 3,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  sale,
                  style: context.general.textTheme.displaySmall,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
