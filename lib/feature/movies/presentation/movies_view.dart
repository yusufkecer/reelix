import 'package:flutter/gestures.dart';
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
      height: context.sized.height - SizeValues.seventy.value.h,
      child: Stack(
        children: [
          Image.network(
            'https://picsum.photos/200/300',
            fit: BoxFit.cover,
          ),
          _MovieContent(
            title: 'Movie Title',
            description: 'Movie Description',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
