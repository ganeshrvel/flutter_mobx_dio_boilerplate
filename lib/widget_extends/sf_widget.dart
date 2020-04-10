import 'package:flutter/material.dart';
import 'package:flutter_mobx_dio_boilerplate/common/di/di.dart';
import 'package:after_layout/after_layout.dart';
import 'package:flutter_mobx_dio_boilerplate/utils/alerts/alerts_model.dart';
import 'package:flutter_mobx_dio_boilerplate/utils/alerts/alerts.dart';

abstract class SfWidget<S extends StatefulWidget> extends State<S>
    with AfterLayoutMixin<S> {
  Alerts get _alerts => getIt<Alerts>();

  @protected
  @override
  @mustCallSuper
  void initState() {
    super.initState();
  }

  @override
  @override
  @mustCallSuper
  void didChangeDependencies() {
    super.didChangeDependencies();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      onWidgetUpdate();
    });
  }

  @protected
  @override
  Future<void> afterFirstLayout(BuildContext context) async {
    onInitApp();
  }

  @protected
  @override
  @mustCallSuper
  void dispose() {
    super.dispose();
  }

  @protected
  @mustCallSuper
  void throwException(
    BuildContext context,
    Exception exception, {
    StackTrace stackTrace,
  }) =>
      _alerts.setException(
        context,
        exception,
        stackTrace: stackTrace,
      );

  @protected
  @mustCallSuper
  void throwAlert(
    BuildContext context,
    String message, {
    String title,
    AlertsTypeEnum type,
    AlertsPopupEnum popupType,
    StackTrace stackTrace,
    Duration duration,
  }) =>
      _alerts.setAlert(
        context,
        message,
        title: title,
        type: type,
        stackTrace: stackTrace,
        popupType: popupType,
        duration: duration,
      );

  Future<void> onInitApp() async {}

  Future<void> onWidgetUpdate() async {}
}
