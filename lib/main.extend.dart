import 'package:alice/alice.dart';
import 'package:game_center/config/injectable/injectable_core.dart';
import 'package:game_center/constant/app_constant.dart';
import 'package:game_center/core/app_setting.dart';
import 'package:game_center/core/errlytics/blocs/errlytics/errlytics_bloc.dart';
import 'package:game_center/env/env.dart';
import 'package:game_center/utils/services/rest_api_service/rest_api_client.dart';
import 'package:catcher/catcher.dart';
import 'package:catcher/model/platform_type.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

///Setup All Services configuration for the first time
Future setupConfiguration() async {
  // only for manual build, for QA automation test only
  // if (!kReleaseMode) {
  //   enableFlutterDriverExtension();
  // }
  //required to ensure flutter has been initialized first
  WidgetsFlutterBinding.ensureInitialized();

  // SystemChrome.setSystemUIOverlayStyle(
  //     SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await Hive.initFlutter();

  await EasyLocalization.ensureInitialized();

  await configureDependencies();
  if (AppSetting.showLog) {
    setupAlice();
  }
  await setupRestApiClient();
  setupBlocObserver();
}

Future<void> setupRestApiClient() {
  final RestApiClient restApiClient = RestApiClient();
  return restApiClient.addRequiredInterceptor();
}

Widget _setupLocalization(Widget child) {
  return EasyLocalization(
      supportedLocales: AppSetting.supportedLanguageList
          .map<Locale>((e) => e.toLocale())
          .toList(),
      path: AppConstant.localizationDir,
      assetLoader: currentEnv == "prod"
          ? SmartNetworkAssetLoader(
              timeout: const Duration(seconds: 2),
              assetsPath: AppConstant.localizationDir,
              localeUrl: (String localeName) => Env.localizationUrl)
          : const RootBundleAssetLoader(),
      startLocale: AppSetting.defaultLanguage.toLocale(),
      fallbackLocale: AppSetting.defaultLanguage.toLocale(),
      useOnlyLangCode: true,
      child: child);
}

Future<void> setupReporter(Widget child) async {
  final CatcherOptions debugOptions = CatcherOptions(
      SilentReportMode(), [ConsoleHandler(), InspectorHandler()]);
  final CatcherOptions releaseOptions = CatcherOptions(
      SilentReportMode(),
      [
        if (AppSetting.showLog) InspectorHandler(),
      ],
      reportOccurrenceTimeout: 4000);

  Catcher(
      rootWidget: _setupLocalization(child),
      navigatorKey: GlobalKey<NavigatorState>(),
      debugConfig: debugOptions,
      releaseConfig: releaseOptions);
}

void setupAlice() {
  final Alice alice = Alice(showNotification: false);
  getIt.registerLazySingleton<Alice>(() => alice);
}

void setupBlocObserver() {
  if (kDebugMode && AppSetting.showLog) {
    Bloc.observer = SimpleBlocObserver();
  } else if (kReleaseMode) {
    Bloc.observer = ErrorBlocObserver();
  }
}

//To catch any unknown error in bloc
class ErrorBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    final stateValue = '${change.nextState}'.toLowerCase();
    if (stateValue.contains("failed(") || stateValue.contains("failure(")) {
      try {
        final errorState = (change.nextState as Equatable).props;
        if (errorState.isNotEmpty) {
          Catcher.reportCheckedError(errorState.first, errorState.last);
        }
      } catch (e, s) {
        Catcher.reportCheckedError(e, s);
      }
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    Catcher.reportCheckedError(error, stackTrace);
    super.onError(bloc, error, stackTrace);
  }
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    // ignore: avoid_print
    print('${bloc.runtimeType} $change');
    final stateValue = '${change.nextState}'.toLowerCase();
    if (stateValue.contains("failed(") || stateValue.contains("failure(")) {
      try {
        final errorState = (change.nextState as Equatable).props;
        if (errorState.isNotEmpty) {
          Catcher.reportCheckedError(errorState.first, errorState.last);
        }
      } catch (e, s) {
        Catcher.reportCheckedError(e, s);
      }
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    // ignore: avoid_print
    print('${bloc.runtimeType} $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // ignore: avoid_print
    print('${bloc.runtimeType} $error $stackTrace');
    Catcher.reportCheckedError(error, stackTrace);
    super.onError(bloc, error, stackTrace);
  }
}

class InspectorHandler extends ReportHandler {
  final bool enableDeviceParameters;
  final bool enableApplicationParameters;
  final bool enableCustomParameters;

  final errlyticsBloc = getIt.get<ErrlyticsBloc>();

  InspectorHandler(
      {this.enableDeviceParameters = true,
      this.enableApplicationParameters = true,
      this.enableCustomParameters = true});

  @override
  List<PlatformType> getSupportedPlatforms() {
    return [PlatformType.android, PlatformType.iOS, PlatformType.web];
  }

  @override
  Future<bool> handle(Report error, BuildContext? context) async {
    try {
      errlyticsBloc.add(ErrlyticsAddLog(error));
      return true;
    } catch (exception) {
      return true;
    }
  }
}
