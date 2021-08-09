import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_login_response_model.g.dart';

@JsonSerializable()
class PostLoginResponseModel extends Equatable {
  @JsonKey(name: 'token_id')
  final String? tokenId;

  @JsonKey(name: 'error_message')
  final String? errorMessage;

  const PostLoginResponseModel({
    required this.tokenId,
    this.errorMessage,
  });

  bool get isAuthenticated => tokenId != null;

  factory PostLoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PostLoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostLoginResponseModelToJson(this);

  @override
  List<Object> get props => [tokenId ?? '', errorMessage ?? ''];
}
