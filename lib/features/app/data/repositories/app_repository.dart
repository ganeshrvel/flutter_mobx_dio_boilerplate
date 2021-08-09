import 'package:data_channel/data_channel.dart';
import 'package:flutter_mobx_dio_boilerplate/common/models/language_model.dart';
import 'package:flutter_mobx_dio_boilerplate/common/models/theme_model.dart';
import 'package:flutter_mobx_dio_boilerplate/features/app/data/data_sources/app_local_data_source.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AppRepository {
  final AppLocalDataSource _appLocalDataSource;

  AppRepository(
    this._appLocalDataSource,
  );

  Future<DC<Exception, LanguageModel?>> getAppLanguageData() async {
    return _appLocalDataSource.getAppLanguageData();
  }

  Future<DC<Exception, LanguageModel>> setAppLanguageData(
    LanguageModel data,
  ) async {
    return _appLocalDataSource.setAppLanguageCache(data);
  }

  Future<DC<Exception, bool>> deleteAppLanguageData() async {
    return _appLocalDataSource.deleteAppLanguageCache();
  }

  Future<DC<Exception, ThemeModel?>> getAppThemeData() async {
    return _appLocalDataSource.getAppThemeData();
  }

  Future<DC<Exception, ThemeModel>> setAppThemeData(
    ThemeModel data,
  ) async {
    return _appLocalDataSource.setAppThemeCache(data);
  }

  Future<DC<Exception, bool>> deleteAppThemeData() async {
    return _appLocalDataSource.deleteAppLanguageCache();
  }
}
