import 'package:game_center/main.import.dart';

class AttributeCard extends StatelessWidget {
  final String data;
  const AttributeCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
          color: Theme.of(context).disabledColor,
          borderRadius: BorderRadius.circular(30)),
      child: TypographyCustom.bodyText.body2Bold(data),
    );
  }

  static Widget loader() {
    return const _BuildLoader();
  }
}

class _BuildLoader extends StatelessWidget {
  const _BuildLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SkeletonLoaderSquare(
        width: 12 + 80, height: 15 + 16, roundedRadius: 30);
  }
}
