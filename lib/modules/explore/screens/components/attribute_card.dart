import 'package:game_center/main.import.dart';

class AttributeCard extends StatelessWidget {
  final String data;
  final String? image;
  final VoidCallback? onTap;
  const AttributeCard({Key? key, required this.data, this.image, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).disabledColor,
          borderRadius: BorderRadius.circular(30)),
      child: Material(
        borderRadius: BorderRadius.circular(30),
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(30),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (image != null)
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).textTheme.bodyText1!.color),
                    child: ImagePlaceholder(
                        height: 25,
                        width: 25,
                        shape: BoxShape.circle,
                        imageUrl: image),
                  ),
                if (image != null) const SizedBox(width: 8),
                TypographyCustom.bodyText.body2Bold(data),
              ],
            ),
          ),
        ),
      ),
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
