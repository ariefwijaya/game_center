import 'package:game_center/main.library.dart';

part 'filter_pagination_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class FilterPaginationModel extends Equatable {
  final int pageOffset;
  final int pageSize;
  //pageIndex
  final int page;
  const FilterPaginationModel(
      {required this.pageOffset, required this.pageSize, required this.page});

  factory FilterPaginationModel.fromJson(Map<String, dynamic> json) =>
      _$FilterPaginationModelFromJson(json);
  Map<String, dynamic> toJson() => _$FilterPaginationModelToJson(this);

  @override
  List<Object?> get props => [pageOffset, pageSize, page];
}
