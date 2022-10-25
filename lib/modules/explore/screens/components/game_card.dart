import 'package:game_center/main.import.dart';
import 'package:game_center/main.library.dart';
import '../../models/models.dart';
import 'rating_badge.dart';
import 'metacritic_badge.dart';

class GameCard extends StatelessWidget {
  final GameModel data;
  const GameCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Theme.of(context).disabledColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                ImagePlaceholder(
                    imageUrl: data.backgroundImage,
                    height: 180,
                    width: 180,
                    borderRadius: BorderRadius.circular(25)),
                Positioned(
                    top: 10, right: 10, child: RatingBadge(value: data.rating))
              ],
            ),
            const SizedBox(height: 12),
            TypographyCustom.heading
                .h5(data.name, maxLines: 1, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 6),
            if (data.genres.isNotEmpty)
              TypographyCustom.subheading.medium(data.genres.first.name,
                  maxLines: 1, overflow: TextOverflow.ellipsis)
            else
              TypographyCustom.subheading
                  .medium("", maxLines: 1, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 7),
            Row(
              children: [
                Expanded(
                  child: data.releaseDate == null
                      ? Container()
                      : TypographyCustom.subheading.medium(
                          DateFormat("dd, MMM yyyy").format(data.releaseDate!),
                          maxLines: 1),
                ),
                const SizedBox(width: 8),
                if (data.metacritic != null)
                  MetacriticBadge(value: data.metacritic!)
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget loader() {
    return const _BuildLoader();
  }
}

class _BuildLoader extends StatefulWidget {
  const _BuildLoader({Key? key}) : super(key: key);

  @override
  State<_BuildLoader> createState() => __BuildLoaderState();
}

class __BuildLoaderState extends State<_BuildLoader> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Theme.of(context).disabledColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: const [
            SkeletonLoaderSquare(width: 180, height: 180, roundedRadius: 25),
            SizedBox(height: 12),
            SkeletonLoaderSquare(width: double.infinity, height: 16),
            SizedBox(height: 6),
            SkeletonLoaderSquare(width: double.infinity, height: 14),
            SizedBox(height: 7),
            SkeletonLoaderSquare(width: double.infinity, height: 14)
          ],
        ),
      ),
    );
  }
}
