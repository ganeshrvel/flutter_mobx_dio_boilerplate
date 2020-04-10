import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CrashesService {
  CrashesService();

  void setUser() {
    // TODO: identify user in the crash service
  }

  void unsetUser() {
    // TODO: clear user in the crash service
  }

  void nonFatalError(dynamic exception, StackTrace stack,
      {BuildContext context}) {
    // TODO: log fatal error in the crash service
  }

  void log(String message) {
    // TODO: log non fatal error in the crash service
  }
}
