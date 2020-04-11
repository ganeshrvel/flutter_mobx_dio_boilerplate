import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_dio_boilerplate/common/enums/state_status.dart';
import 'package:flutter_mobx_dio_boilerplate/common/exceptions/exceptions.dart';
import 'package:flutter_mobx_dio_boilerplate/common/models/route_redirect_model.dart';
import 'package:flutter_mobx_dio_boilerplate/constants/errors.dart';
import 'package:flutter_mobx_dio_boilerplate/features/login/data/controllers/login_controller.dart';
import 'package:flutter_mobx_dio_boilerplate/features/login/data/models/post_login_request_model.dart';
import 'package:flutter_mobx_dio_boilerplate/common/helpers/navigation_helper.dart';
import 'package:flutter_mobx_dio_boilerplate/utils/alerts/alerts_model.dart';
import 'package:flutter_mobx_dio_boilerplate/utils/alerts/alerts.dart';

part 'login_store.g.dart';

@lazySingleton
class LoginStore extends _LoginStoreBase with _$LoginStore {
  @override
  LoginController loginController;

  @override
  Alerts alerts;

  LoginStore(
    this.loginController,
    this.alerts,
  ) : super(loginController, alerts);
}

abstract class _LoginStoreBase with Store {
  LoginController loginController;

  Alerts alerts;

  _LoginStoreBase(this.loginController, this.alerts);

  @observable
  StateStatus isLoggedInStatus = StateStatus.INITIAL;
  @observable
  bool isLoggedIn;

  @observable
  String errorMessage;

  @action
  Future<void> doLogin(
    BuildContext context,
    PostLoginRequestModel params, {
    RouteRedirectModel redirectOnLogin,
  }) async {
    isLoggedInStatus = StateStatus.LOADING;
    final loginData = await loginController.postLogin(params);
    isLoggedInStatus = StateStatus.SUCCESS;

    loginData.pick(
      onError: (error) {
        isLoggedIn = false;

        if (error is UnauthenticatedException) {
          alerts.setAlert(context, Errors.INVALID_AUTHENTICATION_MESSAGE);

          return;
        }

        alerts.setException(context, error);
      },
      onData: (data) {
        if (!data.isAuthenticated) {
          isLoggedIn = false;

          return;
        }

        if (redirectOnLogin?.routeName != null) {
          navigateToRouteAndReplace(
            context,
            redirectOnLogin.routeName,
            routeArgs: redirectOnLogin.arguments,
          );
        } else {
          popCurrentRoute(context);

          alerts.setAlert(
            context,
            'Login was successful',
            type: AlertsTypeEnum.SUCCESS,
          );
        }

        isLoggedIn = true;
      },
      onNoData: () {
        isLoggedIn = false;
      },
    );
  }

  @action
  Future<void> getAuthentication(BuildContext context) async {
    isLoggedInStatus = StateStatus.LOADING;
    final loginData = await loginController.getAuthenticationData();
    isLoggedInStatus = StateStatus.SUCCESS;

    loginData.pick(
      onError: (error) {
        isLoggedIn = false;

        if (error is UnauthenticatedException) {
          logout(context, redirectToHome: false);
        }
      },
      onData: (data) {
        if (data.isAuthenticated) {
          canPopCurrentRoute(context);

          isLoggedIn = true;

          return;
        }

        isLoggedIn = false;
      },
      onNoData: () {
        isLoggedIn = false;
      },
    );
  }

  @action
  Future<void> logout(BuildContext context, {bool redirectToHome}) async {
    final _redirectToHome = redirectToHome ?? true;

    isLoggedInStatus = StateStatus.LOADING;
    final logoutData = await loginController.logout();
    isLoggedInStatus = StateStatus.SUCCESS;

    logoutData.pick(
      onError: (error) {
        if (error is! CacheException) {
          isLoggedIn = false;
        }

        alerts.setException(context, error);
      },
      onData: (data) {
        if (_redirectToHome) {
          navigateToHome(context);
        }

        isLoggedIn = false;
      },
      onNoData: () {
        isLoggedIn = false;
      },
    );
  }
}
