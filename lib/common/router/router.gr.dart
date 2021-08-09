// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;
import 'package:flutter_mobx_dio_boilerplate/common/router/router_auth_guard.dart'
    as _i3;
import 'package:flutter_mobx_dio_boilerplate/features/home/ui/pages/home.dart'
    as _i5;
import 'package:flutter_mobx_dio_boilerplate/features/login/ui/pages/login.dart'
    as _i6;
import 'package:flutter_mobx_dio_boilerplate/features/page_not_found/ui/pages/page_not_found.dart'
    as _i8;
import 'package:flutter_mobx_dio_boilerplate/features/profile/ui/pages/profile.dart'
    as _i7;
import 'package:flutter_mobx_dio_boilerplate/features/splash/ui/pages/splash.dart'
    as _i4;

class RootRouter extends _i1.RootStackRouter {
  RootRouter(
      {_i2.GlobalKey<_i2.NavigatorState>? navigatorKey,
      required this.routerAuthGuard})
      : super(navigatorKey);

  final _i3.RouterAuthGuard routerAuthGuard;

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.SplashScreen();
        }),
    HomeScreenRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<HomeScreenRouteArgs>(
              orElse: () => const HomeScreenRouteArgs());
          return _i5.HomeScreen(key: args.key, dummyValue: args.dummyValue);
        }),
    LoginScreenRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<LoginScreenRouteArgs>();
          return _i6.LoginScreen(
              key: args.key, redirectOnLogin: args.redirectOnLogin);
        }),
    ProfileScreenRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i7.ProfileScreen();
        }),
    PageNotFoundScreenRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<PageNotFoundScreenRouteArgs>();
          return _i8.PageNotFoundScreen(args.routeName);
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig('/#redirect',
            path: '/', redirectTo: '/splashScreen', fullMatch: true),
        _i1.RouteConfig(SplashScreenRoute.name, path: '/splashScreen'),
        _i1.RouteConfig(HomeScreenRoute.name, path: '/homeScreen'),
        _i1.RouteConfig(LoginScreenRoute.name, path: '/loginScreen'),
        _i1.RouteConfig(ProfileScreenRoute.name,
            path: '/profileScreen', guards: [routerAuthGuard]),
        _i1.RouteConfig(PageNotFoundScreenRoute.name, path: '*')
      ];
}

class SplashScreenRoute extends _i1.PageRouteInfo {
  const SplashScreenRoute() : super(name, path: '/splashScreen');

  static const String name = 'SplashScreenRoute';
}

class HomeScreenRoute extends _i1.PageRouteInfo<HomeScreenRouteArgs> {
  HomeScreenRoute({_i2.Key? key, String? dummyValue})
      : super(name,
            path: '/homeScreen',
            args: HomeScreenRouteArgs(key: key, dummyValue: dummyValue));

  static const String name = 'HomeScreenRoute';
}

class HomeScreenRouteArgs {
  const HomeScreenRouteArgs({this.key, this.dummyValue});

  final _i2.Key? key;

  final String? dummyValue;
}

class LoginScreenRoute extends _i1.PageRouteInfo<LoginScreenRouteArgs> {
  LoginScreenRoute(
      {_i2.Key? key, required _i1.PageRouteInfo<dynamic>? redirectOnLogin})
      : super(name,
            path: '/loginScreen',
            args: LoginScreenRouteArgs(
                key: key, redirectOnLogin: redirectOnLogin));

  static const String name = 'LoginScreenRoute';
}

class LoginScreenRouteArgs {
  const LoginScreenRouteArgs({this.key, required this.redirectOnLogin});

  final _i2.Key? key;

  final _i1.PageRouteInfo<dynamic>? redirectOnLogin;
}

class ProfileScreenRoute extends _i1.PageRouteInfo {
  const ProfileScreenRoute() : super(name, path: '/profileScreen');

  static const String name = 'ProfileScreenRoute';
}

class PageNotFoundScreenRoute
    extends _i1.PageRouteInfo<PageNotFoundScreenRouteArgs> {
  PageNotFoundScreenRoute({required String routeName})
      : super(name,
            path: '*', args: PageNotFoundScreenRouteArgs(routeName: routeName));

  static const String name = 'PageNotFoundScreenRoute';
}

class PageNotFoundScreenRouteArgs {
  const PageNotFoundScreenRouteArgs({required this.routeName});

  final String routeName;
}
