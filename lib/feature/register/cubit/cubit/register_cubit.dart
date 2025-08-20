import 'package:date_app/core/index.dart';
import 'package:date_app/domain/index.dart';
import 'package:date_app/feature/register/domain/entity/params_entity.dart';
import 'package:date_app/feature/register/domain/use_case/register_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'register_state.dart';

@injectable
final class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._registerUseCase, this._cacheService) : super(const RegisterInitial());

  final RegisterUseCase _registerUseCase;
  final CacheManager _cacheService;

  Future<void> register(RegisterParams params) async {
    try {
      emit(const RegisterLoading());

      final user = await _registerUseCase.executeWithParams(params);

      if (user == null) {
        'register failed'.logInfo();
        emit(const RegisterFailure('Registration failed'));
        return;
      }
      'register success'.logInfo();
      emit(RegisterSuccess(user.user));

      if (user.token.isNotEmpty) {
        await _cacheService.saveToken(user.token);
      }
    } on Exception catch (e) {
      emit(RegisterFailure(e.toString()));
    }
  }
}
