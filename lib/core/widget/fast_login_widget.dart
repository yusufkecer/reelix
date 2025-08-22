import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reelix/core/index.dart';

@immutable
final class FastLoginWidget extends StatelessWidget {
  const FastLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.w,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FastLoginButton(
          icon: AssetPath.google.path.svgImage,
        ),

        FastLoginButton(
          icon: AssetPath.apple.path.svgImage,
        ),
        FastLoginButton(
          icon: AssetPath.facebook.path.svgImage,
        ),
      ],
    );
  }
}
