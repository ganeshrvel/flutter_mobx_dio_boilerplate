import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx_dio_boilerplate/common/di/di.dart' as di;
import 'package:flutter_mobx_dio_boilerplate/constants/env.dart';
import 'package:flutter_mobx_dio_boilerplate/features/app/ui/pages/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  Env.init();

  await di.init();

  runApp(App());
}
