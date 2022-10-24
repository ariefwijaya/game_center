import 'package:game_center/core/setting/models/filter_pagination_model.dart';
import 'package:game_center/modules/explore/models/models.dart';

abstract class ExploreRepositoryInterface {
  Future<List<GameModel>> getListGames(
      {required FilterPaginationModel pagination, GameFilterModel? filter});

  Future<List<GameAttrModel>> getListGenres(
      {required FilterPaginationModel pagination});

  Future<GameModel> getDetailGame({required int id});

  Future<List<String>> getScreenshotGame({required int id});
}
