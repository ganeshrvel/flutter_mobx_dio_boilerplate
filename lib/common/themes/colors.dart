import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_mobx_dio_boilerplate/common/themes/hex_color.dart';

class AppColors {
  AppColors._();

  static const Color transparent = Colors.transparent;

  /// primary color in light theme mode
  /// primarily used for light theme scaffold background
  static const Color white = Colors.white;

  /// primary color in dark theme mode
  /// black shade 1, primarily used for dark theme scaffold background
  ///
  /// [Open color-hex.com](https://www.color-hex.com/color/242024)
  static final Color color242024 = HexColor('242024');

  /// primary and accent color
  ///
  /// [Open color-hex.com](https://www.color-hex.com/color/017AFF)
  static final Color blue = HexColor('017AFF');

  /// black shade 2, primarily used for text
  ///
  /// [Open color-hex.com](https://www.color-hex.com/color/232526)
  static final Color black1 = HexColor('232526');

  static final Color lightDisabled = Colors.black.withOpacity(0.2);
  static final Color darkDisabled = Colors.white.withOpacity(0.2);

  static final Color lightSplash = Colors.black.withOpacity(0.02);
  static final Color darkSplash = Colors.white.withOpacity(0.1);

  static final Color lightHover = Colors.black.withOpacity(0.05);
  static final Color darkHover = Colors.white.withOpacity(0.1);

  ///
  /// [Open color-hex.com](https://www.color-hex.com/color/F96057)
  static final Color error = HexColor('F96057');

  ///
  /// [Open color-hex.com](https://www.color-hex.com/color/F8A34D)
  static final Color warn = HexColor('F8A34D');

  ///
  /// [Open color-hex.com](https://www.color-hex.com/color/488EF7)
  static final Color info = HexColor('488EF7');

  ///
  /// [Open color-hex.com](https://www.color-hex.com/color/5FCF65)
  static final Color success = HexColor('5FCF65');

  /// brighter shade of white
  ///
  /// [Open color-hex.com](https://www.color-hex.com/color/F1F1F1)
  static final Color colorF1F = HexColor('F1F1F1');

  /// dim white shade 1
  /// used as alternate row color in light theme mode
  ///
  /// [Open color-hex.com](https://www.color-hex.com/color/F5F5F5)
  static final Color colorF5F = HexColor('F5F5F5');

  /// second shade of blue
  /// used as row selection color in light theme mode
  ///
  /// [Open color-hex.com](https://www.color-hex.com/color/2365D8)
  static final Color darkBlue = HexColor('2365D8');

  /// dim white shade 2
  /// used as row selection color in dark theme mode
  ///
  /// [Open color-hex.com](https://www.color-hex.com/color/464646)
  static final Color color464 = HexColor('464646');

  /// very dim white shade 3
  /// used as alternate row color in dark theme mode
  ///
  /// [Open color-hex.com](https://www.color-hex.com/color/2E2A2E)
  static final Color color2E2A2E = HexColor('2E2A2E');

  /// dim white shade 4
  /// Used for captions, overlays
  ///
  /// [Open color-hex.com](https://www.color-hex.com/color/797979)
  static final Color color797 = HexColor('797979');

  /// pink shade
  /// used for sidebar and cells separator
  ///
  /// [Open color-hex.com](https://www.color-hex.com/color/E6E3E3)
  static final Color colorE6E3E3 = HexColor('E6E3E3');

  /// black shade 3
  /// used for tooltips in dark theme mode
  ///
  /// [Open color-hex.com](https://www.color-hex.com/color/28262B)
  static final Color color28262B = HexColor('28262B');

  /// secondary dark shade
  /// used for sidebar and cells separator
  ///
  /// [Open color-hex.com](https://www.color-hex.com/color/2d292d)
  static final Color color2D292D = HexColor('2D292D');

  /// light gray shade 1
  ///
  /// [Open color-hex.com](https://www.color-hex.com/color/E5E5E5)
  static final Color colorE5E = HexColor('E5E5E5');
}
