part of 'explore_game_detail_bloc.dart';

abstract class ExploreGameDetailEvent extends Equatable {
  const ExploreGameDetailEvent();

  @override
  List<Object?> get props => [];
}

class ExploreGameDetailFetched extends ExploreGameDetailEvent {
  final int id;
  const ExploreGameDetailFetched(this.id);

  @override
  List<Object> get props => [id];
}

class ExploreGameListFetched extends ExploreGameDetailEvent {
  final GameFilterModel? filter;
  const ExploreGameListFetched([this.filter]);

  @override
  List<Object?> get props => [filter];
}
