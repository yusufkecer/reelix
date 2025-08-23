part of '../movies_view.dart';

@immutable
final class _FavoriteButton extends StatelessWidget {
  const _FavoriteButton({required this.onTap, required this.isFavorite, super.key});
  final VoidCallback onTap;
  final bool isFavorite;

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
        child: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: AppColor.instance.softBlack,
        ),
      ),
    );
  }
}
