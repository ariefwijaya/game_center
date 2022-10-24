import 'package:game_center/main.import.dart';

class MetacriticBadge extends StatelessWidget {
  final double value;
  const MetacriticBadge({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: _getColor(context)),
      child: TypographyCustom.heading.h4(value.toInt().toString()),
    );
  }

  Color _getColor(BuildContext context) {
    if (value >= 75) {
      return Theme.of(context).success;
    } else if (value >= 40 && value <= 74) {
      return Theme.of(context).warning;
    } else {
      return Theme.of(context).error;
    }
  }
}
