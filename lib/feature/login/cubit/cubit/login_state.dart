part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  final bool isLoading;
  final LoginEntity? user;

  const LoginState({this.isLoading = false, this.user});

  @override
  List<Object?> get props => [isLoading, user];
}

final class LoginInitial extends LoginState {
  const LoginInitial() : super(isLoading: false, user: null);
}

final class LoginLoading extends LoginState {
  const LoginLoading({super.user}) : super(isLoading: true);
}

final class LoginSuccess extends LoginState {
  const LoginSuccess({required LoginEntity user}) : super(isLoading: false, user: user);
}

final class LoginFailure extends LoginState {
  final String message;

  const LoginFailure(this.message, {super.user}) : super(isLoading: false);

  @override
  List<Object?> get props => [isLoading, user, message];
}
