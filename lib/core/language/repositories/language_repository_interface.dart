import '../models/language_model.dart';

abstract class LanguageRepositoryInterface {
  Future<LanguageModel> getSelectedLanguage();

  Future<void> setLanguage(String languageCode);
}
