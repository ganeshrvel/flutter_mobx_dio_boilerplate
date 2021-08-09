import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@module
abstract class LoggerDi {
  @LazySingleton()
  Logger get logger => Logger(
        printer: PrettyPrinter(),
      );
}
