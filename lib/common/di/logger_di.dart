import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@registerModule
abstract class LoggerDi {
  @lazySingleton
  Logger get logger => Logger(
        filter: null,
        printer: PrettyPrinter(),
        output: null,
      );
}
