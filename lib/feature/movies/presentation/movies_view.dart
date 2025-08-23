import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kartal/kartal.dart';
import 'package:reelix/core/index.dart';
part 'movies_view_model.dart';
part 'widgets/favorite_button.dart';
part 'widgets/movie_content.dart';

@immutable
final class Movies extends StatefulWidget {
  const Movies({super.key});

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.sized.width,
      height: context.sized.height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://petapixel.com/assets/uploads/2024/01/The-Star-of-System-Sol-Rectangle-640x800.jpg',
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 171.h,
            right: 16.w,
            child: _FavoriteButton(
              onTap: () {},
              isFavorite: false,
            ),
          ),
          Positioned(
            bottom: 97.h,
            child: const _MovieContent(
              title: 'Movie Title',
              description:
                  'Movie Description asşdlkf asşdlkf asşdlkf aşskdflşad şasldkflasd asdfasdf asdfasdf asdfasdf',
            ),
          ),
        ],
      ),
    );
  }
}
