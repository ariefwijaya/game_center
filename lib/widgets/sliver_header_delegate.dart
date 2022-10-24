import 'package:game_center/main.import.dart';

class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double maxExtentOv;
  final double minExtentOv;

  const SliverHeaderDelegate(
      {required this.child,
      required this.maxExtentOv,
      required this.minExtentOv});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
        decoration: BoxDecoration(
            boxShadow: [if (overlapsContent) Theme.of(context).shadow1]),
        child: Center(child: child));
  }

  @override
  double get maxExtent => maxExtentOv;

  @override
  double get minExtent => minExtentOv;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
