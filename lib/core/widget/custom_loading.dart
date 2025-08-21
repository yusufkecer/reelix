import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:reelix/core/index.dart';

@immutable
final class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      AssetPath.loading.path.lottie,
    );
  }
}
