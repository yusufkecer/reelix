part of '../register_view.dart';

@immutable
final class _AgreementWidget extends StatelessWidget {
  const _AgreementWidget();

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: context.general.appTheme.textTheme.bodyMedium?.copyWith(
          color: ColorManager.instance.veryDarkWhiteText,
        ),
        children: [
          TextSpan(text: LocaleKeys.auth_register_agreement_agreement_part_1.tr()),
          WidgetSpan(child: HorizontalSpace.five()),
          TextSpan(
            text: LocaleKeys.auth_register_agreement_agreement_part_2.tr(),
            style: context.general.appTheme.textTheme.bodyMedium?.copyWith(
              decoration: TextDecoration.underline,
            ),
          ),
          WidgetSpan(child: HorizontalSpace.five()),
          TextSpan(text: LocaleKeys.auth_register_agreement_agreement_part_3.tr()),
        ],
      ),
    );
  }
}
