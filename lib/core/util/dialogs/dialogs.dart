import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reelix/core/index.dart';

mixin Dialogs {
  void showLoadingDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => const Center(child: CustomLoading()),
    );
  }

  void showErrorDialog(BuildContext context, String message) {
    showDialog<void>(
      context: context,
      builder: (context) => CustomAlert(
        title: LocaleKeys.dialog_error.tr(),
        content: message.tr(),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text(LocaleKeys.dialog_ok.tr()),
          ),
        ],
      ),
    );
  }

  void showSuccessDialog(
    BuildContext context,
    String message, {
    required void Function() onPressed,
  }) {
    showDialog<void>(
      context: context,
      builder: (context) => CustomAlert(
        title: LocaleKeys.dialog_success.tr(),
        content: message.tr(),
        actions: [
          TextButton(
            onPressed: () {
              onPressed();
              context.pop();
            },
            child: Text(LocaleKeys.dialog_ok.tr()),
          ),
        ],
      ),
    );
  }

  Future<ImageSource?> showImageSourceSelectionDialog(
    BuildContext context, {
    required String title,
    required String option1,
    required String option2,
    required void Function() onOption1Tap,
    required void Function() onOption2Tap,
  }) async {
    return showDialog<ImageSource>(
      context: context,
      builder: (BuildContext context) => ImageSourceSelectionDialog(
        title: title,
        option1: option1,
        option2: option2,
        onOption1Tap: onOption1Tap,
        onOption2Tap: onOption2Tap,
      ),
    );
  }
}
