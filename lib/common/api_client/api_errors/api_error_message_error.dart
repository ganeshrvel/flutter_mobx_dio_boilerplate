import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'api_error_message_error.g.dart';

@JsonSerializable(nullable: true)
class ApiErrorMessageError extends DioError {
  @JsonKey(name: 'error_message')
  final String errorMessage;

  @override
  @JsonKey(ignore: true)
  RequestOptions request;

  @override
  @JsonKey(ignore: true)
  Response response;

  @override
  @JsonKey(ignore: true)
  DioErrorType type;

  @override
  @JsonKey(ignore: true)
  dynamic error;

  ApiErrorMessageError({
    @required this.errorMessage,
    this.request,
    this.response,
    this.type,
    this.error,
  });

  factory ApiErrorMessageError.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorMessageErrorFromJson(json);
}
