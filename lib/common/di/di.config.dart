// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/app/data/controllers/app_controller.dart';
import '../../features/app/data/data_sources/app_local_data_source.dart';
import '../../features/app/data/repositories/app_repository.dart';
import '../../features/app/ui/store/app_store.dart';
import '../../features/login/data/controllers/login_controller.dart';
import '../../features/login/data/data_sources/login_local_data_source.dart';
import '../../features/login/data/data_sources/login_remote_data_source.dart';
import '../../features/login/data/repositories/login_repository.dart';
import '../../features/login/ui/store/login_store.dart';
import '../../services/analytics_service.dart';
import '../../services/crashes_service.dart';
import '../../services/pushes_service.dart';
import '../../utils/alerts/alerts.dart';
import '../../utils/alerts/alerts_helper.dart';
import '../../utils/log/log_it.dart';
import '../api_client/api_client.dart';
import '../helpers/flash_helper.dart';
import '../helpers/flushbar_helper.dart';
import '../network/network_info.dart';
import 'dio_di.dart';
import 'logger_di.dart';
import 'network_info_di.dart';
import 'shared_preferences_di.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

Future<GetIt> $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) async {
  final gh = GetItHelper(get, environment, environmentFilter);
  final networkInfoDi = _$NetworkInfoDi();
  final dioDi = _$DioDi();
  final loggerDi = _$LoggerDi();
  final sharedPreferencesDi = _$SharedPreferencesDi();
  gh.lazySingleton<AnalyticsService>(() => AnalyticsService());
  gh.lazySingleton<CrashesService>(() => CrashesService());
  gh.lazySingleton<DataConnectionChecker>(
      () => networkInfoDi.dataConnectionChecker);
  gh.lazySingleton<Dio>(() => dioDi.dio);
  gh.lazySingleton<FlashHelper>(() => FlashHelper());
  gh.lazySingleton<FlushbarHelper>(() => FlushbarHelper());
  gh.lazySingleton<Logger>(() => loggerDi.logger);
  gh.lazySingleton<NetworkInfo>(
      () => NetworkInfo(get<DataConnectionChecker>()));
  gh.lazySingleton<PushesService>(() => PushesService());
  final sharedPreferences = await sharedPreferencesDi.sharedPreferences;
  gh.factory<SharedPreferences>(() => sharedPreferences);
  gh.lazySingleton<AlertsHelper>(() => AlertsHelper(get<CrashesService>()));
  gh.lazySingleton<ApiClient>(() => ApiClient(get<Dio>()));
  gh.lazySingleton<AppLocalDataSource>(
      () => AppLocalDataSource(get<SharedPreferences>()));
  gh.lazySingleton<AppRepository>(
      () => AppRepository(get<AppLocalDataSource>()));
  gh.lazySingleton<LogIt>(() => LogIt(get<Logger>()));
  gh.lazySingleton<LoginLocalDataSource>(
      () => LoginLocalDataSource(get<SharedPreferences>()));
  gh.lazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSource(get<ApiClient>()));
  gh.lazySingleton<LoginRepository>(() => LoginRepository(
        get<LoginLocalDataSource>(),
        get<LoginRemoteDataSource>(),
        get<NetworkInfo>(),
      ));
  gh.lazySingleton<Alerts>(
      () => Alerts(get<AlertsHelper>(), get<FlushbarHelper>()));
  gh.lazySingleton<AppController>(() => AppController(get<AppRepository>()));
  gh.lazySingleton<AppStore>(
      () => AppStore(get<AppController>(), get<Alerts>()));
  gh.lazySingleton<LoginController>(
      () => LoginController(get<LoginRepository>()));
  gh.lazySingleton<LoginStore>(
      () => LoginStore(get<LoginController>(), get<Alerts>()));
  return get;
}

class _$NetworkInfoDi extends NetworkInfoDi {}

class _$DioDi extends DioDi {}

class _$LoggerDi extends LoggerDi {}

class _$SharedPreferencesDi extends SharedPreferencesDi {}
