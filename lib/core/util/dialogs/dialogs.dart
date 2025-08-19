import 'package:auto_route/auto_route.dart';
import 'package:date_app/core/index.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

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
        content: message,
        actions: [
          TextButton(onPressed: () => context.pop(), child: Text(LocaleKeys.dialog_ok.tr())),
        ],
      ),
    );
  }
}
