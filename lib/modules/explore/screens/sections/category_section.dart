import 'package:game_center/main.import.dart';
import 'package:game_center/main.library.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TypographyCustom.heading
                .h3(LocaleKeys.home_section_category.tr())),
        const SizedBox(height: 10),
        Wrap(direction: Axis.horizontal)
      ],
    );
  }
}
