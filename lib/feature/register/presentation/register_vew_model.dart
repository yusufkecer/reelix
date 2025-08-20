part of 'register_view.dart';

mixin RegisterViewMixin on State<_RegisterBody> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final ValueNotifier<bool> isObscureNotifier = ValueNotifier(false);

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
    return true;
  }

  void onLoginButtonTap() {
    context.pop();
  }

  void onRegisterButtonPressed() {
    final check = checkValues();
    if (check) {
      return;
    }
  }
}
