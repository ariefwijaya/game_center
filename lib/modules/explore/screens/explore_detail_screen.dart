import 'package:game_center/main.import.dart';
import 'package:game_center/main.library.dart';
import 'package:game_center/modules/explore/models/game_model.dart';

import '../blocs/blocs.dart';

class ExploreDetailScreen extends StatelessWidget {
  final int id;
  const ExploreDetailScreen({Key? key, @pathParam required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt.get<ExploreGameDetailBloc>()..add(ExploreGameDetailFetched(id)),
      child: BlocBuilder<ExploreGameDetailBloc, ExploreGameDetailState>(
        builder: (context, state) {
          if (state is ExploreGameDetailFailure) {
            return _buildFailure(context);
          }

          if (state is ExploreGameDetailSucess) {
            return _buildSuccess(context, data: state.data);
          }

          return _buildLoading();
        },
      ),
    );
  }

  Widget _buildSuccess(BuildContext context, {required GameModel data}) {
    return Scaffold(
      appBar: AppBar(),
    );
  }

  Widget _buildFailure(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TypographyCustom.heading.h3(LocaleKeys.detail_game_title.tr()),
      ),
      body: SectionPlaceholder.medium(
        title: LocaleKeys.explore_failed_title.tr(),
        description: LocaleKeys.explore_failed_subtitle.tr(),
        primaryButtonText: LocaleKeys.explore_failed_retry.tr(),
        onPrimaryButtonTapped: () => context
            .read<ExploreGameDetailBloc>()
            .add(ExploreGameDetailFetched(id)),
      ),
    );
  }

  Widget _buildLoading() {
    return Scaffold(
      appBar: AppBar(
        title: TypographyCustom.heading.h3(LocaleKeys.detail_game_title.tr()),
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
