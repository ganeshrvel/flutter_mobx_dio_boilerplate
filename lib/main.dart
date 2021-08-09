import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx_dio_boilerplate/common/di/di.dart' show getItInit;
import 'package:flutter_mobx_dio_boilerplate/features/app/ui/pages/app_screen.dart';
import 'package:flutter_mobx_dio_boilerplate/utils/log/log.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import 'common/di/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // register all dependecy injection
  await getItInit(env: Environment.dev);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  mainContext.onReactionError((_, rxn) {
    log.error(
      'A mobx reaction error occured.',
      error: rxn.errorValue!.exception,
    );
  });

  runApp(AppScreen());

  Isolate.current.addErrorListener(RawReceivePort((pair) async {
    final errorAndStacktrace = pair as List;

    log.error(
      'An error was captured by main.Isolate.current.addErrorListener',
      error: errorAndStacktrace.first,
    );
  }).sendPort);
}
