import 'package:game_center/core/core.dart';
import 'package:game_center/main.library.dart';
import 'package:game_center/modules/explore/models/models.dart';

import '../../repositories/explore_repository_interface.dart';

part 'explore_game_detail_event.dart';
part 'explore_game_detail_state.dart';

@injectable
class ExploreGameDetailBloc
    extends Bloc<ExploreGameDetailEvent, ExploreGameDetailState> {
  final ExploreRepositoryInterface exploreRepository;
  ExploreGameDetailBloc({required this.exploreRepository})
      : super(ExploreGameDetailInitial()) {
    on<ExploreGameDetailFetched>((event, emit) async {
      try {
        emit(ExploreGameDetailLoading());
        final res = await exploreRepository.getDetailGame(id: event.id);
        final screenshot =
            await exploreRepository.getScreenshotGame(id: event.id);
        final data = res.copyWith(screenshots: screenshot);
        emit(ExploreGameDetailSucess(data: data));
      } catch (e, s) {
        emit(ExploreGameDetailFailure(error: e, stackTrace: s));
      }
    });

    on<ExploreGameListFetched>((event, emit) async {
      try {
        emit(ExploreGameDetailLoading());
        final res = await exploreRepository.getListGames(
            filter: event.filter,
            pagination: const FilterPaginationModel(
                pageOffset: 0, pageSize: 10, page: 1));
        emit(ExploreGameListSuccess(listData: res));
      } catch (e, s) {
        emit(ExploreGameDetailFailure(error: e, stackTrace: s));
      }
    });
  }
}
