// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:data_connection_checker/data_connection_checker.dart' as _i5;
import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i10;
import 'package:shared_preferences/shared_preferences.dart' as _i13;

import '../../constants/env.dart' as _i7;
import '../../features/app/data/controllers/app_controller.dart' as _i23;
import '../../features/app/data/data_sources/app_local_data_source.dart'
    as _i16;
import '../../features/app/data/repositories/app_repository.dart' as _i17;
import '../../features/app/ui/store/app_store.dart' as _i24;
import '../../features/login/data/controllers/login_controller.dart' as _i25;
import '../../features/login/data/data_sources/login_local_data_source.dart'
    as _i19;
import '../../features/login/data/data_sources/login_remote_data_source.dart'
    as _i20;
import '../../features/login/data/repositories/login_repository.dart' as _i21;
import '../../features/login/ui/store/login_store.dart' as _i26;
import '../../services/analytics_service.dart' as _i3;
import '../../services/crashes_service.dart' as _i4;
import '../../services/pushes_service.dart' as _i12;
import '../../utils/alerts/alerts.dart' as _i22;
import '../../utils/alerts/alerts_helper.dart' as _i14;
import '../../utils/log/log_it.dart' as _i18;
import '../api_client/api_client.dart' as _i15;
import '../helpers/flash_helper.dart' as _i8;
import '../helpers/flushbar_helper.dart' as _i9;
import '../network/network_info.dart' as _i11;
import 'dio_di.dart' as _i28;
import 'logger_di.dart' as _i29;
import 'network_info_di.dart' as _i27;
import 'shared_preferences_di.dart'
    as _i30; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// an extension to register the provided dependencies inside of [GetIt]
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of provided dependencies inside of [GetIt]
  Future<_i1.GetIt> init(
      {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
    final gh = _i2.GetItHelper(this, environment, environmentFilter);
    final networkInfoDi = _$NetworkInfoDi();
    final dioDi = _$DioDi();
    final loggerDi = _$LoggerDi();
    final sharedPreferencesDi = _$SharedPreferencesDi();
    gh.lazySingleton<_i3.AnalyticsService>(() => _i3.AnalyticsService());
    gh.lazySingleton<_i4.CrashesService>(() => _i4.CrashesService());
    gh.lazySingleton<_i5.DataConnectionChecker>(
        () => networkInfoDi.dataConnectionChecker);
    gh.lazySingleton<_i6.Dio>(() => dioDi.dio);
    gh.lazySingleton<_i7.Env>(() => _i7.Env());
    gh.lazySingleton<_i8.FlashHelper>(() => _i8.FlashHelper());
    gh.lazySingleton<_i9.FlushbarHelper>(() => _i9.FlushbarHelper());
    gh.lazySingleton<_i10.Logger>(() => loggerDi.logger);
    gh.lazySingleton<_i11.NetworkInfo>(
        () => _i11.NetworkInfo(get<_i5.DataConnectionChecker>()));
    gh.lazySingleton<_i12.PushesService>(() => _i12.PushesService());
    await gh.factoryAsync<_i13.SharedPreferences>(
        () => sharedPreferencesDi.sharedPreferences,
        preResolve: true);
    gh.lazySingleton<_i14.AlertsHelper>(
        () => _i14.AlertsHelper(get<_i4.CrashesService>()));
    gh.lazySingleton<_i15.ApiClient>(() => _i15.ApiClient(get<_i6.Dio>()));
    gh.lazySingleton<_i16.AppLocalDataSource>(
        () => _i16.AppLocalDataSource(get<_i13.SharedPreferences>()));
    gh.lazySingleton<_i17.AppRepository>(
        () => _i17.AppRepository(get<_i16.AppLocalDataSource>()));
    gh.lazySingleton<_i18.LogIt>(() => _i18.LogIt(get<_i10.Logger>()));
    gh.lazySingleton<_i19.LoginLocalDataSource>(
        () => _i19.LoginLocalDataSource(get<_i13.SharedPreferences>()));
    gh.lazySingleton<_i20.LoginRemoteDataSource>(
        () => _i20.LoginRemoteDataSource(get<_i15.ApiClient>()));
    gh.lazySingleton<_i21.LoginRepository>(() => _i21.LoginRepository(
        get<_i19.LoginLocalDataSource>(),
        get<_i20.LoginRemoteDataSource>(),
        get<_i11.NetworkInfo>()));
    gh.lazySingleton<_i22.Alerts>(
        () => _i22.Alerts(get<_i14.AlertsHelper>(), get<_i9.FlushbarHelper>()));
    gh.lazySingleton<_i23.AppController>(
        () => _i23.AppController(get<_i17.AppRepository>()));
    gh.lazySingleton<_i24.AppStore>(
        () => _i24.AppStore(get<_i23.AppController>(), get<_i22.Alerts>()));
    gh.lazySingleton<_i25.LoginController>(
        () => _i25.LoginController(get<_i21.LoginRepository>()));
    gh.lazySingleton<_i26.LoginStore>(
        () => _i26.LoginStore(get<_i25.LoginController>(), get<_i22.Alerts>()));
    return this;
  }
}

class _$NetworkInfoDi extends _i27.NetworkInfoDi {}

class _$DioDi extends _i28.DioDi {}

class _$LoggerDi extends _i29.LoggerDi {}

class _$SharedPreferencesDi extends _i30.SharedPreferencesDi {}
