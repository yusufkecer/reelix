import 'package:date_app/core/index.dart';
import 'package:date_app/domain/index.dart';
import 'package:date_app/feature/register/domain/entity/params_entity.dart';
import 'package:date_app/feature/register/domain/repository/register_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
final class RegisterUseCase implements BaseUseCase<AuthEntity, AuthEntity, RegisterParams> {
  final RegisterRepository _repository;

  const RegisterUseCase(this._repository);

  @override
  Future<AuthEntity?> executeWithParams(RegisterParams params) async {
    return _repository.executeWithParams(params);
  }

  @override
  Future<AuthEntity?>? execute() {
    throw UnimplementedError();
  }
}
