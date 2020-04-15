// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_mobx_dio_boilerplate/features/home/ui/pages/home.dart';
import 'package:flutter_mobx_dio_boilerplate/features/login/ui/pages/login.dart';
import 'package:flutter_mobx_dio_boilerplate/features/splash/ui/pages/splash.dart';
import 'package:flutter_mobx_dio_boilerplate/features/profile/ui/pages/profile.dart';
import 'package:flutter_mobx_dio_boilerplate/common/router/router_auth_guard.dart';
import 'package:flutter_mobx_dio_boilerplate/features/page_not_found/ui/pages/page_not_found.dart';

abstract class Routes {
  static const homeScreen = '/';
  static const loginScreen = '/login-screen';
  static const splashScreen = '/splash-screen';
  static const profileScreen = '/profile-screen';
  static const all = {
    homeScreen,
    loginScreen,
    splashScreen,
    profileScreen,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;
  @override
  Map<String, List<Type>> get guardedRoutes => {
        Routes.profileScreen: [RouterAuthGuard],
      };
  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.homeScreen:
        if (hasInvalidArgs<HomeScreenArguments>(args)) {
          return misTypedArgsRoute<HomeScreenArguments>(args);
        }
        final typedArgs = args as HomeScreenArguments ?? HomeScreenArguments();
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              HomeScreen(key: typedArgs.key),
          settings: settings,
        );
      case Routes.loginScreen:
        if (hasInvalidArgs<LoginScreenArguments>(args)) {
          return misTypedArgsRoute<LoginScreenArguments>(args);
        }
        final typedArgs =
            args as LoginScreenArguments ?? LoginScreenArguments();
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(
              key: typedArgs.key,
              redirectRouteName: typedArgs.redirectRouteName,
              redirectRouteArgs: typedArgs.redirectRouteArgs),
          settings: settings,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          transitionDuration: const Duration(milliseconds: 50),
          fullscreenDialog: true,
        );
      case Routes.splashScreen:
        if (hasInvalidArgs<SplashScreenArguments>(args)) {
          return misTypedArgsRoute<SplashScreenArguments>(args);
        }
        final typedArgs =
            args as SplashScreenArguments ?? SplashScreenArguments();
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              SplashScreen(key: typedArgs.key),
          settings: settings,
        );
      case Routes.profileScreen:
        if (hasInvalidArgs<ProfileScreenArguments>(args)) {
          return misTypedArgsRoute<ProfileScreenArguments>(args);
        }
        final typedArgs =
            args as ProfileScreenArguments ?? ProfileScreenArguments();
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              ProfileScreen(key: typedArgs.key),
          settings: settings,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          transitionDuration: const Duration(milliseconds: 50),
        );
      default:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              PageNotFoundScreen(settings.name),
          settings: settings,
        );
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//HomeScreen arguments holder class
class HomeScreenArguments {
  final Key key;
  HomeScreenArguments({this.key});
}

//LoginScreen arguments holder class
class LoginScreenArguments {
  final Key key;
  final String redirectRouteName;
  final Object redirectRouteArgs;
  LoginScreenArguments(
      {this.key, this.redirectRouteName, this.redirectRouteArgs});
}

//SplashScreen arguments holder class
class SplashScreenArguments {
  final Key key;
  SplashScreenArguments({this.key});
}

//ProfileScreen arguments holder class
class ProfileScreenArguments {
  final Key key;
  ProfileScreenArguments({this.key});
}
