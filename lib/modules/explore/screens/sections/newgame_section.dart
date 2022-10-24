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
        ..add(const ExploreGameListFetched(
            GameFilterModel(ordering: "released"))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TypographyCustom.heading
                        .h4(LocaleKeys.home_section_new.tr())),
              ),
              const SizedBox(width: 10),
              NudeButton.medium(
                  infiniteWidth: false,
                  buttonText: LocaleKeys.home_section_seeall.tr(),
                  onPressed: () {
                    context.pushRoute(const ExploreListRoute());
                  })
            ],
          ),
          const SizedBox(height: 15),
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
        children: List.generate(5, (index) => AttributeCard.loader()).toList(),
      ),
    );
  }

  Widget _buildFailed(BuildContext context) {
    return SectionPlaceholder.small(
        title: LocaleKeys.explore_failed_title.tr(),
        primaryButtonText: LocaleKeys.explore_failed_retry.tr(),
        onPrimaryButtonTapped: () {
          context.read<ExploreGameDetailBloc>().add(
              const ExploreGameListFetched(
                  GameFilterModel(ordering: "released")));
        });
  }

  Widget _buildSuccess(BuildContext context,
      {required List<GameModel> listData}) {
    return Container(
      height: 400,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GameCard(data: listData[index]),
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: listData.length),
    );
  }
}
