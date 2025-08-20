part of 'register_cubit.dart';

sealed class RegisterState extends Equatable {
  final bool isLoading;
  final UserEntity? user;
  final String? errorMessage;

  const RegisterState({
    this.isLoading = false,
    this.user,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [isLoading, user, errorMessage];
}

final class RegisterInitial extends RegisterState {
  const RegisterInitial() : super(isLoading: false);
}

final class RegisterLoading extends RegisterState {
  const RegisterLoading() : super(isLoading: true);
}

final class RegisterSuccess extends RegisterState {
  const RegisterSuccess(UserEntity user) : super(isLoading: false, user: user);
}

final class RegisterFailure extends RegisterState {
  const RegisterFailure(String message) : super(isLoading: false, errorMessage: message);
}
