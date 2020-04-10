import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

enum AlertsTypeEnum {
  ERROR,
  WARNING,
  INFO,
  SUCCESS,
}

enum AlertsPopupEnum {
  FLUSHBAR,
  WIDGET,
}

class AlertsModel {
  final String body;
  final String title;
  final AlertsTypeEnum type;
  final AlertsPopupEnum popupType;
  final BuildContext context;

  final int generatedTime = DateTime.now().microsecondsSinceEpoch;
  Duration duration;

  AlertsModel({
    @required this.context,
    @required this.body,
    @required this.title,
    @required this.popupType,
    @required this.type,
    this.duration,
  }) {
    setDuration(duration);
  }

  void setDuration(Duration _duration) {
    duration = _duration ?? const Duration(seconds: 3);
  }
}
