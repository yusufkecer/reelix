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

  void onLoginButtonTap() {
    final loginCubit = context.read<LoginCubit>();
    final check = checkValues();
    if (check) {
      return;
    }
    showLoadingDialog(context);
    loginCubit.login(
      params: LoginParams(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ),
    );
    context.pop();
    if (loginCubit.state is LoginSuccess) {
      // TODO: Navigate to home screen
    } else {
      // TODO: Show error message
    }
  }
}
