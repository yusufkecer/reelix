part of 'register_cubit.dart';

sealed class RegisterState extends Equatable {
  final UserEntity? user;
  final String? errorMessage;

  const RegisterState({
    this.user,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [user, errorMessage];
}

final class RegisterInitial extends RegisterState {
  const RegisterInitial() : super();
}

final class RegisterLoading extends RegisterState {
  const RegisterLoading() : super();
}

final class RegisterSuccess extends RegisterState {
  const RegisterSuccess(UserEntity? user) : super(user: user);
}

final class RegisterFailure extends RegisterState {
  const RegisterFailure(String message) : super(errorMessage: message);
}
