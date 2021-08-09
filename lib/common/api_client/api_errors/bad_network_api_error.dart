import 'package:dio/dio.dart';

class BadNetworkApiError extends DioError {
  final DioError dioError;

  BadNetworkApiError({
    required this.dioError,
  }) : super(requestOptions: dioError.requestOptions);
}
