part of '../movies_view.dart';

@immutable
final class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: SizeValues.seventyTwo.value.h,
        width: SizeValues.fortyOne.value.w,
        decoration: BoxDecoration(
          color: AppColor.instance.lightTransparent,
          borderRadius: AppRadius.fifty(),
          border: Border.all(
            color: AppColor.instance.verySoftBlack,
            width: SizeValues.one.value.w,
          ),
        ),
      ),
    );
  }
}
