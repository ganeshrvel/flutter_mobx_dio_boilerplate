import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_dio_boilerplate/common/di/di.dart';
import 'package:flutter_mobx_dio_boilerplate/common/l10n/l10n.dart';
import 'package:flutter_mobx_dio_boilerplate/common/l10n/l10n_helpers.dart';
import 'package:flutter_mobx_dio_boilerplate/common/router/router_auth_guard.dart';
import 'package:flutter_mobx_dio_boilerplate/common/themes/theme_helper.dart';
import 'package:flutter_mobx_dio_boilerplate/features/app/ui/store/app_store.dart';
import 'package:flutter_mobx_dio_boilerplate/common/router/router.gr.dart'
    as router_di;
import 'package:flutter_mobx_dio_boilerplate/constants/env.dart';
import 'package:flutter_mobx_dio_boilerplate/constants/strings.dart';

class App extends StatelessWidget {
  final AppStore _appStore = getIt<AppStore>();

  void setErrorBuilder() {
    ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
      return const Scaffold(
        body: Center(
          child: Text('Oops.. Some error occured.'),
        ),
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (!_appStore.isAppSettingsLoaded) {
          return Center(
            child: Container(),
          );
        }

        return MaterialApp(
          debugShowCheckedModeBanner: Env.data.debugShowCheckedModeBanner,
          debugShowMaterialGrid: Env.data.debugShowMaterialGrid,
          builder: (context, nativeNavigator) {
            setErrorBuilder();

            return ExtendedNavigator<router_di.Router>(
              initialRoute: router_di.Routes.splashScreen,
              router: router_di.Router(),
              guards: [
                RouterAuthGuard(),
              ],
              observers: const [],
            );
          },
          title: Strings.APP_NAME,
          theme: getAppThemeFromThemeMode(_appStore.theme.mode),
          locale: Locale(
            _appStore.language.locale,
            _appStore.language.countryCode,
          ),
          supportedLocales: supportedL10nLanguages
              .map((language) => Locale(language.locale, language.countryCode))
              .toList(),
          localizationsDelegates: [
            L10n.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            if (locale == null) {
              return supportedLocales.first;
            }

            // Check if the current device locale is supported
            return supportedLocales.firstWhere(
              (supportedLocale) =>
                  supportedLocale.languageCode == locale.languageCode,
              orElse: () => supportedLocales.first,
            );
          },
        );
      },
    );
  }
}
