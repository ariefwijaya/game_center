import 'package:game_center/main.import.dart';
import 'package:game_center/main.library.dart';
import 'package:game_center/modules/explore/screens/sections/category_section.dart';
import 'package:game_center/modules/explore/screens/sections/sections.dart';

import 'components/components.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: kToolbarHeight, bottom: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBar(
              placeholder: LocaleKeys.home_search_game.tr(),
              onTap: () {
                context.router.push(const ExploreListRoute());
              },
            ),
            const SizedBox(height: 20),
            const CategorySection(),
            const SizedBox(height: 20),
            const NewgameSection()
          ],
        ),
      ),
    );
  }
}
