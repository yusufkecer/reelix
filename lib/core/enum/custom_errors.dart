enum CustomErrors {
  invalidCredentials('INVALID_CREDENTIALS'),
  passwordTooShort('PASSWORD_TOO_SHORT'),
  userExists('USER_EXISTS'),
  invalidEmailFormat('INVALID_EMAIL_FORMAT');

  final String value;

  const CustomErrors(this.value);
}
