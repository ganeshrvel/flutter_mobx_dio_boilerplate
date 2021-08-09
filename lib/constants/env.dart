import 'dart:io';

import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter_mobx_dio_boilerplate/common/di/di.dart';
import 'package:flutter_mobx_dio_boilerplate/constants/urls.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class Env {
  static final bool IS_RELEASE = foundation.kReleaseMode;

  static final bool IS_DEBUG = !foundation.kReleaseMode;

  static final bool IS_TEST = Platform.environment.containsKey('FLUTTER_TEST');

  _EnvData get config => IS_RELEASE ? prod : dev;

  static final _EnvData dev = _EnvData(
    debug: true,
    debugShowCheckedModeBanner: false,
    debugShowMaterialGrid: false,
    debugApiClient: true,
    apiBaseUrl: UrlConstants.DEV_API_BASE_URL,
  );

  static final _EnvData prod = _EnvData(
    debug: false,
    debugShowCheckedModeBanner: false,
    debugShowMaterialGrid: false,
    debugApiClient: false,
    apiBaseUrl: UrlConstants.PROD_API_URL,
  );
}

class _EnvData {
  final bool debug;
  final bool debugShowCheckedModeBanner;
  final bool debugShowMaterialGrid;
  final bool debugApiClient;
  final String apiBaseUrl;

  _EnvData({
    required this.debug,
    required this.debugShowCheckedModeBanner,
    required this.debugShowMaterialGrid,
    required this.debugApiClient,
    required this.apiBaseUrl,
  });
}

final Env env = getIt<Env>();
