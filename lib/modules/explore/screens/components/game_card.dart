import 'package:flutter/material.dart';
import 'package:game_center/modules/explore/models/game_model.dart';
import 'package:game_center/widgets/widgets.dart';

class GameCard extends StatelessWidget {
  final GameModel data;
  const GameCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ImagePlaceholder(
            imageUrl: data.backgroundImage,
            height: 200,
            width: 200,
          ),
          const SizedBox(height: 10),
          TypographyCustom.heading.h5(data.name, maxLines: 2),
          const SizedBox(height: 15),
          TypographyCustom.subheading
              .medium(data.genres.first.name, maxLines: 1),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: data.releaseDate == null
                    ? TypographyCustom.subheading
                        .medium(DateTime.now().toString(), maxLines: 1)
                    : TypographyCustom.subheading
                        .medium(data.releaseDate.toString(), maxLines: 1),
              ),
              const SizedBox(width: 8),
              Container(
                child: TypographyCustom.heading.h3("90"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
