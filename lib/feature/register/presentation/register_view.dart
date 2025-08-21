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

class __RegisterBodyState extends State<_RegisterBody> with Dialogs, RegisterViewMixin {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.horizontalThirtyNine(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            VerticalSpace.oneHundredThirtyEight(),
            TitleSubtitle(
              title: LocaleKeys.auth_register_title.tr(),
              subtitle: LocaleKeys.auth_subtitle.tr(),
            ),
            VerticalSpace.forty(),
            CustomTextField(
              controller: nameController,
              hintText: LocaleKeys.auth_register_name.tr(),
              prefixIcon: AssetPath.user.path.pngImage,
            ),
            VerticalSpace.fourteen(),
            CustomTextField(
              controller: emailController,
              hintText: LocaleKeys.auth_email.tr(),
              prefixIcon: AssetPath.mail.path.pngImage,
            ),
            VerticalSpace.fourteen(),
            ValueListenableBuilder<bool>(
              valueListenable: isObscureNotifier,
              builder: (context, isObscure, child) {
                return CustomTextField(
                  controller: passwordController,
                  isObscure: isObscure,
                  suffixIcon: AssetPath.hide.path.pngImage,
                  hintText: LocaleKeys.auth_password.tr(),
                  prefixIcon: AssetPath.lock.path.pngImage,
                  onSuffixIconTap: onSuffixIconTap,
                );
              },
            ),
            VerticalSpace.fourteen(),
            ValueListenableBuilder<bool>(
              valueListenable: isObscureNotifier,
              builder: (context, isObscure, child) {
                return CustomTextField(
                  isObscure: isObscureNotifier.value,
                  controller: confirmPasswordController,
                  hintText: LocaleKeys.auth_register_password_again.tr(),
                  prefixIcon: AssetPath.lock.path.pngImage,
                );
              },
            ),
            VerticalSpace.sixteen(),
            const _AgreementWidget(),
            VerticalSpace.thirtyEight(),
            SizedBox(
              width: context.sized.width,
              height: 53.h,
              child: CustomButton(
                onPressed: onRegisterButtonPressed,
                child: Text(LocaleKeys.auth_register_register_button.tr()),
              ),
            ),
            VerticalSpace.thirtySeven(),
            const FastLoginWidget(),
            VerticalSpace.thirtyTwo(),
            CustomRichText(
              firstText: LocaleKeys.auth_login_register_text.tr(),
              secondText: LocaleKeys.auth_login_register_button.tr(),
              onSecondTextTap: onLoginButtonTap,
            ),
          ],
        ),
      ),
    );
  }
}
