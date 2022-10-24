import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:game_center/config/themes/theme_config.dart';
import 'package:game_center/core/app_setting.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'theme_model.g.dart';

@CopyWith()
@JsonSerializable(fieldRename: FieldRename.snake)
class ThemeModel {
  const ThemeModel({required this.name});

  @JsonKey(defaultValue: AppTheme.primaryLight)
  final AppTheme name;

  ThemeData toThemeData() {
    if (appThemeData[name] != null) {
      return appThemeData[name]!;
    } else {
      return appThemeData[AppSetting.defaultTheme]!;
    }
  }

  factory ThemeModel.fromJson(Map<String, dynamic> json) =>
      _$ThemeModelFromJson(json);
  Map<String, dynamic> toJson() => _$ThemeModelToJson(this);
}
