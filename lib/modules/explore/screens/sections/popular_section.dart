import 'package:game_center/main.import.dart';
import 'package:game_center/main.library.dart';
import 'package:game_center/modules/explore/blocs/blocs.dart';
import 'package:game_center/modules/explore/models/models.dart';
import 'package:game_center/modules/explore/screens/components/components.dart';

class PopularSection extends StatelessWidget {
  const PopularSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<ExploreGameDetailBloc>()
        ..add(ExploreGameListFetched(filter: _getFilter(), size: 5)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: TypographyCustom.heading
                      .h4(LocaleKeys.home_section_popular.tr()),
                ),
                const SizedBox(width: 5),
                NudeButton.medium(
                    infiniteWidth: false,
                    buttonText: LocaleKeys.home_section_seeall.tr(),
                    onPressed: () {
                      context.pushRoute(
                          ExploreListRoute(order: _getFilter()?.ordering));
                    })
              ],
            ),
          ),
          const SizedBox(height: 8),
          BlocBuilder<ExploreGameDetailBloc, ExploreGameDetailState>(
            builder: (context, state) {
              if (state is ExploreGameListSuccess) {
                return _buildSuccess(context, listData: state.listData);
              }

              if (state is ExploreGameDetailFailure) {
                return _buildFailed(context);
              }
              return _buildLoading();
            },
          )
        ],
      ),
    );
  }

  Widget _buildLoading() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: List.generate(
            3,
            (data) => Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: GameListCard.loader(),
                )).toList(),
      ),
    );
  }

  Widget _buildFailed(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SectionPlaceholder.small(
          title: LocaleKeys.explore_failed_title.tr(),
          primaryButtonText: LocaleKeys.explore_failed_retry.tr(),
          onPrimaryButtonTapped: () {
            context
                .read<ExploreGameDetailBloc>()
                .add(ExploreGameListFetched(filter: _getFilter(), size: 5));
          }),
    );
  }

  Widget _buildSuccess(BuildContext context,
      {required List<GameModel> listData}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: listData
            .map((data) => Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: GameListCard(data: data),
                ))
            .toList(),
      ),
    );
  }

  GameFilterModel? _getFilter() {
    return const GameFilterModel(ordering: "-metacritic");
  }
}
