part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  final UserEntity? userEntity;

  const ProfileState({this.userEntity});

  ProfileState copyWith({UserEntity? userEntity}) {
    return ProfileState(
      userEntity: userEntity ?? this.userEntity,
    );
  }

  @override
  List<Object?> get props => [userEntity];
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  const ProfileLoaded({super.userEntity});
}

final class ProfileError extends ProfileState {
  final String error;

  const ProfileError({required this.error});
}
