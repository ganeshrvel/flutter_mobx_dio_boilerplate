import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_mobx_dio_boilerplate/common/di/di.dart';
import 'package:flutter_mobx_dio_boilerplate/common/models/theme_palette.dart';
import 'package:flutter_mobx_dio_boilerplate/common/themes/app_theme.dart';
import 'package:flutter_mobx_dio_boilerplate/constants/app_default_values.dart';
import 'package:flutter_mobx_dio_boilerplate/features/app/data/models/theme_model.dart';
import 'package:flutter_mobx_dio_boilerplate/utils/common/functs.dart';

ThemeModel getDefaultAppTheme() {
  return const ThemeModel(mode: ThemeMode.light);
}

/// returns the platform [ThemeMode];
/// if 'follow system theme' is false then null is returned
/// if [context] is null then use [SchedulerBinding]
ThemeMode? getPlatformThemeMode(BuildContext? context) {
  if (!AppDefaultValues.FOLLOW_SYSTEM_THEME) {
    return null;
  }

  Brightness _brightness;

  if (isNotNull(context)) {
    _brightness = MediaQuery.of(context!).platformBrightness;
  } else {
    _brightness = SchedulerBinding.instance!.window.platformBrightness;
  }

  return _brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
}

/// returns true if dark theme mode is activated (by the user or by the platform)
bool isDarkMode(BuildContext context) {
  final _platformTheme = getPlatformThemeMode(context);

  if (isNotNull(_platformTheme)) {
    return _platformTheme == ThemeMode.dark;
  }

  return Theme.of(context).brightness == Brightness.dark;
}

/// Get app theme [AppTheme]
AppTheme getAppTheme(ThemeMode? mode) {
  if (mode == ThemeMode.light) {
    // declared in [lib/common/di/app_theme_di.dart]
    final _lightTheme = getIt.get<AppTheme>(instanceName: 'lightTheme');

    return _lightTheme;
  }

  // declared in [lib/common/di/app_theme_di.dart]
  final _darkTheme = getIt.get<AppTheme>(instanceName: 'darkTheme');

  return _darkTheme;
}

/// Returns [ThemeData] from [ThemeData]
ThemeData getAppThemeData(ThemeMode mode) {
  ThemeMode? _themeMode = mode;

  final _platformThemeMode = getPlatformThemeMode(null);

  /// if [platformThemeMode] is not null then follow that
  if (isNotNull(_platformThemeMode)) {
    _themeMode = _platformThemeMode;
  }

  return getAppTheme(_themeMode).themeData;
}

/// Returns [ThemePalette] from [ThemeData]
ThemePalette getPalette(BuildContext context) {
  final _mode = isDarkMode(context) ? ThemeMode.dark : ThemeMode.light;

  return getAppTheme(_mode).palette;
}
