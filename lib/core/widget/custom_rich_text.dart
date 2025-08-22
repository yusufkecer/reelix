import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:reelix/core/index.dart';

@immutable
final class CustomRichText extends StatelessWidget {
  const CustomRichText({
    required this.firstText,
    required this.secondText,
    this.firstTextStyle,
    this.secondTextStyle,
    this.onSecondTextTap,
    super.key,
  });

  final String firstText;
  final String secondText;
  final TextStyle? firstTextStyle;
  final TextStyle? secondTextStyle;
  final VoidCallback? onSecondTextTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: firstText,
            style:
                firstTextStyle ??
                context.general.appTheme.textTheme.bodyMedium?.copyWith(
                  color: AppColor.instance.veryDarkWhiteText,
                ),
          ),
          WidgetSpan(
            child: HorizontalSpace.xs(),
          ),
          TextSpan(
            text: secondText,
            style:
                secondTextStyle ??
                context.general.appTheme.textTheme.bodyMedium?.copyWith(
                  color: AppColor.instance.white,
                ),
            recognizer: TapGestureRecognizer()..onTap = onSecondTextTap,
          ),
        ],
      ),
    );
  }
}
