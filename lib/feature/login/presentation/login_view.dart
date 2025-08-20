import 'package:auto_route/auto_route.dart';
import 'package:date_app/core/index.dart';
import 'package:date_app/feature/login/cubit/cubit/login_cubit.dart';
import 'package:date_app/feature/login/domain/entity/login_params.dart';
import 'package:date_app/injection/locator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';

part 'login_view_model.dart';

@RoutePage(name: 'LoginView')
@immutable
final class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Locator.sl<LoginCubit>(),
      child: const Scaffold(
        body: _LoginBody(),
      ),
    );
  }
}

@immutable
final class _LoginBody extends StatefulWidget {
  const _LoginBody();

  @override
  State<_LoginBody> createState() => __LoginBodyState();
}

class __LoginBodyState extends State<_LoginBody> with Dialogs, LoginViewMixin {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppPadding.horizontalThirtyNine(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 300.h),
              Text(LocaleKeys.auth_login_title.tr(), style: context.general.appTheme.textTheme.displayLarge).tr(),
              SizedBox(height: 8.h),
              Text(
                LocaleKeys.auth_login_subtitle.tr(),
                style: context.general.appTheme.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ).tr(),
              SizedBox(height: 40.h),
              CustomTextField(
                controller: emailController,
                hintText: LocaleKeys.auth_login_email.tr(),
                prefixIcon: AssetPath.mail.path.pngImage,
                onSuffixIconTap: () {},
              ),
              SizedBox(height: 14.h),
              ValueListenableBuilder<bool>(
                valueListenable: obscureNotifier,
                builder: (context, isObscure, child) {
                  return CustomTextField(
                    controller: passwordController,
                    isObscure: isObscure,
                    hintText: LocaleKeys.auth_login_password.tr(),
                    prefixIcon: AssetPath.lock.path.pngImage,
                    onSuffixIconTap: onSuffixIconTap,
                    suffixIcon: AssetPath.hide.path.pngImage,
                  );
                },
              ),
              SizedBox(height: 30.h),
              Row(
                children: [
                  InkWell(
                    child: Text.rich(
                      TextSpan(
                        text: LocaleKeys.auth_login_forgot_password.tr(),
                        style: context.general.appTheme.textTheme.bodyMedium?.copyWith(
                          decoration: TextDecoration.underline,
                          decorationThickness: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              SizedBox(
                width: context.sized.dynamicWidth(.8),
                height: 50.h,
                child: CustomButton(
                  onPressed: onLoginButtonTap,
                  child: Text(
                    LocaleKeys.auth_login_login_button.tr(),
                  ).tr(),
                ),
              ),
              SizedBox(height: 37.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FastLoginButton(
                    icon: AssetPath.google.path.pngImage,
                  ),
                  SizedBox(width: 10.w),
                  FastLoginButton(
                    icon: AssetPath.apple.path.pngImage,
                  ),
                  SizedBox(width: 10.w),
                  FastLoginButton(
                    icon: AssetPath.facebook.path.pngImage,
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.auth_login_register_text.tr(),
                    style: context.general.appTheme.textTheme.bodyMedium?.copyWith(
                      color: ColorManager.instance.veryDarkWhiteText,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      LocaleKeys.auth_login_register_button.tr(),
                      style: context.general.appTheme.textTheme.bodyMedium?.copyWith(
                        color: ColorManager.instance.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 39.h),
            ],
          ),
        ),
      ),
    );
  }
}
