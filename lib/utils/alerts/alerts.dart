import 'package:flushbar/flushbar.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_mobx_dio_boilerplate/common/helpers/flushbar_helper.dart';
import 'package:flutter_mobx_dio_boilerplate/utils/alerts/alerts_helper.dart';
import 'package:flutter_mobx_dio_boilerplate/utils/alerts/alerts_model.dart';

@lazySingleton
class Alerts {
  AlertsHelper alertsHelper;

  FlushbarHelper flushbarHelper;

  Alerts(this.alertsHelper, this.flushbarHelper);

  final List<AlertsModel> _alertsList = [];

  final List<Flushbar> _flushbarList = [];

  void setAlert(
    BuildContext context,
    String message, {
    String title,
    AlertsTypeEnum type,
    AlertsPopupEnum popupType,
    StackTrace stackTrace,
    Duration duration,
  }) {
    final alert = alertsHelper.getAlert(
      context,
      message,
      title: title,
      type: type,
      stackTrace: stackTrace,
      popupType: popupType,
      duration: duration,
    );

    _handleSetNewAlert(alert);
  }

  void setException(BuildContext context, Exception exception,
      {StackTrace stackTrace}) {
    final alert = alertsHelper.getException(
      context,
      exception,
      stackTrace: stackTrace,
    );

    _handleSetNewAlert(alert);
  }

  void removeAlert({int generatedTime, AlertsModel alert}) {
    if (generatedTime != null) {
      _alertsList.removeWhere((a) => a.generatedTime == generatedTime);

      return;
    }

    if (alert != null) {
      _alertsList.remove(alert);
    } else if (_alertsList.isNotEmpty) {
      _alertsList.removeAt(0);
    }
  }

  void _handleSetNewAlert(AlertsModel alert) {
    if (_alertsList.isEmpty) {
      _alertsList.add(alert);
    } else if (_alertsList.isNotEmpty) {
      _alertsList[0] = alert;
    }

    _handleAlertsListUpdate();
  }

  void _handleAlertsListUpdate() {
    for (var i = 0; i < _flushbarList.length; i++) {
      final item = _flushbarList[i];

      item.dismiss();

      _flushbarList.removeAt(i);
    }

    _showSnackbar();
  }

  Future<void> _showSnackbar() async {
    for (var i = 0; i < _alertsList.length; i++) {
      final item = _alertsList[i];

      await _buildSnackbar(item);
    }
  }

  Future<void> _buildSnackbar(
    AlertsModel alertItem,
  ) async {
    final _flushbarInstance = flushbarHelper.buildErrorSnackbar(
      message: alertItem.body,
      title: alertItem.title,
      duration: alertItem.duration,
    );

    final _activeAlertItem = _flushbarInstance;

    _flushbarList.add(_activeAlertItem);

    return _flushbarInstance
      ..onStatusChanged = (FlushbarStatus status) {
        switch (status) {
          case FlushbarStatus.DISMISSED:
            {
              _flushbarList.remove(_activeAlertItem);
              removeAlert(alert: alertItem);

              break;
            }
          case FlushbarStatus.SHOWING:
            break;
          case FlushbarStatus.IS_APPEARING:
            break;
          case FlushbarStatus.IS_HIDING:
            break;
        }
      }
      ..show(alertItem.context);
  }
}
