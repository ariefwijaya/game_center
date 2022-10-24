import 'package:game_center/core/core.dart';
import 'package:game_center/main.library.dart';
import 'package:game_center/modules/explore/models/game_attr_model.dart';
import '../../repositories/explore_repository_interface.dart';

part 'explore_genres_event.dart';
part 'explore_genres_state.dart';

@injectable
class ExploreGenresBloc extends Bloc<ExploreGenresEvent, ExploreGenresState> {
  final ExploreRepositoryInterface exploreRepository;
  ExploreGenresBloc({required this.exploreRepository})
      : super(ExploreGenresInitial()) {
    on<ExploreGenresFetched>((event, emit) async {
      try {
        emit(ExploreGenresLoading());
        final res = await exploreRepository.getListGenres(
            pagination: const FilterPaginationModel(
                pageOffset: 0, pageSize: 5, page: 1));
        emit(ExploreGenresSucess(listData: res));
      } catch (e, s) {
        emit(ExploreGenresFailure(error: e, stackTrace: s));
      }
    });
  }
}
