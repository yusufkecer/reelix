part of '../home_view.dart';

@immutable
final class CustomNavbar extends StatelessWidget {
  final void Function(int) onTapHome;
  final void Function(int) onTapProfile;
  const CustomNavbar({
    required this.onTapHome,
    required this.onTapProfile,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: context.sized.width,
          height: SizeValues.seventy.value.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColor.instance.transparent,
                AppColor.instance.black,
              ],
            ),
          ),
        ),
        Container(
          height: SizeValues.seventy.value.h,
          width: context.sized.width,
          decoration: BoxDecoration(
            color: AppColor.instance.primaryColor,
          ),
          child: Padding(
            padding: AppPadding.horizontalSixtySeven(),
            child: Row(
              children: [
                _CustomNavbarItem(
                  icon: AssetPath.home.path.svgImage,
                  label: LocaleKeys.home_navbar_home.tr(),
                  onTap: onTapHome,
                  currentIndex: 0,
                ),
                HorizontalSpace.sixteen(),
                _CustomNavbarItem(
                  currentIndex: 1,
                  icon: AssetPath.profile.path.svgImage,
                  label: LocaleKeys.home_navbar_profile.tr(),
                  onTap: onTapProfile,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

@immutable
final class _CustomNavbarItem extends StatelessWidget {
  final String icon;
  final String label;
  final void Function(int) onTap;
  final int currentIndex;

  const _CustomNavbarItem({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.bottomSixteen(),
      child: InkWell(
        onTap: () => onTap(currentIndex),
        child: Container(
          height: SizeValues.fortyOne.value.h,
          width: SizeValues.oneHundredTwentyFive.value.w,
          decoration: BoxDecoration(
            borderRadius: AppRadius.fifty(),
            border: Border.all(
              width: SizeValues.one.value.w,
              color: AppColor.instance.verySoftBlack,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                width: SizeValues.twentyTwo.value.w,
                height: SizeValues.twentyThree.value.h,
              ),
              HorizontalSpace.s(),
              Text(
                label,
                style: context.general.textTheme.displaySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
