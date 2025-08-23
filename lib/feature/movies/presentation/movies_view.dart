import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reelix/core/index.dart';
part 'movies_view_model.dart';
part 'widgets/favorite_button.dart';

@RoutePage(name: 'moviesView')
@immutable
final class Movies extends StatefulWidget {
  const Movies({super.key});

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        
      ],
    );
  }
}