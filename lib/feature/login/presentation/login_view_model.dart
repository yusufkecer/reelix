part of 'login_view.dart';

mixin LoginViewMixin on State<_LoginBody>, Dialogs {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ValueNotifier<bool> obscureNotifier = ValueNotifier(true);

  bool checkValues() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      return true;
    }
    return false;
  }

  void checkToken() {
    final token = Locator.sl<CacheManager>().getToken();
    if (token != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.router.pushAndPopUntil(
          const HomeView(),
          predicate: (route) => false,
        );
      });
    }
  }

  @override
  void initState() {
    super.initState();
    checkToken();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void onSuffixIconTap() {
    obscureNotifier.value = !obscureNotifier.value;
  }

  void onRegisterButtonTap() {
    context.general.unfocus();
    context.pushRoute(const RegisterView());
  }

  Future<void> onLoginButtonTap() async {
    if (checkValues()) {
      showErrorDialog(context, LocaleKeys.error_fill_all_fields.tr());
      return;
    }
    showLoadingDialog(context);
    final params = LoginParams(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    await context.read<LoginCubit>().login(params: params);
    if (mounted) {
      context.pop();
    }
    checkState();
  }

  void checkState() {
    if (context.read<LoginCubit>().state is LoginSuccess) {
      'login success'.logInfo();
      context.pushRoute(const HomeView());
    }
    if (context.read<LoginCubit>().state is LoginFailure) {
      'login failure ${context.read<LoginCubit>().state}'.logInfo();
      if (context.read<LoginCubit>().state.errorMessage ==
          CustomErrors.invalidCredentials.value) {
        showErrorDialog(context, LocaleKeys.error_invalid_credentials.tr());
      } else {
        showErrorDialog(context, LocaleKeys.error_login_error.tr());
      }
    }
  }
}
