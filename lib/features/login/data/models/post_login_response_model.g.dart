// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostLoginResponseModel _$PostLoginResponseModelFromJson(
        Map<String, dynamic> json) =>
    PostLoginResponseModel(
      tokenId: json['token_id'] as String?,
      errorMessage: json['error_message'] as String?,
    );

Map<String, dynamic> _$PostLoginResponseModelToJson(
        PostLoginResponseModel instance) =>
    <String, dynamic>{
      'token_id': instance.tokenId,
      'error_message': instance.errorMessage,
    };
