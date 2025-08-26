part of '../profile_view.dart';

mixin _BottomSheetMixin {
  void customBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return const _BottomSheet();
      },
    );
  }
}
