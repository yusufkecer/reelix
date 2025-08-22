part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  final AuthEntity? user;
  final String? errorMessage;

  const LoginState({this.user, this.errorMessage});
  @override
  List<Object?> get props => [user, errorMessage];
}

final class LoginInitial extends LoginState {
  const LoginInitial() : super();
}

final class LoginLoading extends LoginState {
  const LoginLoading({super.user});
}

final class LoginSuccess extends LoginState {
  const LoginSuccess({required AuthEntity user}) : super(user: user);
}

final class LoginFailure extends LoginState {
  final String message;

  const LoginFailure(this.message, {super.errorMessage});

  @override
  List<Object?> get props => [user, message, errorMessage];
}
