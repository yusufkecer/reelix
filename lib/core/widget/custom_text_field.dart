import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';

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
    return SizedBox(
      width: context.sized.width,
      height: 54.h,
      child: TextField(
        controller: controller,
        obscureText: isObscure,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Image.asset(
            prefixIcon,
            width: 13.w,
            height: 17.h,
          ),
          suffixIcon: suffixIcon != null
              ? GestureDetector(
                  onTap: onSuffixIconTap,
                  child: Image.asset(
                    suffixIcon!,
                    width: 13.w,
                    height: 17.h,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
