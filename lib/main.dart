import 'dart:async';

import 'main.import.dart';
import 'main.library.dart';
import 'package:game_center/main.extend.dart';

Future<void> main() async {
  await setupConfiguration();
  setupReporter(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = getIt.get<AppRouter>();
    if (AppSetting.showLog) {
      getIt.get<Alice>().setNavigatorKey(router.navigatorKey);
    }
    return MultiBlocProvider(
        providers: [
          BlocProvider<ThemeCubit>(
              create: (context) => getIt.get<ThemeCubit>()..init()),
          BlocProvider<LanguageCubit>(
              create: (context) => getIt.get<LanguageCubit>()..init(context)),
          if (AppSetting.showLog)
            BlocProvider<ErrlyticsBloc>(
                create: (context) =>
                    getIt.get<ErrlyticsBloc>()..add(ErrlyticsGetList())),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, themeState) =>
              BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, langState) {
              return MaterialApp.router(
                routerDelegate:
                    router.delegate(initialDeepLink: const SplashRoute().path),
                routeInformationParser:
                    router.defaultRouteParser(includePrefixMatches: true),
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: langState.languageCode,
                theme: themeState.themeData.copyWith(
                    pageTransitionsTheme: const PageTransitionsTheme(builders: {
                  // replace default CupertinoPageTransitionsBuilder with this
                  TargetPlatform.iOS: NoShadowCupertinoPageTransitionsBuilder(),
                  TargetPlatform.android: ZoomPageTransitionsBuilder(),
                })),
                title: Env.appName,
                builder: (context, child) => GestureDetector(
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: AppSetting.showLog
                      ? Banner(
                          message: currentEnv.toUpperCase(),
                          location: BannerLocation.topStart,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            fit: StackFit.expand,
                            children: [child!, const BannerDebugCard()],
                          ))
                      : child!,
                ),
              );
            },
          ),
        ));
  }
}
