import '../config/themes/theme_config.dart';
import '../env/env.dart';
import 'language/models/language_model.dart';

/// The class where the centralized configuration is set.
/// This can be changed before built
class AppSetting {
  AppSetting._();

  /// This is Base URL for RestFul API
  static String get baseUrl => Env.urlService;

  /// Flag to show debug logs when its set to true
  static bool get showLog => Env.showLog;

  /// Maximum timeout when connect to Restful API
  static int get apiConnectTimeout => Env.apiConnectTimeout;

  /// Maximum timeout when receiving response from Restful API
  static int get apiReceiveTimeout => Env.apiReceiveTimeout;

  /// Default Size of pagination if not set
  static int get defaultPaginationLimit => Env.defaultPaginationLimit;

  /// Default language for this app localizations.
  /// Default to `id => Bahasa Indonesia`
  static final LanguageModel defaultLanguage = supportedLanguageList[0];

  /// List of available languanges in this app.
  /// TODO: [icon] should be used from firebase remote config
  static final List<LanguageModel> supportedLanguageList = <LanguageModel>[
    const LanguageModel(
        icon:
            "https://storage.googleapis.com/deductive-span-312606.appspot.com/game_center/icons/language/en.png",
        languageCode: 'en',
        name: 'English'),
    const LanguageModel(
        icon:
            "https://storage.googleapis.com/deductive-span-312606.appspot.com/game_center/icons/language/id.png",
        languageCode: 'id',
        name: 'Bahasa Indonesia')
  ];

  static const String currencySymbol = 'Rp ';

  static const String phoneCountryCode = '+62 ';

  /// Price format to show
  static const String defaultIsoCode = 'ID';

  /// Default theme Style for this app [AppTheme.primaryDark]
  static const AppTheme defaultTheme = AppTheme.primaryDark;
}
