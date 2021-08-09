import 'package:dio/dio.dart';

class UnauthorizedApiError extends DioError {
  final DioError dioError;

  UnauthorizedApiError({
    required this.dioError,
  }) : super(requestOptions: dioError.requestOptions);
}
