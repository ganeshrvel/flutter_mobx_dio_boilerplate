import 'package:dio/dio.dart';
import 'package:flutter_mobx_dio_boilerplate/common/api_client/api_errors/unauthorized_api_error.dart';

class UnauthorizedInterceptor extends Interceptor {
  @override
  Future onError(DioError error, ErrorInterceptorHandler handler) async {
    if (error.response?.statusCode == 401 ||
        error.response?.statusCode == 403) {
      return UnauthorizedApiError(dioError: error);
    }

    return null;
  }
}
