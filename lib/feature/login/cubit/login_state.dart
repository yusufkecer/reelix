part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  final bool isLoading;
  final AuthEntity? user;
  final String? errorMessage;

  const LoginState({this.isLoading = false, this.user, this.errorMessage});

  @override
  List<Object?> get props => [isLoading, user, errorMessage];
}

final class LoginInitial extends LoginState {
  const LoginInitial() : super(isLoading: false, user: null, errorMessage: null);
}

final class LoginLoading extends LoginState {
  const LoginLoading({super.user, super.errorMessage}) : super(isLoading: true);
}

final class LoginSuccess extends LoginState {
  const LoginSuccess({required AuthEntity user, super.errorMessage}) : super(isLoading: false, user: user);
}

final class LoginFailure extends LoginState {
  final String message;

  const LoginFailure(this.message, {super.user, super.errorMessage}) : super(isLoading: false);

  @override
  List<Object?> get props => [isLoading, user, message];
}
