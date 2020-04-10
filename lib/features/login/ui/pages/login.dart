import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_dio_boilerplate/common/l10n/l10n_helpers.dart';
import 'package:flutter_mobx_dio_boilerplate/common/models/route_redirect_model.dart';
import 'package:flutter_mobx_dio_boilerplate/features/login/data/models/post_login_request_model.dart';
import 'package:flutter_mobx_dio_boilerplate/features/login/ui/store/login_store.dart';
import 'package:flutter_mobx_dio_boilerplate/widget_extends/sf_widget.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  final String redirectRouteName;
  final Object redirectRouteArgs;

  const LoginScreen({
    Key key,
    this.redirectRouteName,
    this.redirectRouteArgs,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginScreenState(
        redirectOnLogin: RouteRedirectModel(
          routeName: redirectRouteName,
          arguments: redirectRouteArgs,
        ),
      );
}

class _LoginScreenState extends SfWidget<LoginScreen> {
  final RouteRedirectModel redirectOnLogin;

  _LoginScreenState({
    this.redirectOnLogin,
  });

  LoginStore _loginStore;

  List<ReactionDisposer> _disposers;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _loginStore ??= Provider.of<LoginStore>(context);
  }

  void doLogin(PostLoginRequestModel param) {
    _loginStore.doLogin(context, param, redirectOnLogin: redirectOnLogin);
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
