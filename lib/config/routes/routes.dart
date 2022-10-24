import 'package:game_center/core/errlytics/screens/errlytics_screen.dart';
import 'package:game_center/main.library.dart';
import 'package:game_center/main.import.dart';
import 'package:game_center/modules/explore/explore.dart';
import 'package:game_center/modules/onboarding/onboarding.dart';
import 'package:game_center/modules/splash/splash.dart';

part 'routes.gr.dart';

// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
//@MaterialAutoRouter
@CupertinoAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(path: "/errlytics", page: ErrlyticsScreen),
    AutoRoute(path: "/splash-screen", page: SplashScreen),
    AutoRoute(path: "/onboarding", page: OnboardingScreen),
    //legacy things
    AutoRoute(
        path: "/explore",
        name: "ExploreRouter",
        page: ExploreWrapperScreen,
        children: [
          AutoRoute(path: '', page: ExploreScreen),
          AutoRoute(path: 'list', page: ExploreListScreen),
          AutoRoute(path: 'detail/:id', page: ExploreDetailScreen),
          AutoRoute(path: 'search', page: ExploreSearchScreen),
        ]),
    RedirectRoute(path: '*', redirectTo: '/splash-screen'),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter();
}
