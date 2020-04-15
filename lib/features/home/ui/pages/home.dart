import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_dio_boilerplate/common/di/di.dart';
import 'package:flutter_mobx_dio_boilerplate/common/helpers/navigation_helper.dart';
import 'package:flutter_mobx_dio_boilerplate/common/l10n/l10n_helpers.dart';
import 'package:flutter_mobx_dio_boilerplate/common/models/theme_model.dart';
import 'package:flutter_mobx_dio_boilerplate/common/router/router.gr.dart';
import 'package:flutter_mobx_dio_boilerplate/features/app/ui/store/app_store.dart';
import 'package:flutter_mobx_dio_boilerplate/features/login/ui/store/login_store.dart';
import 'package:flutter_mobx_dio_boilerplate/utils/alerts/alerts.dart';
import 'package:flutter_mobx_dio_boilerplate/widget_extends/sf_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends SfWidget {
  List<ReactionDisposer> _disposers;

  Alerts get _alerts => getIt<Alerts>();

  LoginStore get _loginStore => getIt<LoginStore>();

  AppStore get _appStore => getIt<AppStore>();

  bool test = false;

  int _count = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Widget buildLoginLogoutBtn(
    BuildContext context, {
    @required bool isLoggedIn,
  }) {
    if (isLoggedIn) {
      return RaisedButton(
        onPressed: () {
          _loginStore.logout(context);
        },
        child: Text(ln(context, 'home_logout_btn_text')),
      );
    }

    return RaisedButton(
      onPressed: () {
        navigateToLogin(context);
      },
      child: Text(ln(context, 'home_login_btn_text')),
    );
  }

  @override
  void dispose() {
    if (_disposers != null) {
      _disposers.map((a) {
        a();
      });
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ln(context, 'home_app_bar_title')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              child: Text(
                ln(context, 'home_title'),
                style: const TextStyle(fontSize: 18),
              ),
            ),
            Observer(builder: (_) {
              final isLoggedIn = _loginStore.isLoggedIn ?? false;

              return buildLoginLogoutBtn(context, isLoggedIn: isLoggedIn);
            }),
            RaisedButton(
              onPressed: () {
                _alerts.setAlert(context, 'An alert ${_count++}');
              },
              child: Text(ln(context, 'home_throw_alert_btn_text')),
            ),
            RaisedButton(
              onPressed: () {
                navigateToRoute(context, Routes.profileScreen);
              },
              child: Text(ln(context, 'home_open_profile_btn_text')),
            ),
            RaisedButton(
              onPressed: () {
                navigateToRoute(context, 'unknown');
              },
              child: Text(ln(context, 'home_open_404_btn_text')),
            ),
            Column(
              children: <Widget>[
                Text(ln(context, 'home_toggle_language_btn_text')),
                Observer(builder: (_) {
                  final localeValue = _appStore.language.locale;

                  return Switch(
                    value: localeValue == 'en',
                    onChanged: (value) {
                      final locale = localeValue;

                      if (locale == 'en') {
                        _appStore.setAppLanguage(
                            context, supportedL10nLanguages.last);

                        return;
                      }

                      _appStore.setAppLanguage(
                          context, supportedL10nLanguages.first);
                    },
                  );
                }),
              ],
            ),
            Column(
              children: <Widget>[
                Text(ln(context, 'home_toggle_theme_btn_text')),
                Observer(builder: (_) {
                  final themeValue = _appStore.theme.mode;

                  return Switch(
                    value: themeValue == ThemeMode.light,
                    onChanged: (value) {
                      if (themeValue == ThemeMode.light) {
                        _appStore.setAppTheme(
                          context,
                          const ThemeModel(mode: ThemeMode.dark),
                        );

                        return;
                      }

                      _appStore.setAppTheme(
                        context,
                        const ThemeModel(mode: ThemeMode.light),
                      );
                    },
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
