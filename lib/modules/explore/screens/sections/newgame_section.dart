import 'package:game_center/main.import.dart';
import 'package:game_center/main.library.dart';
import 'package:game_center/modules/explore/blocs/blocs.dart';
import 'package:game_center/modules/explore/models/models.dart';
import 'package:game_center/modules/explore/screens/components/components.dart';

class NewgameSection extends StatelessWidget {
  const NewgameSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<ExploreGameDetailBloc>()
        ..add(ExploreGameListFetched(
            filter: GameFilterModel(ordering: _getFilter()?.ordering),
            size: 8)),
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
                      .h4(LocaleKeys.home_section_new.tr()),
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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Wrap(
        direction: Axis.horizontal,
        spacing: 12,
        children: List.generate(5, (index) => GameCard.loader()).toList(),
      ),
    );
  }

  Widget _buildFailed(BuildContext context) {
    return SectionPlaceholder.small(
        title: LocaleKeys.explore_failed_title.tr(),
        primaryButtonText: LocaleKeys.explore_failed_retry.tr(),
        onPrimaryButtonTapped: () {
          context
              .read<ExploreGameDetailBloc>()
              .add(ExploreGameListFetched(filter: _getFilter(), size: 8));
        });
  }

  Widget _buildSuccess(BuildContext context,
      {required List<GameModel> listData}) {
    return SizedBox(
      height: 295,
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GameCard(data: listData[index]),
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: listData.length),
    );
  }

  GameFilterModel? _getFilter() {
    return const GameFilterModel(ordering: "released,metacritic,rating");
  }
}
