part of '../profile_view.dart';

@immutable
final class MovieCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  const MovieCard({required this.imageUrl, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: AppRadius.ten(),
          child: Image.network(
            'https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/396e9/MainBefore.jpg',
            width: 153.w,
            height: 213.h,
            fit: BoxFit.cover,
          ),
        ),
        VerticalSpace.sixteen(),
        Text(
          'Movie Title',
          style: context.general.textTheme.displaySmall,
        ),
        VerticalSpace.six(),
        Text(
          'Movie Description',
          style: context.general.textTheme.bodyMedium?.copyWith(
            color: AppColor.instance.veryDarkWhiteText,
          ),
        ),
      ],
    );
  }
}
