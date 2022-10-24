import 'package:game_center/main.library.dart';

part 'game_filter_model.g.dart';

@CopyWith()
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class GameFilterModel extends Equatable {
  final String? search;
  final String? ordering;
  const GameFilterModel({this.search, this.ordering});

  factory GameFilterModel.fromJson(Map<String, dynamic> json) =>
      _$GameFilterModelFromJson(json);
  Map<String, dynamic> toJson() => _$GameFilterModelToJson(this);

  @override
  List<Object?> get props => [search, ordering];
}
