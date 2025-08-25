import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reelix/core/index.dart';

@immutable
final class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    this.onSuffixIconTap,
    this.suffixIcon,
    this.isObscure = false,
    super.key,
  });
  final String hintText;
  final String prefixIcon;
  final String? suffixIcon;
  final VoidCallback? onSuffixIconTap;
  final TextEditingController controller;
  final bool isObscure;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isObscure,
      decoration: InputDecoration(
        hintText: hintText.tr(),
        prefixIcon: Padding(
          padding: AppPadding.textFieldPadding(),
          child: SvgPicture.asset(prefixIcon),
        ),
        suffixIcon: suffixIcon != null
            ? Padding(
                padding: AppPadding.rightTwentyFive(),
                child: GestureDetector(
                  onTap: onSuffixIconTap,
                  child: SvgPicture.asset(
                    suffixIcon!,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
