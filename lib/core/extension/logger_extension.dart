import 'package:logger/logger.dart';

extension LoggerExtension on dynamic {
  void logError([String? error]) {
    Logger().e(this, error: error);
  }

  void logInfo([String? info]) {
    Logger().i(this, error: info, stackTrace: StackTrace.empty);
  }

  void logDebug([String? debug]) {
    Logger().d(this, error: debug, stackTrace: StackTrace.empty);
  }

  void logWarning([String? warning]) {
    Logger().w(this, error: warning);
  }
}
