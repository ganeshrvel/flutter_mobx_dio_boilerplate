import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx_dio_boilerplate/common/router/router.gr.dart';

bool isCurrentScreen(BuildContext context) {
  return ModalRoute.of(context).isCurrent;
}

String getCurrentScreen(BuildContext context) {
  return ModalRoute.of(context).settings.name;
}

void navigateToLogin(
  BuildContext context, {
  Object routeArgs,
}) {
  navigateToRoute(
    context,
    Routes.loginScreen,
    routeArgs: routeArgs,
  );
}

void navigateToRoute(
  BuildContext context,
  String routeName, {
  Object routeArgs,
}) {
  if (getCurrentScreen(context) == routeName) {
    return;
  }

  if (routeArgs != null) {
    ExtendedNavigator.of(context).pushNamed(
      routeName,
      arguments: routeArgs,
    );

    return;
  }

  ExtendedNavigator.of(context).pushNamed(routeName);
}

void navigateToHome(
  BuildContext context, {
  Object routeArgs,
}) {
  navigateToRouteAndRemoveUntil(context, Routes.homeScreen,
      routeArgs: routeArgs);
}

void navigateToRouteAndReplace(
  BuildContext context,
  String routeName, {
  Object routeArgs,
}) {
  if (routeArgs != null) {
    ExtendedNavigator.of(context).pushReplacementNamed(
      routeName,
    );

    return;
  }

  ExtendedNavigator.of(context).pushReplacementNamed(
    routeName,
  );
}

void navigateToRouteAndRemoveUntil(
  BuildContext context,
  String routeName, {
  Object routeArgs,
}) {
  if (routeArgs != null) {
    ExtendedNavigator.of(context).pushNamedAndRemoveUntil(
      routeName,
      (final route) => false,
      arguments: routeArgs,
    );

    return;
  }

  ExtendedNavigator.of(context).pushNamedAndRemoveUntil(
    routeName,
    (final route) => false,
  );
}

void popCurrentRoute(BuildContext context) {
  ExtendedNavigator.of(context).pop();
}

void canPopCurrentRoute(BuildContext context) {
  ExtendedNavigator.of(context).canPop();
}
