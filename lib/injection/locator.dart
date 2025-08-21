import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:reelix/injection/locator.config.dart';

// ignore: invalid_annotation_target
@InjectableInit(
  initializerName: 'init',
)
abstract final class Locator {
  static final GetIt sl = GetIt.instance;

  static Future<void> initializeService() async {
    sl.init();
  }
}
