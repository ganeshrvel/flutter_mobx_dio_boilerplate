import 'package:data_channel/data_channel.dart';
import 'package:flutter_mobx_dio_boilerplate/features/app/data/models/language_model.dart';
import 'package:flutter_mobx_dio_boilerplate/features/app/data/models/theme_model.dart';
import 'package:flutter_mobx_dio_boilerplate/features/app/data/repositories/app_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AppController {
  final AppRepository _appRepository;

  AppController(this._appRepository);

  Future<DC<Exception, LanguageModel?>> getAppLanguageData() async {
    return _appRepository.getAppLanguageData();
  }

  Future<DC<Exception, LanguageModel>> setAppLanguageData(
    LanguageModel data,
  ) async {
    return _appRepository.setAppLanguageData(data);
  }

  Future<DC<Exception, bool>> deleteAppLanguageData() async {
    return _appRepository.deleteAppLanguageData();
  }

  Future<DC<Exception, ThemeModel?>> getAppThemeData() async {
    return _appRepository.getAppThemeData();
  }

  Future<DC<Exception, ThemeModel>> setAppThemeData(
    ThemeModel data,
  ) async {
    return _appRepository.setAppThemeData(data);
  }

  Future<DC<Exception, bool>> deleteAppThemeData() async {
    return _appRepository.deleteAppThemeData();
  }
}
