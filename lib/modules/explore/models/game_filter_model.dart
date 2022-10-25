import 'package:game_center/main.library.dart';

part 'game_filter_model.g.dart';

@CopyWith()
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class GameFilterModel extends Equatable {
  final String? search;
  final String? ordering;
  final String? genres;
  const GameFilterModel({this.search, this.ordering, this.genres});

  factory GameFilterModel.fromJson(Map<String, dynamic> json) =>
      _$GameFilterModelFromJson(json);
  Map<String, dynamic> toJson() => _$GameFilterModelToJson(this);

  @override
  List<Object?> get props => [search, ordering, genres];
}
