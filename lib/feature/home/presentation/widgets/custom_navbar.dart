part of '../home_view.dart';

@immutable
final class CustomNavbar extends StatefulWidget {
  final void Function(int) onTapHome;
  final void Function(int) onTapProfile;
  const CustomNavbar({
    required this.onTapHome,
    required this.onTapProfile,
    super.key,
  });

  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: context.sized.width,
          height: SizeValues.seventy.value.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              stops: const [0.0, 0.6],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                AppColor.instance.black,
                AppColor.instance.transparent,
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
                  onTap: widget.onTapHome,
                  currentIndex: 0,
                ),
                HorizontalSpace.sixteen(),
                _CustomNavbarItem(
                  currentIndex: 1,
                  icon: AssetPath.profile.path.svgImage,
                  label: LocaleKeys.home_navbar_profile.tr(),
                  onTap: widget.onTapProfile,
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

class _KeepAliveWrapper extends StatefulWidget {
  final Widget child;

  const _KeepAliveWrapper({required this.child});

  @override
  State<_KeepAliveWrapper> createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<_KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}
