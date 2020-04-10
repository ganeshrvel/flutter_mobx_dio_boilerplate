import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:flutter_mobx_dio_boilerplate/common/exceptions/exceptions.dart';
import 'package:flutter_mobx_dio_boilerplate/constants/errors.dart';
import 'package:flutter_mobx_dio_boilerplate/common/helpers/navigation_helper.dart';
import 'package:flutter_mobx_dio_boilerplate/services/crashes_service.dart';
import 'package:flutter_mobx_dio_boilerplate/utils/alerts/alerts_model.dart';
import 'package:flutter_mobx_dio_boilerplate/utils/log/log.dart';

@lazySingleton
class AlertsHelper {
  CrashesService crashesService;

  AlertsHelper(this.crashesService);

  AlertsModel getAlert(
    BuildContext context,
    String body, {
    String title,
    AlertsTypeEnum type,
    AlertsPopupEnum popupType,
    StackTrace stackTrace,
    Duration duration,
  }) {
    String _title;
    final _type = type ?? AlertsTypeEnum.ERROR;
    final _popupType = popupType ?? AlertsPopupEnum.FLUSHBAR;

    switch (_type) {
      case AlertsTypeEnum.INFO:
        _title = 'Info!';

        log.info(_title, error: body, stackTrace: stackTrace);
        break;
      case AlertsTypeEnum.WARNING:
        _title = 'Warning!';

        log.warn(_title, error: body, stackTrace: stackTrace);
        break;
      case AlertsTypeEnum.SUCCESS:
        _title = 'Great!';
        break;
      case AlertsTypeEnum.ERROR:
      default:
        _title = 'Oops... Some error occured!';

        log.error(_title, error: body, stackTrace: stackTrace);
        break;
    }

    return AlertsModel(
      context: context,
      body: body,
      title: _title,
      type: type,
      popupType: _popupType,
      duration: duration,
    );
  }

  AlertsModel getException(
    BuildContext context,
    Exception exception, {
    @required StackTrace stackTrace,
  }) {
    String _body;

    if (exception is BadNetworkException) {
      _body = Errors.BAD_NETWORK_MESSAGE;
    } else if (exception is UnauthenticatedException) {
      navigateToLogin(context);

      _body = Errors.INVALID_UNAUTHENTICATED_MESSAGE;
    } else if (exception is ApiException) {
      _body = Errors.INVALID_API_MESSAGE;
    } else if (exception is InternalServerException) {
      _body = Errors.INTERNAL_SERVER_MESSAGE;
    } else if (exception is CacheException) {
      _body = Errors.CACHE_FAILURE_MESSAGE;
    } else if (exception is ApiErrorMessageException &&
        exception.errorMessage != null) {
      _body = exception.errorMessage;
    } else {
      _body = Errors.UNKNOWN_FAILURE_MESSAGE;

      crashesService.nonFatalError(_body, stackTrace);
    }

    return getAlert(context, _body);
  }
}
