import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(
  path: '.env',
  obfuscate: true,
)
abstract class Env {
  @EnviedField(varName: 'BASE_URL', obfuscate: true)
  static final String _baseUrl = _Env._baseUrl;

  static String get url => _baseUrl;
}
