import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';
import 'package:reelix/core/index.dart';
import 'package:reelix/feature/login/cubit/login_cubit.dart';
import 'package:reelix/feature/login/domain/entity/login_params.dart';
import 'package:reelix/injection/locator.dart';

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
    return Padding(
      padding: AppPadding.horizontalThirtyNine(),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            VerticalSpace.threeHundred(),
            TitleSubtitle(
              title: LocaleKeys.auth_login_title.tr(),
              subtitle: LocaleKeys.auth_subtitle.tr(),
            ),
            VerticalSpace.forty(),
            CustomTextField(
              controller: _emailController,
              hintText: LocaleKeys.auth_email.tr(),
              prefixIcon: AssetPath.mail.path.svgImage,
            ),
            VerticalSpace.fourteen(),
            ValueListenableBuilder<bool>(
              valueListenable: _obscureNotifier,
              builder: (context, isObscure, child) {
                return CustomTextField(
                  controller: _passwordController,
                  isObscure: isObscure,
                  hintText: LocaleKeys.auth_password.tr(),
                  prefixIcon: AssetPath.lock.path.svgImage,
                  onSuffixIconTap: _onSuffixIconTap,
                  suffixIcon: AssetPath.hide.path.svgImage,
                );
              },
            ),
            VerticalSpace.thirty(),
            Row(
              children: [
                InkWell(
                  child: Text.rich(
                    TextSpan(
                      text: LocaleKeys.auth_login_forgot_password.tr(),
                      style: context.general.appTheme.textTheme.bodyMedium
                          ?.copyWith(
                            decoration: TextDecoration.underline,
                            decorationThickness: 2,
                          ),
                    ),
                  ),
                ),
              ],
            ),
            VerticalSpace.twentyFour(),
            SizedBox(
              width: context.sized.width,
              height: SizeValues.fiftyThree.value.h,
              child: CustomButton(
                onPressed: _onLoginButtonTap,
                child: Text(
                  LocaleKeys.auth_login_login_button.tr(),
                ),
              ),
            ),
            VerticalSpace.thirtySeven(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FastLoginButton(
                  icon: AssetPath.google.path.svgImage,
                ),
                HorizontalSpace.s(),
                FastLoginButton(
                  icon: AssetPath.apple.path.svgImage,
                ),
                HorizontalSpace.s(),
                FastLoginButton(
                  icon: AssetPath.facebook.path.svgImage,
                ),
              ],
            ),
            VerticalSpace.thirtyTwo(),
            CustomRichText(
              firstText: LocaleKeys.auth_login_register_text.tr(),
              secondText: LocaleKeys.auth_login_register_button.tr(),
              onSecondTextTap: _onRegisterButtonTap,
            ),
          ],
        ),
      ),
    );
  }
}
