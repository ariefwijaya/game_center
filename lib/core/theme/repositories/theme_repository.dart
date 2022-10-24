import 'package:game_center/config/themes/theme_config.dart';
import 'package:game_center/core/app_setting.dart';
import 'package:game_center/core/theme/repositories/theme_repository_interface.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/theme_model.dart';

@Injectable(as: ThemeRepositoryInterface)
class ThemeRepository implements ThemeRepositoryInterface {
  final SharedPreferences sharedPreferences;
  const ThemeRepository({required this.sharedPreferences});
  @override
  Future<ThemeModel> getSelectedTheme() async {
    final selected = sharedPreferences.getString('selected_theme');
    if (selected == null) {
      return const ThemeModel(name: AppSetting.defaultTheme);
    }

    try {
      return ThemeModel.fromJson({"name": selected});
    } catch (e) {
      return const ThemeModel(name: AppSetting.defaultTheme);
    }
  }

  @override
  Future<void> setTheme(AppTheme theme) {
    return sharedPreferences.setString("selected_theme", theme.name);
  }
}
