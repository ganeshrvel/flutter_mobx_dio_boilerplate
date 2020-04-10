import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_mobx_dio_boilerplate/common/di/di.iconfig.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
Future<void> init() => $initGetIt(getIt);
