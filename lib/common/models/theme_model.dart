import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'theme_model.g.dart';

@JsonSerializable()
class ThemeModel extends Equatable {
  final ThemeMode mode;

  final double brightness;

  const ThemeModel({
    @required this.mode,
    this.brightness,
  });

  factory ThemeModel.fromJson(Map<String, dynamic> json) =>
      _$ThemeModelFromJson(json);

  Map<String, dynamic> toJson() => _$ThemeModelToJson(this);

  @override
  List<Object> get props => [mode, brightness];
}
