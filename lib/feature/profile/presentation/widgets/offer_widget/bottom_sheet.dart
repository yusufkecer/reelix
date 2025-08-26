part of '../../profile_view.dart';

class _BottomSheet extends StatelessWidget {
  const _BottomSheet();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeValues.sixHundredFifty.value.h,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColor.instance.primaryColor,
            borderRadius: AppRadius.bottomSheetRadius(),
          ),
          child: Stack(
            children: [
              Positioned(
                top: SizeValues.sixHundred.value.h,
                child: Container(
                  width: SizeValues.fourHundred.value.w,
                  height: SizeValues.fourHundred.value.h,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      radius: 0.7,
                      colors: [
                        AppColor.instance.softRed,
                        Colors.transparent,
                      ],
                      tileMode: TileMode.decal,
                      focal: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: -50.h,
                child: Container(
                  width: SizeValues.fourHundred.value.w,
                  height: SizeValues.fourHundred.value.h,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      radius: 0.7,
                      colors: [
                        AppColor.instance.softRed,
                        Colors.transparent,
                      ],
                      tileMode: TileMode.decal,
                      focal: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: context.sized.width,
                child: Padding(
                  padding: const AppPadding.allSixteen(),
                  child: Column(
                    children: [
                      VerticalSpace.s(),
                      Text(
                        LocaleKeys.profile_limited_offer.tr(),
                        style: context.general.textTheme.labelLarge,
                      ),
                      VerticalSpace.five(),
                      SizedBox(
                        width: SizeValues.twoHundredFifty.value.w,
                        child: Text(
                          LocaleKeys.profile_offer_limited_offer_explain.tr(),
                          textAlign: TextAlign.center,
                          style: context.general.textTheme.bodyMedium,
                        ),
                      ),
                      VerticalSpace.ss(),
                      const _BonusCard(),
                      VerticalSpace.l(),
                      Text(
                        LocaleKeys.profile_offer_choose_package.tr(),
                        style: context.general.textTheme.displayMedium,
                      ),
                      VerticalSpace.l(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _PriceCard(
                            price: '₺99,99',
                            sale: '+10%',
                            color: AppColor.instance.darkRed,
                            old: '200',
                            token: '330',
                          ),
                          _PriceCard(
                            price: '₺799,99',
                            sale: '+70%',
                            old: '2.000',
                            token: '3.375',
                            color: AppColor.instance.blueColor,
                          ),
                          _PriceCard(
                            price: '₺399,99',
                            sale: '+35%',
                            token: '1.350',
                            old: '1.000',
                            color: AppColor.instance.darkRed,
                          ),
                        ],
                      ),
                      VerticalSpace.five(),
                      SizedBox(
                        width: double.infinity,
                        height: SizeValues.fiftyThree.value.h,
                        child: CustomButton(
                          onPressed: () {},
                          child: Text(
                            LocaleKeys.profile_offer_see_all_tokens.tr(),
                            style: context.general.textTheme.bodyMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
