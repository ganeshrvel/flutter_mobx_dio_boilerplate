import 'package:dio/dio.dart';

class InternalServerApiError extends DioError {
  final DioError dioError;

  InternalServerApiError({
    required this.dioError,
  }) : super(requestOptions: dioError.requestOptions);
}
