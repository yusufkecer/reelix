part of '../movies_view.dart';

@immutable
final class _FavoriteButton extends StatelessWidget {
  const _FavoriteButton({required this.onTap, required this.isFavorite});
  final VoidCallback onTap;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: SizeValues.seventyTwo.value.h,
        width: SizeValues.fortyNine.value.w,
        decoration: BoxDecoration(
          color: AppColor.instance.verySoftBlack,
          borderRadius: AppRadius.fifty(),
          border: Border.all(
            color: AppColor.instance.verySoftBlack,
            width: SizeValues.one.value.w,
          ),
        ),
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
            isFavorite
                ? AppColor.instance.buttonPrimaryColor
                : AppColor.instance.white,
            BlendMode.srcIn,
          ),
          child: const Icon(
            Icons.favorite,
          ),
        ),
      ),
    );
  }
}
