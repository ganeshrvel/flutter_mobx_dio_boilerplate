import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// url: https://stackoverflow.com/questions/50322054/flutter-how-to-set-and-lock-screen-orientation-on-demand

/// Forces portrait-only mode application-wide
/// Use this Mixin on the main app widget i.e. app.dart
/// Flutter's 'App' has to extend Stateless widget.
///
/// Call `super.build(context)` in the main build() method
/// to enable portrait only mode
mixin PortraitModeMixin on StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _portraitModeOnly();

    return Container();
  }
}

/// Forces portrait-only mode on a specific screen
/// Use this Mixin in the specific screen you want to
/// block to portrait only mode.
///
/// Call `super.build(context)` in the State's build() method
/// and `super.dispose();` in the State's dispose() method
mixin PortraitStatefulModeMixin<T extends StatefulWidget> on State<T> {
  @override
  Widget build(BuildContext context) {
    _portraitModeOnly();

    return Container();
  }

  @override
  void dispose() {
    super.dispose();

    _enableRotation();
  }
}

/// blocks rotation; sets orientation to: portrait
void _portraitModeOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

void _enableRotation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
}

/// To block rotation in the entire app implement PortraitModeMixin in the main App widget. Remember to call super.build(context) in Widget build(BuildContext context) method.
/// Main App widget
//class App extends StatelessWidget with PortraitModeMixin {
//  const App();
//
//  @override
//  Widget build(BuildContext context) {
//    super.build(context);
//    return Material(
//      title: 'Flutter Demo',
//      theme: CupertinoThemeData(),
//      home: Textography("Block screen rotation example", variant: TextVariants.body1,),
//    );
//  }
//}
