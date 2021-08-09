import 'package:flutter/material.dart';
import 'package:flutter_mobx_dio_boilerplate/common/models/theme_palette.dart';
import 'package:flutter_mobx_dio_boilerplate/common/themes/colors.dart';
import 'package:flutter_mobx_dio_boilerplate/utils/common/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  final ThemeMode mode;

  AppTheme({
    required this.mode,
  });

  /// theme palatte. Use [palette] to pick colors use across the app.
  ThemePalette get palette {
    if (mode == ThemeMode.light) {
      /// LIGHT theme mode color palette
      return ThemePalette(
        accentColor: AppColors.blue,
        secondaryColor: AppColors.blue,
        primaryColor: AppColors.white,
        backgroundColor: AppColors.white,
        textColor: AppColors.black1,
        textContrastColor: AppColors.white,
        rowTextContrastColor: AppColors.white,
        disabledColor: AppColors.lightDisabled,
        hoverColor: AppColors.lightHover,
        splashColor: AppColors.lightSplash,
        captionColor: AppColors.color797,
        sidebarColor: AppColors.colorE6E3E3,
        rowSelectionColor: AppColors.darkBlue,
        alternativeRowColor: AppColors.colorF5F,
        sidebarSelectionColor: AppColors.blue,
        sidebarTileIconColor: AppColors.blue,
        sidebarTileIconContrastColor: AppColors.white,
        sidebarTileTextColor: AppColors.black1,
        sidebarTileTextContrastColor: AppColors.white,
        actionbarIconColor: AppColors.color797,
        tooltipColor: AppColors.colorE6E3E3,
        tooltipTextColor: AppColors.black1,
        progressBackgroundColor: AppColors.colorE5E,
        flatButtonPrimaryColor: AppColors.colorF1F,
      );
      // </------ LIGHT theme mode color palette ----->
    }

    /// DARK theme mode color palette
    return ThemePalette(
      accentColor: AppColors.blue,
      secondaryColor: AppColors.blue,
      primaryColor: AppColors.black1,
      backgroundColor: AppColors.color242024,
      textColor: AppColors.white,
      textContrastColor: AppColors.black1,
      rowTextContrastColor: AppColors.white,
      disabledColor: AppColors.darkDisabled,
      hoverColor: AppColors.darkHover,
      splashColor: AppColors.darkSplash,
      captionColor: AppColors.white.withOpacity(0.7),
      sidebarColor: AppColors.color2D292D,
      rowSelectionColor: AppColors.darkBlue,
      alternativeRowColor: AppColors.color2E2A2E,
      sidebarSelectionColor: AppColors.color464,
      sidebarTileIconColor: AppColors.blue,
      sidebarTileIconContrastColor: AppColors.blue,
      sidebarTileTextColor: AppColors.white,
      sidebarTileTextContrastColor: AppColors.white,
      actionbarIconColor: AppColors.white.withOpacity(0.65),
      tooltipColor: AppColors.color28262B,
      tooltipTextColor: AppColors.white,
      progressBackgroundColor: AppColors.color2E2A2E,
      flatButtonPrimaryColor: AppColors.white.withOpacity(0.35),
    );
    // </------ DARK theme mode color palette ----->
  }

  TextStyle get _originalBodyText1 => GoogleFonts.openSans(
        color: palette.textColor,
      );

  MaterialColor get _primarySwatch => hexColor2MaterialColor(
        color: palette.primaryColor,
      );

  TextTheme get _originalTextTheme {
    if (mode == ThemeMode.dark) {
      return ThemeData.dark().textTheme;
    }

    return ThemeData.light().textTheme;
  }

  IconThemeData get _originalIconTheme {
    if (mode == ThemeMode.dark) {
      return ThemeData.dark().iconTheme;
    }

    return ThemeData.light().iconTheme;
  }

  /// Button Theme
  ButtonThemeData get _buttonTheme {
    return ButtonThemeData(
      buttonColor: palette.accentColor,
      splashColor: palette.splashColor,
      disabledColor: palette.disabledColor,
      hoverColor: palette.hoverColor,
    );
  }

  /// ThemeData
  ThemeData get themeData {
    return ThemeData(
      fontFamily: 'Open Sans',
      brightness: mode == ThemeMode.light ? Brightness.light : Brightness.dark,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      iconTheme: _originalIconTheme,
      primarySwatch: _primarySwatch,
      buttonTheme: _buttonTheme,
      primaryColor: palette.primaryColor,
      accentColor: palette.accentColor,
      indicatorColor: palette.accentColor,
      scaffoldBackgroundColor: palette.backgroundColor,
      backgroundColor: palette.backgroundColor,
      textTheme: GoogleFonts.openSansTextTheme(_originalTextTheme).copyWith(
        headline1: _originalBodyText1.copyWith(
          fontSize: 24.0,
          fontWeight: FontWeight.w800,
        ),
        headline6: _originalBodyText1.copyWith(
          fontSize: 20.0,
          fontWeight: FontWeight.normal,
        ),
        subtitle1: _originalBodyText1.copyWith(
          fontSize: 16.0,
        ),
        subtitle2: _originalBodyText1.copyWith(
          fontSize: 18.0,
        ),
        bodyText1: _originalBodyText1.copyWith(
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
        ),
        bodyText2: _originalBodyText1.copyWith(
          fontSize: 13.0,
          fontWeight: FontWeight.normal,
        ),
        caption: _originalBodyText1.copyWith(
          fontSize: 12.0,
          fontWeight: FontWeight.w700,
          color: palette.captionColor,
        ),
        button: _originalBodyText1.copyWith(
          fontSize: 15.0,
          fontWeight: FontWeight.w900,
        ),
        headline2: _originalBodyText1.copyWith(),
        headline5: _originalBodyText1.copyWith(),
        overline: _originalBodyText1.copyWith(),
        headline4: _originalBodyText1.copyWith(),
        headline3: _originalBodyText1.copyWith(),
      ),
    );
  }
}
