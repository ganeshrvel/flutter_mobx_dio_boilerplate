import 'package:auto_route/auto_route.dart';
import 'package:flutter_mobx_dio_boilerplate/common/di/di.dart';
import 'package:flutter_mobx_dio_boilerplate/features/login/data/controllers/login_controller.dart';

class RouterAuthGuard extends AutoRouteGuard {
  final LoginController _loginController = getIt<LoginController>();

  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    final _deviceAuthenticationData =
        await _loginController.getDeviceAuthenticationData();

    if (_deviceAuthenticationData.data?.isAuthenticated ?? false) {
      return resolver.next(true);
    }

    return resolver.next(true);
  }
}
