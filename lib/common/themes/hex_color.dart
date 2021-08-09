import 'package:flutter/widgets.dart';
import 'package:flutter_mobx_dio_boilerplate/utils/common/colors.dart';

class HexColor extends Color {
  HexColor(final String hexColor) : super(colorToInt(hexColor));
}
