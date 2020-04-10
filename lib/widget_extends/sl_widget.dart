import 'package:flutter/widgets.dart';
import 'package:flutter_mobx_dio_boilerplate/common/di/di.dart';
import 'package:flutter_mobx_dio_boilerplate/utils/alerts/alerts_model.dart';
import 'package:flutter_mobx_dio_boilerplate/utils/alerts/alerts.dart';

abstract class SlWidget<S extends StatelessWidget> {
  Alerts get _alerts => getIt<Alerts>();

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
}
