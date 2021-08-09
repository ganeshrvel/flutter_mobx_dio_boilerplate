import 'package:flutter/material.dart';
import 'package:flutter_mobx_dio_boilerplate/common/di/di.dart';
import 'package:flutter_mobx_dio_boilerplate/common/helpers/navigation_helper.dart';
import 'package:flutter_mobx_dio_boilerplate/common/router/router.gr.dart';
import 'package:flutter_mobx_dio_boilerplate/constants/strings.dart';
import 'package:flutter_mobx_dio_boilerplate/features/login/ui/store/login_store.dart';
import 'package:flutter_mobx_dio_boilerplate/features/splash/ui/widgets/splash_loading.dart';
import 'package:flutter_mobx_dio_boilerplate/utils/common/store_helper.dart';
import 'package:flutter_mobx_dio_boilerplate/widget_extends/sf_widget.dart';
import 'package:mobx/mobx.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends SfWidget<SplashScreen> {
  LoginStore get _loginStore => getIt<LoginStore>();

  late final List<ReactionDisposer> _disposers;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _disposers = [
      reaction(
        (_) => _loginStore.isLoggedIn,
        (bool? isLoggedIn) {
          if (getCurrentScreen(context) != SplashScreenRoute.name) {
            return;
          }

          handleIsLoggedIn(isLoggedIn: isLoggedIn);
        },
      ),
    ];
  }

  @override
  Future<void> onInitApp() async {
    await _loginStore.getAuthentication(context);

    return super.onInitApp();
  }

  void handleIsLoggedIn({bool? isLoggedIn}) {
    navigateToHomeScreen(routeArgs: null);
  }

  Widget buildFirstScreen(BuildContext context) {
    return const SplashLoading(
      title: Strings.APP_NAME,
    );
  }

  @override
  void dispose() {
    disposeStore(_disposers);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildFirstScreen(context),
    );
  }
}
