import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:reelix/core/index.dart';
import 'package:reelix/domain/index.dart';
import 'package:reelix/feature/login/domain/entity/login_params.dart';
import 'package:reelix/feature/login/domain/use_case/login_use_case.dart';

part 'login_state.dart';

@injectable
final class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUseCase, this._cacheService)
    : super(const LoginInitial());

  final LoginUseCase _loginUseCase;
  final CacheManager _cacheService;

  Future<void> login({required LoginParams params}) async {
    try {
      emit(const LoginLoading());

      final user = await _loginUseCase.executeWithParams(params);

      if (user == null) {
        'login failed - null response'.logInfo();
        emit(const LoginFailure('Login failed', errorMessage: 'Login failed'));
        return;
      }

      if (user.message != null) {
        ' ${user.message}'.logInfo();
        emit(LoginFailure(user.message!, errorMessage: user.message));
        return;
      }

      'login success'.logInfo();
      emit(LoginSuccess(user: user));

      if (user.token != null) {
        await _cacheService.saveToken(user.token!);
      }
    } on Exception catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
