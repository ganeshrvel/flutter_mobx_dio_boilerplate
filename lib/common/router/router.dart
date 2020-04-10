import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter_mobx_dio_boilerplate/common/router/router_auth_guard.dart';
import 'package:flutter_mobx_dio_boilerplate/features/home/ui/pages/home.dart';
import 'package:flutter_mobx_dio_boilerplate/features/login/ui/pages/login.dart';
import 'package:flutter_mobx_dio_boilerplate/features/page_not_found/ui/pages/page_not_found.dart';
import 'package:flutter_mobx_dio_boilerplate/features/profile/ui/pages/profile.dart';
import 'package:flutter_mobx_dio_boilerplate/features/splash/ui/pages/splash.dart';

@CustomAutoRouter()
class $Router {
  @CustomRoute(
    initial: true,
  )
  HomeScreen homeScreen;

  @CustomRoute(
    fullscreenDialog: true,
    transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
    durationInMilliseconds: 50,
  )
  LoginScreen loginScreen;

  SplashScreen splashScreen;

  @GuardedBy([RouterAuthGuard])
  @CustomRoute(
    transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
    durationInMilliseconds: 50,
  )
  ProfileScreen profileScreen;

  @unknownRoute
  PageNotFoundScreen pageNotFoundScreen;
}
