import 'package:game_center/core/setting/models/filter_pagination_model.dart';
import 'package:game_center/modules/explore/models/game_attr_model.dart';
import 'package:game_center/modules/explore/models/game_model.dart';

abstract class ExploreRepositoryInterface {
  Future<List<GameModel>> getListGames(
      {required FilterPaginationModel pagination,
      String? search,
      String? ordering});

  Future<List<GameAttrModel>> getListGenres(
      {required FilterPaginationModel pagination});

  Future<GameModel> getDetailGame({required int id});

  Future<List<String>> getScreenshotGame({required int id});
}
