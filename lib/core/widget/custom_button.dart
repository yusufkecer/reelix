import 'package:flutter/material.dart';

@immutable
final class CustomButton extends StatelessWidget {
  const CustomButton({required this.onPressed, required this.child, super.key});
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      child: child,
    );
  }
}
