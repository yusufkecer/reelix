part of 'register_view.dart';

mixin _RegisterViewMixin on State<_RegisterBody>, Dialogs {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final ValueNotifier<bool> _isObscureNotifier = ValueNotifier(true);

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void onSuffixIconTap() {
    _isObscureNotifier.value = !_isObscureNotifier.value;
  }

  bool _checkValues() {
    if (_nameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      return false;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      return false;
    }

    return true;
  }

  void _onLoginButtonTap() {
    context.pop();
  }

  Future<void> _onRegisterButtonPressed() async {
    if (!_checkValues()) {
      showErrorDialog(context, LocaleKeys.error_fill_all_fields.tr());
      return;
    }
    showLoadingDialog(context);
    final params = RegisterParams(
      name: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
    );
    await context.read<RegisterCubit>().register(params);
    if (mounted) {
      context.pop();
    }
    _checkState();
  }

  void _checkState() {
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
