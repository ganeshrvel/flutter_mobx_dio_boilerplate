import 'package:dio/dio.dart';
import 'package:flutter_mobx_dio_boilerplate/common/api_client/api_errors/api_error_message_error.dart';

class ApiErrorMessageInterceptor extends Interceptor {
  @override
  Future onResponse(Response response) async {
    if (response != null) {
      if (response.data != null) {
        final error = ApiErrorMessageError.fromJson(
          response.data as Map<String, dynamic>,
        );

        if (error.errorMessage != null) {
          return error;
        }
      }
    }

    return null;
  }
}
