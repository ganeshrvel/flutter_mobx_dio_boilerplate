import 'package:auto_route/auto_route.dart';
import 'package:flutter_mobx_dio_boilerplate/common/di/di.dart';
import 'package:flutter_mobx_dio_boilerplate/common/router/router.gr.dart';
import 'package:flutter_mobx_dio_boilerplate/features/login/data/controllers/login_controller.dart';

class RouterAuthGuard extends RouteGuard {
  final LoginController _loginController = getIt<LoginController>();

  @override
  Future<bool> canNavigate(
    ExtendedNavigatorState navigator,
    String routeName,
    Object arguments,
  ) async {
    final _deviceAuthenticationData =
        await _loginController.getDeviceAuthenticationData();

    if (_deviceAuthenticationData.data?.isAuthenticated ?? false) {
      return true;
    }

    navigator.pushNamed(
      Routes.loginScreen,
      arguments: LoginScreenArguments(
        redirectRouteName: routeName,
        redirectRouteArgs: arguments,
      ),
    );

    return false;
  }
}
