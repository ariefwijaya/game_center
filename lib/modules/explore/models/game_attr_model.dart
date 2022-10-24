import 'package:game_center/main.library.dart';

part 'game_attr_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GameAttrModel extends Equatable {
  final int id;
  final String name;
  final String? imageBackground;
  const GameAttrModel(
      {required this.id, required this.name, this.imageBackground});

  factory GameAttrModel.fromJson(Map<String, dynamic> json) =>
      _$GameAttrModelFromJson(json);
  Map<String, dynamic> toJson() => _$GameAttrModelToJson(this);

  @override
  List<Object?> get props => [id, name, imageBackground];
}
