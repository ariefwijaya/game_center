part of 'explore_games_bloc.dart';

abstract class ExploreGamesEvent extends Equatable {
  const ExploreGamesEvent();

  @override
  List<Object?> get props => [];
}

class ExploreGamesFetched extends ExploreGamesEvent {
  final int pageKey;
  const ExploreGamesFetched(this.pageKey);

  @override
  List<Object> get props => [pageKey];
}

class ExploreGamesStarted extends ExploreGamesEvent {
  final GameFilterModel? defaultFilter;
  const ExploreGamesStarted({this.defaultFilter});

  @override
  List<Object?> get props => [defaultFilter];
}

class ExploreGamesChangeFilter extends ExploreGamesEvent {
  final GameFilterModel filter;
  const ExploreGamesChangeFilter({required this.filter});

  @override
  List<Object?> get props => [filter];
}

class ExploreGamesSearchStarted extends ExploreGamesEvent {
  final String query;
  const ExploreGamesSearchStarted({required this.query});

  @override
  List<Object?> get props => [query];
}
