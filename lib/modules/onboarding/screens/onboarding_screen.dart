import 'package:game_center/main.import.dart';
import 'package:game_center/main.library.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Assets.images.onboarding.image(),
            const SizedBox(height: 50),
            TypographyCustom.heading.h4(LocaleKeys.onboarding1_title.tr(),
                textAlign: TextAlign.center),
            const SizedBox(height: 15),
            TypographyCustom.subheading.medium(
                LocaleKeys.onboarding1_subtitle.tr(),
                textAlign: TextAlign.center),
          ],
        ),
      ),
      bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
          child: FilledButton.large(
              centeredSuffixIcon: false,
              buttonText: LocaleKeys.onboarding_start.tr(),
              suffixIcon: const Icon(Icons.arrow_right_alt, size: 50),
              onPressed: () {
                context.replaceRoute(
                    const ExploreRouter(children: [ExploreRoute()]));
              })),
    );
  }
}
