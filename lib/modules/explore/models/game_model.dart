import 'package:game_center/main.library.dart';
import 'package:game_center/modules/explore/models/game_attr_model.dart';

part 'game_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GameModel extends Equatable {
  final int id;
  final String name;
  final String? description;
  final String? backgroundImage;
  @JsonKey(defaultValue: [])
  final List<GameAttrModel> genres;
  @JsonKey(name: "released")
  final DateTime releaseDate;
  final double rating;
  final double metacritic;
  @JsonKey(defaultValue: [])
  final List<GameAttrModel> platforms;
  @JsonKey(defaultValue: [])
  final List<GameAttrModel> developers;
  @JsonKey(defaultValue: [])
  final List<GameAttrModel> publishers;
  const GameModel(
      {required this.id,
      required this.name,
      this.description,
      this.backgroundImage,
      required this.genres,
      required this.releaseDate,
      required this.rating,
      required this.metacritic,
      required this.platforms,
      required this.developers,
      required this.publishers});

  static List<GameAttrModel> _platformsFromJson(List<dynamic> data) {
    return data.map((e) => GameAttrModel.fromJson(e['platforms'])).toList();
  }

  factory GameModel.fromJson(Map<String, dynamic> json) =>
      _$GameModelFromJson(json);
  Map<String, dynamic> toJson() => _$GameModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        backgroundImage,
        genres,
        releaseDate,
        rating,
        metacritic,
        platforms,
        developers,
        publishers
      ];
}
