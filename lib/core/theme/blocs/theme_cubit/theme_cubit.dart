import 'package:game_center/config/themes/theme_config.dart';
import 'package:game_center/core/app_setting.dart';
import 'package:equatable/equatable.dart';
import 'package:game_center/core/theme/repositories/theme_repository_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'theme_state.dart';

/// Persistent cubit to manage app theme changes
@injectable
class ThemeCubit extends Cubit<ThemeState> {
  final ThemeRepositoryInterface themeRepository;
  ThemeCubit({required this.themeRepository})
      : super(const ThemeState(AppSetting.defaultTheme));

  void changeTheme(AppTheme theme) => emit(ThemeState(theme));

  Future<void> changeSelection(AppTheme theme) async {
    await themeRepository.setTheme(theme);
    emit(ThemeState(theme));
  }

  Future<void> init() async {
    final lang = await themeRepository.getSelectedTheme();
    emit(ThemeState(lang.name));
  }
}
