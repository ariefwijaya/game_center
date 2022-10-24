import 'package:envied/envied.dart';
part 'env.g.dart';

///Required Environment
///Available env params:
/// - `prod` for production
/// - `dev` for development
/// - `testing` for testing
const currentEnv = "dev";

@Envied(
    path: currentEnv == "prod"
        ? '.env.prod'
        : currentEnv == "dev"
            ? '.env.dev'
            : '.env.testing')
abstract class Env {
  @EnviedField(varName: 'APP_NAME')
  static const String appName = _Env.appName;
  @EnviedField(varName: 'SHOW_LOG')
  static const bool showLog = _Env.showLog;
  @EnviedField(varName: 'API_CONNECT_TIMEOUT')
  static const int apiConnectTimeout = _Env.apiConnectTimeout;
  @EnviedField(varName: 'API_RECEIVE_TIMEOUT')
  static const int apiReceiveTimeout = _Env.apiReceiveTimeout;
  @EnviedField(varName: 'DEFAULT_PAGINATION_LIMIT')
  static const int defaultPaginationLimit = _Env.defaultPaginationLimit;
  @EnviedField(varName: 'LOCALIZATION_URL')
  static const String localizationUrl = _Env.localizationUrl;
  @EnviedField(varName: 'URL_SERVICE')
  static const String urlService = _Env.urlService;
  @EnviedField(varName: 'API_KEY')
  static const String apiKey = _Env.apiKey;
}
