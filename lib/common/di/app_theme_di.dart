import 'package:flutter/material.dart';
import 'package:flutter_mobx_dio_boilerplate/common/themes/app_theme.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppThemeDi {
  @Named('lightTheme')
  @LazySingleton()
  AppTheme get lightTheme => AppTheme(mode: ThemeMode.light);

  @Named('darkTheme')
  @LazySingleton()
  AppTheme get darkTheme => AppTheme(mode: ThemeMode.dark);
}
