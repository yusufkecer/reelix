import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';
import 'package:reelix/core/index.dart';
import 'package:reelix/feature/register/cubit/register_cubit.dart';
import 'package:reelix/feature/register/domain/entity/params_entity.dart';
import 'package:reelix/injection/locator.dart';

part 'register_view_model.dart';
part 'widgets/agreement_widget.dart';

@RoutePage(name: 'RegisterView')
final class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Locator.sl<RegisterCubit>(),
      child: const Scaffold(
        body: _RegisterBody(),
      ),
    );
  }
}

@immutable
final class _RegisterBody extends StatefulWidget {
  const _RegisterBody();

  @override
  State<_RegisterBody> createState() => __RegisterBodyState();
}

class __RegisterBodyState extends State<_RegisterBody>
    with Dialogs, _RegisterViewMixin {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.horizontalThirtyNine(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            VerticalSpace.oneHundredThirtyEight(),
            const TitleSubtitle(
              title: LocaleKeys.auth_register_title,
              subtitle: LocaleKeys.auth_subtitle,
            ),
            VerticalSpace.forty(),
            CustomTextField(
              controller: _nameController,
              hintText: LocaleKeys.auth_register_name,
              prefixIcon: AssetPath.user.path.svgImage,
            ),
            VerticalSpace.fourteen(),
            CustomTextField(
              controller: _emailController,
              hintText: LocaleKeys.auth_email,
              prefixIcon: AssetPath.mail.path.svgImage,
            ),
            VerticalSpace.fourteen(),
            ValueListenableBuilder<bool>(
              valueListenable: _isObscureNotifier,
              builder: (context, isObscure, child) {
                return CustomTextField(
                  controller: _passwordController,
                  isObscure: isObscure,
                  suffixIcon: AssetPath.hide.path.svgImage,
                  hintText: LocaleKeys.auth_password,
                  prefixIcon: AssetPath.lock.path.svgImage,
                  onSuffixIconTap: onSuffixIconTap,
                );
              },
            ),
            VerticalSpace.fourteen(),
            ValueListenableBuilder<bool>(
              valueListenable: _isObscureNotifier,
              builder: (context, isObscure, child) {
                return CustomTextField(
                  isObscure: _isObscureNotifier.value,
                  controller: _confirmPasswordController,
                  hintText: LocaleKeys.auth_register_password_again,
                  prefixIcon: AssetPath.lock.path.svgImage,
                );
              },
            ),
            VerticalSpace.sixteen(),
            const _AgreementWidget(),
            VerticalSpace.thirtyEight(),
            SizedBox(
              width: context.sized.width,
              height: SizeValues.fiftyThree.value.h,
              child: CustomButton(
                onPressed: _onRegisterButtonPressed,
                child: Text(
                  LocaleKeys.auth_register_register_button.tr(),
                  style: context.general.textTheme.displayMedium,
                ),
              ),
            ),
            VerticalSpace.thirtySeven(),
            const FastLoginWidget(),
            VerticalSpace.thirtyTwo(),
            CustomRichText(
              firstText: LocaleKeys.auth_register_login_text,
              secondText: LocaleKeys.auth_login_login_button,
              onSecondTextTap: _onLoginButtonTap,
            ),
          ],
        ),
      ),
    );
  }
}
