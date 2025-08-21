import 'package:logger/logger.dart';

extension LoggerExtension on dynamic {
  void logError([String? error]) {
    Logger().e(this, error: error);
  }

  void logInfo([String? info]) {
    Logger().i(this, error: info);
  }

  void logDebug([String? debug]) {
    Logger().d(this, error: debug);
  }

  void logWarning([String? warning]) {
    Logger().w(this, error: warning);
  }
}
