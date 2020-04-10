import 'package:flutter/material.dart';
import 'package:flutter_mobx_dio_boilerplate/common/models/theme_model.dart';
import 'package:flutter_mobx_dio_boilerplate/common/themes/dark_theme.dart';
import 'package:flutter_mobx_dio_boilerplate/common/themes/light_theme.dart';

MaterialColor hexColor2MaterialColor(int hexColor) {
  final color = Color(hexColor);
  final r = color.red;
  final g = color.green;
  final b = color.blue;

  return MaterialColor(
    hexColor,
    <int, Color>{
      50: Color.fromRGBO(r, g, b, .1),
      100: Color.fromRGBO(r, g, b, .2),
      200: Color.fromRGBO(r, g, b, .3),
      300: Color.fromRGBO(r, g, b, .4),
      400: Color.fromRGBO(r, g, b, .5),
      500: Color.fromRGBO(r, g, b, .6),
      600: Color.fromRGBO(r, g, b, .7),
      700: Color.fromRGBO(r, g, b, .8),
      800: Color.fromRGBO(r, g, b, .9),
      900: Color.fromRGBO(r, g, b, 1),
    },
  );
}

ThemeModel getDefaultAppTheme() {
  return const ThemeModel(mode: ThemeMode.light);
}

ThemeData getAppThemeFromThemeMode(ThemeMode mode) {
  if (mode == ThemeMode.light) {
    return LightTheme.themeData;
  }

  return DarkTheme.themeData;
}
