import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'language_model.g.dart';

@CopyWith()
@JsonSerializable(fieldRename: FieldRename.snake)
class LanguageModel {
  const LanguageModel(
      {this.icon, required this.languageCode, required this.name});

  final String? icon;
  final String languageCode;
  final String name;

  String get localeTag {
    return languageCode;
  }

  Locale toLocale() {
    return Locale(languageCode, '');
  }

  factory LanguageModel.fromJson(Map<String, dynamic> json) =>
      _$LanguageModelFromJson(json);
  Map<String, dynamic> toJson() => _$LanguageModelToJson(this);
}
