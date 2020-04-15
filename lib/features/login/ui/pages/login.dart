import 'package:flutter/material.dart';
import 'package:flutter_mobx_dio_boilerplate/common/di/di.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_dio_boilerplate/common/l10n/l10n_helpers.dart';
import 'package:flutter_mobx_dio_boilerplate/common/models/route_redirect_model.dart';
import 'package:flutter_mobx_dio_boilerplate/features/login/data/models/post_login_request_model.dart';
import 'package:flutter_mobx_dio_boilerplate/features/login/ui/store/login_store.dart';
import 'package:flutter_mobx_dio_boilerplate/widget_extends/sf_widget.dart';

class LoginScreen extends StatefulWidget {
  final String redirectRouteName;
  final Object redirectRouteArgs;

  const LoginScreen({
    Key key,
    this.redirectRouteName,
    this.redirectRouteArgs,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends SfWidget<LoginScreen> {
  String get _redirectRouteName => widget.redirectRouteName;

  Object get _redirectRouteArgs => widget.redirectRouteArgs;

  LoginStore get _loginStore => getIt<LoginStore>();

  List<ReactionDisposer> _disposers;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void doLogin(PostLoginRequestModel param) {
    final _redirectOnLogin = RouteRedirectModel(
      routeName: _redirectRouteName,
      arguments: _redirectRouteArgs,
    );

    _loginStore.doLogin(context, param, redirectOnLogin: _redirectOnLogin);
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                doLogin(
                  const PostLoginRequestModel(
                    username: 'user',
                    password: 'password',
                  ),
                );
              },
              child: Text(ln(context, 'login_btn_text')),
            ),
          ],
        ),
      ),
    );
  }
}
