import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'user_model.g.dart';

@JsonSerializable(nullable: true)
class UserModel extends Equatable {
  @JsonKey(name: 'errorMessage')
  final String errorMessage;

  final int id;

  final String email;

  final String username;

  const UserModel({
    @required this.id,
    @required this.email,
    @required this.username,
    @required this.errorMessage,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  List<Object> get props => [errorMessage, id, email, username];
}
