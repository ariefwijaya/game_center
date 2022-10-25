import 'package:game_center/main.import.dart';
import 'package:game_center/main.library.dart';
import '../../models/models.dart';

import '../components/components.dart';

class GameDetailFragment extends StatelessWidget {
  final GameModel data;
  const GameDetailFragment({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 300,
          leading: Center(
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context)
                      .scaffoldBackgroundColor
                      .withOpacity(0.4)),
              child: const AutoLeadingButton(),
            ),
          ),
          flexibleSpace: Stack(
            children: [
              FlexibleSpaceBar(
                background: Stack(
                  alignment: Alignment.center,
                  children: [
                    ImagePlaceholder(imageUrl: data.backgroundImage),
                    Positioned.fill(
                        child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                            Theme.of(context).shadowColor.withOpacity(0.9),
                            Colors.transparent,
                            Colors.transparent
                          ])),
                    ))
                  ],
                ),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (data.metacritic != null)
                          MetacriticBadge(value: data.metacritic!),
                        const SizedBox(height: 8),
                        TypographyCustom.heading.h3(data.name),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: (data.releaseDate != null)
                                  ? TypographyCustom.subheading.medium(
                                      DateFormat("dd, MMM yyyy")
                                          .format(data.releaseDate!))
                                  : Container(),
                            ),
                            const SizedBox(width: 10),
                            RatingBadge(value: data.rating)
                          ],
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              if (data.screenshots.isNotEmpty)
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      itemBuilder: (context, index) => Container(
                            padding: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                                borderRadius: BorderRadius.circular(20)),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  context.router.pushWidget(ImageGalleryViewer(
                                    imageUrls: data.screenshots,
                                    initialIndex: index,
                                  ));
                                },
                                child: ImagePlaceholder(
                                  borderRadius: BorderRadius.circular(20),
                                  width: 100,
                                  imageUrl: data.screenshots[index],
                                ),
                              ),
                            ),
                          ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 10),
                      itemCount: data.screenshots.length),
                ),
              const SizedBox(height: 16),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.only(bottom: 40),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDescription(
                    title: LocaleKeys.detail_section_about.tr(),
                    description: data.description ?? ""),
                const SizedBox(height: 20),
                _buildAttribute(
                    title: LocaleKeys.detail_section_genres.tr(),
                    attributes: data.genres),
                const SizedBox(height: 20),
                _buildAttribute(
                    title: LocaleKeys.detail_section_platforms.tr(),
                    attributes: data.platforms),
                const SizedBox(height: 20),
                _buildAttribute(
                    title: LocaleKeys.detail_section_developers.tr(),
                    attributes: data.developers),
                const SizedBox(height: 20),
                _buildAttribute(
                    title: LocaleKeys.detail_section_publishers.tr(),
                    attributes: data.publishers)
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildDescription(
      {required String title, required String description}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TypographyCustom.heading.h4(title),
        const SizedBox(height: 12),
        TypographyCustom.bodyText.body2Medium(description,
            maxLines: 8, overflow: TextOverflow.ellipsis),
      ],
    );
  }

  Widget _buildAttribute(
      {required String title, required List<GameAttrModel> attributes}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TypographyCustom.heading.h4(title),
        const SizedBox(height: 12),
        Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          runSpacing: 8,
          spacing: 8,
          children: attributes.map((e) => AttributeCard(data: e.name)).toList(),
        )
      ],
    );
  }
}
