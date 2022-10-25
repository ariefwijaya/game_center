import 'package:game_center/main.import.dart';
import 'package:game_center/main.library.dart';
import 'package:game_center/modules/explore/screens/components/metacritic_badge.dart';
import 'package:game_center/modules/explore/screens/components/rating_badge.dart';
import '../../models/models.dart';

class GameListCard extends StatelessWidget {
  final GameModel data;
  const GameListCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Theme.of(context).disabledColor),
      child: Material(
        borderRadius: BorderRadius.circular(25),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () {
            context.pushRoute(ExploreDetailRoute(id: data.id));
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Stack(
                  children: [
                    ImagePlaceholder(
                      height: 85,
                      width: 150,
                      borderRadius: BorderRadius.circular(20),
                      imageUrl: data.backgroundImage,
                    ),
                    if (data.metacritic != null)
                      Positioned(
                          left: 10,
                          top: 10,
                          child: MetacriticBadge(value: data.metacritic!))
                  ],
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TypographyCustom.heading.h5(data.name,
                        maxLines: 1, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 6),
                    if (data.genres.isNotEmpty)
                      TypographyCustom.subheading.medium(data.genres.first.name,
                          maxLines: 1, overflow: TextOverflow.ellipsis)
                    else
                      TypographyCustom.subheading.medium("",
                          maxLines: 1, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 7),
                    Row(
                      children: [
                        Expanded(
                          child: data.releaseDate == null
                              ? Container()
                              : TypographyCustom.subheading.medium(
                                  DateFormat("dd, MMM yyyy")
                                      .format(data.releaseDate!),
                                  maxLines: 1),
                        ),
                        const SizedBox(width: 8),
                        RatingBadge(value: data.rating)
                      ],
                    ),
                  ],
                ))
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
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Theme.of(context).disabledColor),
      child: Row(
        children: [
          const SkeletonLoaderSquare(width: 150, height: 85, roundedRadius: 20),
          const SizedBox(width: 10),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SkeletonLoaderSquare(width: double.infinity, height: 16),
              SizedBox(height: 6),
              SkeletonLoaderSquare(width: double.infinity, height: 14),
              SizedBox(height: 7),
              SkeletonLoaderSquare(width: double.infinity, height: 14),
            ],
          ))
        ],
      ),
    );
  }
}
