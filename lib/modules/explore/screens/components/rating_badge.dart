import 'package:game_center/main.import.dart';

class RatingBadge extends StatelessWidget {
  final double value;
  const RatingBadge({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8),
          borderRadius: BorderRadius.circular(7)),
      child: Row(
        children: [
          Icon(
            Icons.star,
            color: Theme.of(context).warning,
            size: 14,
          ),
          const SizedBox(width: 2),
          TypographyCustom.heading.h6(FormatHelper.formatNumberDecimal(value),
              color: Theme.of(context).warning)
        ],
      ),
    );
  }
}
