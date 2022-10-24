import 'package:game_center/core/app_setting.dart';
import 'package:game_center/core/language/repositories/language_repository_interface.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/language_model.dart';

@Injectable(as: LanguageRepositoryInterface)
class LanguageRepository implements LanguageRepositoryInterface {
  final SharedPreferences sharedPreferences;
  const LanguageRepository({required this.sharedPreferences});
  @override
  Future<LanguageModel> getSelectedLanguage() async {
    final lang = sharedPreferences.getString('language_code');
    if (lang == null) {
      return AppSetting.defaultLanguage;
    }

    try {
      final name = AppSetting.supportedLanguageList
          .firstWhere((element) => element.languageCode == lang)
          .name;
      return LanguageModel(languageCode: lang, name: name);
    } catch (e) {
      return AppSetting.defaultLanguage;
    }
  }

  @override
  Future<void> setLanguage(String languageCode) {
    return sharedPreferences.setString("language_code", languageCode);
  }
}
