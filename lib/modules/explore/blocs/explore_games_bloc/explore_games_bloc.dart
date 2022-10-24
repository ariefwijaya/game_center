import 'dart:math';

import 'package:game_center/main.import.dart';
import 'package:game_center/main.library.dart';
import 'package:game_center/modules/explore/models/models.dart';

import '../../repositories/explore_repository_interface.dart';

part 'explore_games_event.dart';
part 'explore_games_state.dart';

@injectable
class ExploreGamesBloc extends Bloc<ExploreGamesEvent, ExploreGamesState> {
  final ExploreRepositoryInterface exploreRepository;
  ExploreGamesBloc(this.exploreRepository) : super(ExploreGamesInitial()) {
    pagingController.addPageRequestListener(_fetchList);

    on<ExploreGamesFetched>((event, emit) async {
      try {
        final items = await exploreRepository.getListGames(
            filter: filter,
            pagination: FilterPaginationModel(
                page: (event.pageKey ~/ _pageSize) + 1,
                pageOffset: event.pageKey,
                pageSize: _pageSize));

        final isLastPage = items.length < _pageSize;
        if (isLastPage) {
          pagingController.appendLastPage(items);
        } else {
          final nextPageKey = event.pageKey + items.length;
          pagingController.appendPage(items, nextPageKey);
        }
      } catch (error, s) {
        pagingController.error = error;
        emit(ExploreGamesFilterFailed(error: error, stackTrace: s));
      }
    });

    on<ExploreGamesStarted>((event, emit) async {
      filter = event.defaultFilter ?? filter;
      pagingController.refresh();
      emit(ExploreGamesFilterChanged(filter: filter));
    });

    on<ExploreGamesChangeFilter>((event, emit) {
      filter = event.filter;
      pagingController.refresh();
      emit(ExploreGamesFilterChanged(filter: filter));
    });

    on<ExploreGamesSearchStarted>(
      (event, emit) {
        filter = filter.copyWith(search: event.query);
        pagingController.refresh();
        emit(ExploreGamesFilterChanged(filter: filter));
      },
      transformer: debounce(const Duration(milliseconds: 700)),
    );
  }

  // Variable Declaration
  // ====================
  final PagingController<int, GameModel> pagingController =
      PagingController(firstPageKey: 0);

  final int _pageSize = Env.defaultPaginationLimit;

  GameFilterModel filter = const GameFilterModel();

  EventTransformer<Event> debounce<Event>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }

  void _fetchList(int pageOffset) {
    add(ExploreGamesFetched(pageOffset));
  }

  @override
  Future<void> close() {
    pagingController.dispose();
    return super.close();
  }
}
