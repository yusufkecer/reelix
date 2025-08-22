import 'package:flutter/material.dart';

@immutable
final class ImageSourceSelectionDialog extends StatelessWidget {
  final String option1;
  final String option2;
  final void Function() onOption1Tap;
  final void Function() onOption2Tap;
  final String title;
  const ImageSourceSelectionDialog({
    required this.option1,
    required this.option2,
    required this.onOption1Tap,
    required this.onOption2Tap,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: Text(option1),
            onTap: onOption1Tap,
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: Text(option2),
            onTap: onOption2Tap,
          ),
        ],
      ),
    );
  }
}
