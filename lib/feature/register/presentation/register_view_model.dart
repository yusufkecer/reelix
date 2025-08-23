part of 'register_view.dart';

mixin RegisterViewMixin on State<_RegisterBody>, Dialogs {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final ValueNotifier<bool> isObscureNotifier = ValueNotifier(true);

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void onSuffixIconTap() {
    isObscureNotifier.value = !isObscureNotifier.value;
  }

  bool checkValues() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      return false;
    }

    if (passwordController.text != confirmPasswordController.text) {
      return false;
    }

    return true;
  }

  void onLoginButtonTap() {
    context.pop();
  }

  Future<void> onRegisterButtonPressed() async {
    if (!checkValues()) {
      showErrorDialog(context, LocaleKeys.error_fill_all_fields.tr());
      return;
    }
    showLoadingDialog(context);
    final params = RegisterParams(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
    await context.read<RegisterCubit>().register(params);
    if (mounted) {
      context.pop();
    }
    checkState();
  }

  void checkState() {
    if (context.read<RegisterCubit>().state is RegisterSuccess) {
      'register success'.logInfo();
    }
    if (context.read<RegisterCubit>().state is RegisterFailure) {
      if (context.read<RegisterCubit>().state.errorMessage ==
          CustomErrors.passwordTooShort.value) {
        showErrorDialog(context, LocaleKeys.error_password_too_short.tr());
      } else if (context.read<RegisterCubit>().state.errorMessage ==
          CustomErrors.userExists.value) {
        showErrorDialog(context, LocaleKeys.error_email_already_in_use.tr());
      } else if (context.read<RegisterCubit>().state.errorMessage ==
          CustomErrors.invalidEmailFormat.value) {
        showErrorDialog(context, LocaleKeys.error_email_invalid.tr());
      } else {
        showErrorDialog(context, LocaleKeys.error_register_error.tr());
      }
    }
  }
}
