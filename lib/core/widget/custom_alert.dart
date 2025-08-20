import 'package:flutter/material.dart';

@immutable
final class CustomAlert extends StatelessWidget {
  const CustomAlert({required this.title, required this.content, required this.actions, super.key});

  final String title;
  final String content;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: actions,
    );
  }
}
