import 'package:game_center/main.import.dart';
import 'package:game_center/main.library.dart';
import 'package:game_center/modules/explore/blocs/explore_genres_bloc/explore_genres_bloc.dart';
import 'package:game_center/modules/explore/models/game_attr_model.dart';
import 'package:game_center/modules/explore/screens/components/components.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt.get<ExploreGenresBloc>()..add(ExploreGenresFetched()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TypographyCustom.heading
                  .h4(LocaleKeys.home_section_category.tr())),
          const SizedBox(height: 15),
          BlocBuilder<ExploreGenresBloc, ExploreGenresState>(
            builder: (context, state) {
              if (state is ExploreGenresSucess) {
                return _buildSuccess(context, listData: state.listData);
              }

              if (state is ExploreGenresFailure) {
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
          context.read<ExploreGenresBloc>().add(ExploreGenresFetched());
        });
  }

  Widget _buildSuccess(BuildContext context,
      {required List<GameAttrModel> listData}) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Wrap(
        direction: Axis.horizontal,
        spacing: 12,
        children: listData.map((e) => AttributeCard(data: e.name)).toList(),
      ),
    );
  }
}
