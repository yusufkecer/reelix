import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';

@immutable
final class TitleSubtitle extends StatelessWidget {
  const TitleSubtitle({required this.title, required this.subtitle, super.key, this.titleSize = 8});
  final String title;
  final String subtitle;
  final double titleSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: context.general.appTheme.textTheme.displayLarge),
        SizedBox(height: titleSize.h),
        Text(
          subtitle,
          style: context.general.appTheme.textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
