part of 'explore_genres_bloc.dart';

abstract class ExploreGenresEvent extends Equatable {
  const ExploreGenresEvent();

  @override
  List<Object> get props => [];
}

class ExploreGenresFetched extends ExploreGenresEvent {}
