part of '../profile_view.dart';

@immutable
final class MovieCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String genre;
  const MovieCard({
    required this.imageUrl,
    required this.title,
    required this.genre,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: AppRadius.ten(),
          child: CacheImage(
            imageUrl: imageUrl,
            width: SizeValues.oneHundredFiftyThree.value.w,
            height: SizeValues.twoHundredThirteen.value.h,
            fit: BoxFit.cover,
          ),
        ),
        VerticalSpace.sixteen(),
        Text(
          title,
          style: context.general.textTheme.displaySmall,
        ),
        VerticalSpace.six(),
        Text(
          genre,
          style: context.general.textTheme.bodyMedium?.copyWith(
            color: AppColor.instance.veryDarkWhiteText,
          ),
        ),
      ],
    );
  }
}
