extension LoggerExtension on dynamic {
  void logError([String? error]) {
    Logger().e(this, error: error);
  }

  void logInfo([String? info]) {
    Logger().i(this, info: info);
  }

  void logDebug([String? debug]) {
    Logger().d(this, debug: debug);
  }

  void logWarning([String? warning]) {
    Logger().w(this, warning: warning);
  }
}
