import 'package:flutter/widgets.dart';
import 'package:flutter_mobx_dio_boilerplate/common/themes/theme_helper.dart';

class HexColor extends Color {
  HexColor(final String hexColor) : super(colorToInt(hexColor));
}
