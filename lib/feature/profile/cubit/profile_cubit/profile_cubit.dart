import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:reelix/core/index.dart';
import 'package:reelix/domain/index.dart';
import 'package:reelix/feature/profile/domain/use_case/profile_use_case.dart';

part 'profile_state.dart';

@lazySingleton
final class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileUseCase) : super(ProfileInitial()) {
    'ProfileCubit'.logInfo();
    getProfile();
  }

  final ProfileUseCase _profileUseCase;

  Future<void> getProfile() async {
    'getProfile'.logInfo();
    emit(ProfileLoading());
    try {
      final user = await _profileUseCase.execute();
      if (user != null) {
        'user: $user'.logInfo();
        emit(ProfileLoaded(userEntity: user));
      } else {
        emit(const ProfileError(error: 'Failed to load profile'));
      }
    } on Exception catch (e) {
      emit(ProfileError(error: e.toString()));
    }
  }
}
