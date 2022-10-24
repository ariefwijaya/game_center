part of 'explore_games_bloc.dart';

abstract class ExploreGamesState extends Equatable {
  const ExploreGamesState();

  @override
  List<Object> get props => [];
}

class ExploreGamesInitial extends ExploreGamesState {}

class ExploreGamesFilterChanged extends ExploreGamesState {
  final GameFilterModel filter;
  const ExploreGamesFilterChanged({required this.filter});

  @override
  List<Object> get props => [filter];
}

class ExploreGamesFilterFailed extends ExploreGamesState {
  final Object error;
  final StackTrace stackTrace;
  const ExploreGamesFilterFailed(
      {required this.error, required this.stackTrace});

  @override
  List<Object> get props => [error, stackTrace];
}

class ExploreGamesRefreshed extends ExploreGamesState {
  @override
  List<Object> get props => [
        //Tricky things to allow bloc rebuild eventhough it has the same state values
        Random().nextInt(50)
      ];
}
