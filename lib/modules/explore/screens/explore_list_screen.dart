import 'package:game_center/main.import.dart';
import 'package:game_center/main.library.dart';
import 'package:game_center/modules/explore/models/game_filter_model.dart';
import 'package:game_center/modules/explore/models/game_model.dart';
import 'package:game_center/modules/explore/screens/components/components.dart';
import '../blocs/blocs.dart';

class ExploreListScreen extends StatelessWidget {
  final String? order;
  final String? genres;
  const ExploreListScreen(
      {Key? key, @queryParam this.order, @queryParam this.genres})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TypographyCustom.heading.h3(LocaleKeys.explore_games_title.tr()),
      ),
      body: BlocProvider(
        create: (context) => getIt.get<ExploreGamesBloc>()
          ..add(ExploreGamesStarted(
              defaultFilter: GameFilterModel(ordering: order, genres: genres))),
        child: BlocBuilder<ExploreGamesBloc, ExploreGamesState>(
          builder: (context, state) {
            final pagingController =
                context.read<ExploreGamesBloc>().pagingController;
            return RefreshIndicator(
              onRefresh: () => Future.sync(() => pagingController.refresh()),
              child: PagedListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  pagingController: pagingController,
                  builderDelegate: PagedChildBuilderDelegate<GameModel>(
                    itemBuilder: (context, entry, index) {
                      return GameListCard(data: entry);
                    },
                    firstPageErrorIndicatorBuilder: (context) =>
                        SectionPlaceholder.large(
                            title: LocaleKeys.explore_failed_title.tr(),
                            description:
                                LocaleKeys.explore_failed_subtitle.tr(),
                            onPrimaryButtonTapped: () {
                              pagingController.refresh();
                            },
                            primaryButtonText:
                                LocaleKeys.explore_failed_retry.tr()),
                    newPageProgressIndicatorBuilder: (context) =>
                        GameListCard.loader(),
                    firstPageProgressIndicatorBuilder: (ctx) => Column(
                      children: List.generate(
                          6,
                          (index) => Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                child: GameListCard.loader(),
                              )),
                    ),
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10)),
            );
          },
        ),
      ),
    );
  }
}
