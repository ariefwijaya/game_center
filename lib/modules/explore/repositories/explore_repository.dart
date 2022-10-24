import 'package:game_center/constant/api_path.dart';
import 'package:game_center/main.library.dart';
import 'package:game_center/core/setting/models/filter_pagination_model.dart';
import 'package:game_center/modules/explore/models/models.dart';
import 'package:game_center/modules/explore/repositories/explore_repository_interface.dart';
import 'package:game_center/utils/services/rest_api_service/rest_api_interface.dart';

@Injectable(as: ExploreRepositoryInterface)
class ExploreRepository implements ExploreRepositoryInterface {
  final RestApiInterface restApi;
  const ExploreRepository({required this.restApi});
  @override
  Future<GameModel> getDetailGame({required int id}) async {
    final res = await restApi.get("${ApiPath.games}/$id");
    return GameModel.fromJson(res.data);
  }

  @override
  Future<List<GameModel>> getListGames(
      {required FilterPaginationModel pagination,
      GameFilterModel? filter}) async {
    final bodyParam = pagination.toJson();
    if (filter != null) {
      bodyParam.addAll(filter.toJson());
    }
    final res = await restApi.get(ApiPath.games, body: bodyParam);
    return (res.data['results'] as List<dynamic>)
        .map((e) => GameModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<GameAttrModel>> getListGenres(
      {required FilterPaginationModel pagination}) async {
    final bodyParam = pagination.toJson();
    final res = await restApi.get(ApiPath.genres, body: bodyParam);
    return (res.data['results'] as List<dynamic>)
        .map((e) => GameAttrModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<String>> getScreenshotGame({required int id}) async {
    final res = await restApi
        .get(ApiPath.screenshot(id), body: {"page": 1, "page_size": 10});
    return (res.data['results'] as List<dynamic>)
        .map((e) => e['image'] as String)
        .toList();
  }
}
