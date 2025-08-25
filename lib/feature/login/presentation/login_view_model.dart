part of 'login_view.dart';

mixin LoginViewMixin on State<_LoginBody>, Dialogs {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ValueNotifier<bool> _obscureNotifier = ValueNotifier(true);

  bool _checkValues() {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      return true;
    }
    return false;
  }

  Future<void> _checkToken() async {
    final token = await Locator.sl<CacheManager>().getToken();
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

    _checkToken();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSuffixIconTap() {
    _obscureNotifier.value = !_obscureNotifier.value;
  }

  void _onRegisterButtonTap() {
    context.general.unfocus();
    context.pushRoute(const RegisterView());
  }

  Future<void> _onLoginButtonTap() async {
    if (_checkValues()) {
      showErrorDialog(context, LocaleKeys.error_fill_all_fields);
      return;
    }
    showLoadingDialog(context);
    final params = LoginParams(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
    await context.read<LoginCubit>().login(params: params);
    if (mounted) {
      context.pop();
    }
    _checkState();
  }

  void _checkState() {
    if (context.read<LoginCubit>().state is LoginSuccess) {
      'login success'.logInfo();
      context.pushRoute(const HomeView());
    }
    if (context.read<LoginCubit>().state is LoginFailure) {
      'login failure ${context.read<LoginCubit>().state}'.logInfo();
      if (context.read<LoginCubit>().state.errorMessage ==
          CustomErrors.invalidCredentials.value) {
        showErrorDialog(context, LocaleKeys.error_invalid_credentials);
      } else {
        showErrorDialog(context, LocaleKeys.error_login_error);
      }
    }
  }
}
