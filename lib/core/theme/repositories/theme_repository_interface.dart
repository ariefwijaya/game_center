import 'package:game_center/config/themes/theme_config.dart';

import '../models/theme_model.dart';

abstract class ThemeRepositoryInterface {
  Future<ThemeModel> getSelectedTheme();

  Future<void> setTheme(AppTheme languageCode);
}
