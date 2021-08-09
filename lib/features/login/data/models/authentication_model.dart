import 'package:equatable/equatable.dart';
import 'package:flutter_mobx_dio_boilerplate/utils/common/functs.dart';
import 'package:json_annotation/json_annotation.dart';

part 'authentication_model.g.dart';

@JsonSerializable()
class AuthenticationModel extends Equatable {
  final String? tokenId;

  const AuthenticationModel({
    required this.tokenId,
  });

  bool get isAuthenticated => tokenId != null && isNotNullOrEmpty(tokenId);

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationModelToJson(this);

  @override
  List<Object> get props => [tokenId ?? ''];
}
