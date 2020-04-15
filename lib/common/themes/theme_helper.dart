import 'package:flutter/material.dart';
import 'package:flutter_mobx_dio_boilerplate/common/models/theme_model.dart';
import 'package:flutter_mobx_dio_boilerplate/common/themes/dark_theme.dart';
import 'package:flutter_mobx_dio_boilerplate/common/themes/light_theme.dart';

MaterialColor hexColor2MaterialColor({Color color, int hexColor}) {
  assert(color != null || hexColor != null);

  final _color = color ?? Color(hexColor);
  final _hexColor = hexColor ?? colorToInt(colorToHex(_color));

  final r = _color.red;
  final g = _color.green;
  final b = _color.blue;

  return MaterialColor(
    _hexColor,
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

bool isDarkMode(BuildContext context) {
  final brightness = MediaQuery.of(context).platformBrightness;

  return brightness == Brightness.dark;
}

/// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
String colorToHex(Color color, {bool leadingHashSign = false}) {
  final r = color.red;
  final g = color.green;
  final b = color.blue;
  final a = color.alpha;

  return '${leadingHashSign ? '#' : ''}'
      '${a.toRadixString(16).padLeft(2, '0')}'
      '${r.toRadixString(16).padLeft(2, '0')}'
      '${g.toRadixString(16).padLeft(2, '0')}'
      '${b.toRadixString(16).padLeft(2, '0')}';
}

int colorToInt(String hexColor) {
  var _hexColor = hexColor.toUpperCase().replaceAll('#', '');

  if (_hexColor.length == 6) {
    _hexColor = 'FF$_hexColor';
  }

  return int.parse(_hexColor, radix: 16);
}
