import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_login_request_model.g.dart';

@JsonSerializable()
class PostLoginRequestModel extends Equatable {
  final String username;
  final String password;

  const PostLoginRequestModel({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() => _$PostLoginRequestModelToJson(this);

  @override
  List<Object> get props => throw [username, password];
}
