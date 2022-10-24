import 'package:game_center/main.import.dart';
import 'package:game_center/main.library.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //We simulate the splashscreen only for UX purpose
    //We can use real logic such as authentication or assets preparation while showing splashscreen
    Future.delayed(const Duration(seconds: 2))
        .then((value) => context.replaceRoute(const OnboardingRoute()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Assets.images.gameCenterLogo.image(height: 250)),
          const SizedBox(height: 10),
          const LinearProgressIndicator(),
          const SizedBox(height: 10),
          TypographyCustom.heading.h1(Env.appName)
        ],
      ),
    );
  }
}
