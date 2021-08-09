import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class FlushbarHelper {
  Flushbar buildSnackbar({
    BuildContext? context,
    required String title,
    required String message,
    bool? isDismissible,
    Duration? duration,
    Color? backgroundColor,
  }) {
    final _isDismissible = isDismissible ?? true;
    final _duration = duration ?? const Duration(seconds: 4);
    final _backgroundColor = backgroundColor ?? Colors.black;

    final _flushbarInstance = Flushbar(
      title: title,
      message: message,
      flushbarPosition: FlushbarPosition.BOTTOM,
      flushbarStyle: FlushbarStyle.FLOATING,
      backgroundColor: _backgroundColor,
      boxShadows: const [
        BoxShadow(
          color: Colors.black38,
          offset: Offset(0.0, 2.0),
          blurRadius: 3.0,
        )
      ],
      isDismissible: _isDismissible,
      duration: _duration,
    );

    if (context == null) {
      return _flushbarInstance;
    }

    return _flushbarInstance..show(context);
  }

  Flushbar buildErrorSnackbar({
    BuildContext? context,
    required String title,
    required String message,
    required Duration? duration,
  }) {
    return buildSnackbar(
      context: context,
      title: title,
      message: message,
      duration: duration,
    );
  }
}
