import 'package:injectable/injectable.dart';
import 'package:reelix/core/index.dart';
import 'package:reelix/domain/index.dart';
import 'package:reelix/feature/register/domain/entity/params_entity.dart';
import 'package:reelix/feature/register/domain/repository/register_repository.dart';

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
