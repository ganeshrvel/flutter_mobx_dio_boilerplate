// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:data_connection_checker/data_connection_checker.dart' as _i6;
import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i11;
import 'package:shared_preferences/shared_preferences.dart' as _i14;

import '../../constants/env.dart' as _i8;
import '../../features/app/data/controllers/app_controller.dart' as _i24;
import '../../features/app/data/data_sources/app_local_data_source.dart'
    as _i17;
import '../../features/app/data/repositories/app_repository.dart' as _i18;
import '../../features/app/ui/store/app_store.dart' as _i25;
import '../../features/login/data/controllers/login_controller.dart' as _i26;
import '../../features/login/data/data_sources/login_local_data_source.dart'
    as _i20;
import '../../features/login/data/data_sources/login_remote_data_source.dart'
    as _i21;
import '../../features/login/data/repositories/login_repository.dart' as _i22;
import '../../features/login/ui/store/login_store.dart' as _i27;
import '../../services/analytics_service.dart' as _i3;
import '../../services/crashes_service.dart' as _i5;
import '../../services/pushes_service.dart' as _i13;
import '../../utils/alerts/alerts.dart' as _i23;
import '../../utils/alerts/alerts_helper.dart' as _i15;
import '../../utils/log/log_it.dart' as _i19;
import '../api_client/api_client.dart' as _i16;
import '../helpers/flash_helper.dart' as _i9;
import '../helpers/flushbar_helper.dart' as _i10;
import '../network/network_info.dart' as _i12;
import '../themes/app_theme.dart' as _i4;
import 'app_theme_di.dart' as _i28;
import 'dio_di.dart' as _i30;
import 'logger_di.dart' as _i31;
import 'network_info_di.dart' as _i29;
import 'shared_preferences_di.dart'
    as _i32; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// an extension to register the provided dependencies inside of [GetIt]
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of provided dependencies inside of [GetIt]
  Future<_i1.GetIt> init(
      {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
    final gh = _i2.GetItHelper(this, environment, environmentFilter);
    final appThemeDi = _$AppThemeDi();
    final networkInfoDi = _$NetworkInfoDi();
    final dioDi = _$DioDi();
    final loggerDi = _$LoggerDi();
    final sharedPreferencesDi = _$SharedPreferencesDi();
    gh.lazySingleton<_i3.AnalyticsService>(() => _i3.AnalyticsService());
    gh.lazySingleton<_i4.AppTheme>(() => appThemeDi.lightTheme,
        instanceName: 'lightTheme');
    gh.lazySingleton<_i4.AppTheme>(() => appThemeDi.darkTheme,
        instanceName: 'darkTheme');
    gh.lazySingleton<_i5.CrashesService>(() => _i5.CrashesService());
    gh.lazySingleton<_i6.DataConnectionChecker>(
        () => networkInfoDi.dataConnectionChecker);
    gh.lazySingleton<_i7.Dio>(() => dioDi.dio);
    gh.lazySingleton<_i8.Env>(() => _i8.Env());
    gh.lazySingleton<_i9.FlashHelper>(() => _i9.FlashHelper());
    gh.lazySingleton<_i10.FlushbarHelper>(() => _i10.FlushbarHelper());
    gh.lazySingleton<_i11.Logger>(() => loggerDi.logger);
    gh.lazySingleton<_i12.NetworkInfo>(
        () => _i12.NetworkInfo(get<_i6.DataConnectionChecker>()));
    gh.lazySingleton<_i13.PushesService>(() => _i13.PushesService());
    await gh.factoryAsync<_i14.SharedPreferences>(
        () => sharedPreferencesDi.sharedPreferences,
        preResolve: true);
    gh.lazySingleton<_i15.AlertsHelper>(
        () => _i15.AlertsHelper(get<_i5.CrashesService>()));
    gh.lazySingleton<_i16.ApiClient>(() => _i16.ApiClient(get<_i7.Dio>()));
    gh.lazySingleton<_i17.AppLocalDataSource>(
        () => _i17.AppLocalDataSource(get<_i14.SharedPreferences>()));
    gh.lazySingleton<_i18.AppRepository>(
        () => _i18.AppRepository(get<_i17.AppLocalDataSource>()));
    gh.lazySingleton<_i19.LogIt>(() => _i19.LogIt(get<_i11.Logger>()));
    gh.lazySingleton<_i20.LoginLocalDataSource>(
        () => _i20.LoginLocalDataSource(get<_i14.SharedPreferences>()));
    gh.lazySingleton<_i21.LoginRemoteDataSource>(
        () => _i21.LoginRemoteDataSource(get<_i16.ApiClient>()));
    gh.lazySingleton<_i22.LoginRepository>(() => _i22.LoginRepository(
        get<_i20.LoginLocalDataSource>(),
        get<_i21.LoginRemoteDataSource>(),
        get<_i12.NetworkInfo>()));
    gh.lazySingleton<_i23.Alerts>(() =>
        _i23.Alerts(get<_i15.AlertsHelper>(), get<_i10.FlushbarHelper>()));
    gh.lazySingleton<_i24.AppController>(
        () => _i24.AppController(get<_i18.AppRepository>()));
    gh.lazySingleton<_i25.AppStore>(
        () => _i25.AppStore(get<_i24.AppController>(), get<_i23.Alerts>()));
    gh.lazySingleton<_i26.LoginController>(
        () => _i26.LoginController(get<_i22.LoginRepository>()));
    gh.lazySingleton<_i27.LoginStore>(
        () => _i27.LoginStore(get<_i26.LoginController>(), get<_i23.Alerts>()));
    return this;
  }
}

class _$AppThemeDi extends _i28.AppThemeDi {}

class _$NetworkInfoDi extends _i29.NetworkInfoDi {}

class _$DioDi extends _i30.DioDi {}

class _$LoggerDi extends _i31.LoggerDi {}

class _$SharedPreferencesDi extends _i32.SharedPreferencesDi {}
