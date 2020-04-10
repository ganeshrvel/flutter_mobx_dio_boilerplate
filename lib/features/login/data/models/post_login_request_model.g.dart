// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_login_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostLoginRequestModel _$PostLoginRequestModelFromJson(
    Map<String, dynamic> json) {
  return PostLoginRequestModel(
    username: json['username'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$PostLoginRequestModelToJson(
        PostLoginRequestModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };
