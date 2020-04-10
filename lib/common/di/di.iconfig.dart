// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:logger/logger.dart';
import 'package:flutter_mobx_dio_boilerplate/common/di/logger_di.dart';
import 'package:dio/dio.dart';
import 'package:flutter_mobx_dio_boilerplate/common/di/dio_di.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_mobx_dio_boilerplate/common/di/shared_preferences_di.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_mobx_dio_boilerplate/common/di/network_info_di.dart';
import 'package:flutter_mobx_dio_boilerplate/common/network/network_info.dart';
import 'package:flutter_mobx_dio_boilerplate/common/helpers/flash_helper.dart';
import 'package:flutter_mobx_dio_boilerplate/common/helpers/flushbar_helper.dart';
import 'package:flutter_mobx_dio_boilerplate/services/analytics_service.dart';
import 'package:flutter_mobx_dio_boilerplate/services/crashes_service.dart';
import 'package:flutter_mobx_dio_boilerplate/services/pushes_service.dart';
import 'package:flutter_mobx_dio_boilerplate/features/app/data/data_sources/app_local_data_source.dart';
import 'package:flutter_mobx_dio_boilerplate/features/login/data/data_sources/login_local_data_source.dart';
import 'package:flutter_mobx_dio_boilerplate/utils/alerts/alerts_helper.dart';
import 'package:flutter_mobx_dio_boilerplate/utils/alerts/alerts.dart';
import 'package:flutter_mobx_dio_boilerplate/utils/log/log_it.dart';
import 'package:flutter_mobx_dio_boilerplate/common/api_client/api_client.dart';
import 'package:flutter_mobx_dio_boilerplate/features/app/data/repositories/app_repository.dart';
import 'package:flutter_mobx_dio_boilerplate/features/app/data/controllers/app_controller.dart';
import 'package:flutter_mobx_dio_boilerplate/features/login/data/data_sources/login_remote_data_source.dart';
import 'package:flutter_mobx_dio_boilerplate/features/app/ui/store/app_store.dart';
import 'package:flutter_mobx_dio_boilerplate/features/login/data/repositories/login_repository.dart';
import 'package:flutter_mobx_dio_boilerplate/features/login/data/controllers/login_controller.dart';
import 'package:flutter_mobx_dio_boilerplate/features/login/ui/store/login_store.dart';
import 'package:get_it/get_it.dart';

Future<void> $initGetIt(GetIt g, {String environment}) async {
  final loggerDi = _$LoggerDi();
  final dioDi = _$DioDi();
  final sharedPreferencesDi = _$SharedPreferencesDi();
  final networkInfoDi = _$NetworkInfoDi();
  g.registerLazySingleton<Logger>(() => loggerDi.logger);
  g.registerLazySingleton<Dio>(() => dioDi.dio);
  final sharedPreferences = await sharedPreferencesDi.sharedPreferences;
  g.registerFactory<SharedPreferences>(() => sharedPreferences);
  g.registerLazySingleton<DataConnectionChecker>(
      () => networkInfoDi.dataConnectionChecker);
  g.registerLazySingleton<NetworkInfo>(
      () => NetworkInfo(g<DataConnectionChecker>()));
  g.registerLazySingleton<FlashHelper>(() => FlashHelper());
  g.registerLazySingleton<FlushbarHelper>(() => FlushbarHelper());
  g.registerLazySingleton<AnalyticsService>(() => AnalyticsService());
  g.registerLazySingleton<CrashesService>(() => CrashesService());
  g.registerLazySingleton<PushesService>(() => PushesService());
  g.registerLazySingleton<AppLocalDataSource>(
      () => AppLocalDataSource(g<SharedPreferences>()));
  g.registerLazySingleton<LoginLocalDataSource>(
      () => LoginLocalDataSource(g<SharedPreferences>()));
  g.registerLazySingleton<AlertsHelper>(
      () => AlertsHelper(g<CrashesService>()));
  g.registerLazySingleton<Alerts>(
      () => Alerts(g<AlertsHelper>(), g<FlushbarHelper>()));
  g.registerLazySingleton<LogIt>(() => LogIt(g<Logger>()));
  g.registerLazySingleton<ApiClient>(() => ApiClient(g<Dio>()));
  g.registerLazySingleton<AppRepository>(
      () => AppRepository(g<AppLocalDataSource>()));
  g.registerLazySingleton<AppController>(
      () => AppController(g<AppRepository>()));
  g.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSource(g<ApiClient>()));
  g.registerLazySingleton<AppStore>(
      () => AppStore(g<AppController>(), g<Alerts>()));
  g.registerLazySingleton<LoginRepository>(() => LoginRepository(
        g<LoginLocalDataSource>(),
        g<LoginRemoteDataSource>(),
        g<NetworkInfo>(),
      ));
  g.registerLazySingleton<LoginController>(
      () => LoginController(g<LoginRepository>()));
  g.registerLazySingleton<LoginStore>(
      () => LoginStore(g<LoginController>(), g<Alerts>()));
}

class _$LoggerDi extends LoggerDi {}

class _$DioDi extends DioDi {}

class _$SharedPreferencesDi extends SharedPreferencesDi {}

class _$NetworkInfoDi extends NetworkInfoDi {}
