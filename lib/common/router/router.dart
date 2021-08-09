import 'package:auto_route/auto_route.dart';
import 'package:flutter_mobx_dio_boilerplate/common/router/router_auth_guard.dart';
import 'package:flutter_mobx_dio_boilerplate/features/home/ui/pages/home.dart';
import 'package:flutter_mobx_dio_boilerplate/features/login/ui/pages/login.dart';
import 'package:flutter_mobx_dio_boilerplate/features/page_not_found/ui/pages/page_not_found.dart';
import 'package:flutter_mobx_dio_boilerplate/features/profile/ui/pages/profile.dart';
import 'package:flutter_mobx_dio_boilerplate/features/splash/ui/pages/splash.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    // splash
    AutoRoute(
      initial: true,
      path: '/splashScreen',
      page: SplashScreen,
    ),

    // home
    AutoRoute(
      initial: true,
      path: '/homeScreen',
      page: HomeScreen,
    ),

    // login
    AutoRoute(
      path: '/loginScreen',
      page: LoginScreen,
    ),

    // login
    AutoRoute(
      path: '/profileScreen',
      page: ProfileScreen,
      guards: [
        RouterAuthGuard,
      ],
    ),

    AutoRoute(
      path: '*',
      page: PageNotFoundScreen,
    ),
  ],
)
class $RootRouter {}
