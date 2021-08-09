import 'package:dio/dio.dart';
import 'package:flutter_mobx_dio_boilerplate/common/api_client/api_errors/internal_server_api_error.dart';

class InternalServerErrorInterceptor extends Interceptor {
  @override
  Future onError(DioError _dioError, ErrorInterceptorHandler handler) async {
    if (_dioError.response != null) {
      if (_dioError.response!.statusCode != null &&
          _dioError.response!.statusCode! >= 500 &&
          _dioError.response!.statusCode! < 600) {
        return InternalServerApiError(
          dioError: _dioError,
        );
      }
    }

    return null;
  }
}
