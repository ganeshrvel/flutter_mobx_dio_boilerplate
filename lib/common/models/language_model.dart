import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'language_model.g.dart';

@JsonSerializable()
class LanguageModel extends Equatable {
  /// the country code (IT,AF..)
  final String countryCode;

  /// the locale (en, es, da)
  final String locale;

  /// the full name of language (English, Danish..)
  final String language;

  /// map of keys used based on industry type (service worker, route etc)
  final Map<String, String> dictionary;

  const LanguageModel({
    @required this.countryCode,
    @required this.locale,
    @required this.language,
    this.dictionary,
  });

  factory LanguageModel.fromJson(Map<String, dynamic> json) =>
      _$LanguageModelFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageModelToJson(this);

  @override
  List<Object> get props => [countryCode, locale, language, dictionary];
}
