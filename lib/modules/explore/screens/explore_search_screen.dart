import 'package:game_center/main.import.dart';
import 'package:game_center/main.library.dart';

import '../blocs/blocs.dart';
import '../models/models.dart';
import 'components/components.dart';

class ExploreSearchScreen extends StatefulWidget {
  const ExploreSearchScreen({Key? key}) : super(key: key);

  @override
  State<ExploreSearchScreen> createState() => _ExploreSearchScreenState();
}

class _ExploreSearchScreenState extends State<ExploreSearchScreen> {
  late ExploreGamesBloc _exploreGamesBloc;

  @override
  void initState() {
    super.initState();
    _exploreGamesBloc = getIt.get<ExploreGamesBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CupertinoSearchTextField(
          style: Theme.of(context).textTheme.bodyText1,
          onChanged: (value) {
            if (_exploreGamesBloc.filter.search != value) {
              _exploreGamesBloc.add(ExploreGamesSearchStarted(query: value));
            }
          },
        ),
      ),
      body: BlocProvider(
        create: (context) => _exploreGamesBloc,
        child: BlocBuilder<ExploreGamesBloc, ExploreGamesState>(
          bloc: _exploreGamesBloc,
          builder: (context, state) {
            final pagingController =
                context.read<ExploreGamesBloc>().pagingController;
            return RefreshIndicator(
              onRefresh: () => Future.sync(() => pagingController.refresh()),
              child: PagedListView.separated(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
