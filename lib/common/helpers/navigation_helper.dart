import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx_dio_boilerplate/common/router/root_router.dart';
import 'package:flutter_mobx_dio_boilerplate/common/router/router.gr.dart';

bool? isCurrentScreen(BuildContext? context) {
  if (context == null) {
    return null;
  }

  return ModalRoute.of(context)!.isCurrent;
}

String? getCurrentScreen(BuildContext? context) {
  if (context == null) {
    return null;
  }

  return ModalRoute.of(context)!.settings.name;
}

Future<T?> navigateToRoute<T extends Object>({
  BuildContext? context,
  required PageRouteInfo route,
  bool? skipSameRouteCheck,
}) async {
  final _skipSameRouteCheck = skipSameRouteCheck ?? true;

  if (!_skipSameRouteCheck && getCurrentScreen(context) == route.routeName) {
    return null;
  }

  if (route.routeName == HomeScreenRoute.name) {
    var _routeArgs = const HomeScreenRouteArgs();

    if (route.args is HomeScreenRouteArgs) {
      _routeArgs = route.args as HomeScreenRouteArgs;
    }

    return navigateToHomeScreen<T>(routeArgs: _routeArgs);
  }

  return rootRouter.push(route);
}

Future<T?> navigateToRouteAndReplace<T extends Object>(
  PageRouteInfo route,
) async {
  if (route.routeName == HomeScreenRoute.name) {
    var _routeArgs = const HomeScreenRouteArgs();

    if (route.args is HomeScreenRouteArgs) {
      _routeArgs = route.args as HomeScreenRouteArgs;
    }

    return navigateToHomeScreen<T>(routeArgs: _routeArgs);
  }

  return rootRouter.replace(
    route,
  );
}

Future<T?> navigateToRouteAndRemoveUntil<T extends Object>(
  PageRouteInfo route,
) async {
  return rootRouter.pushAndPopUntil<T>(
    route,
    predicate: (r) => false,
  );
}

Future<bool> popCurrentRoute<T extends Object>({T? result}) async {
  return rootRouter.pop<T>(result);
}

bool canPopCurrentRoute<T>() {
  return rootRouter.canPopSelfOrChildren;
}

/// navigating to homescreen should clear the navigation stack and start again
Future<T?> navigateToHomeScreen<T extends Object>({
  HomeScreenRouteArgs? routeArgs,
}) async {
  return navigateToRouteAndRemoveUntil<T>(
    HomeScreenRoute(
      dummyValue: routeArgs?.dummyValue,
    ),
  );
}

void navigateToLoginScreen({
  BuildContext? context,
  LoginScreenRouteArgs? args,
}) {
  navigateToRoute(
    context: context,
    route: LoginScreenRoute(redirectOnLogin: args?.redirectOnLogin),
  );
}
