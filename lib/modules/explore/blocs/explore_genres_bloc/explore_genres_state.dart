part of 'explore_genres_bloc.dart';

abstract class ExploreGenresState extends Equatable {
  const ExploreGenresState();

  @override
  List<Object> get props => [];
}

class ExploreGenresInitial extends ExploreGenresState {}

class ExploreGenresLoading extends ExploreGenresState {}

class ExploreGenresFailure extends ExploreGenresState {
  final Object error;
  final StackTrace stackTrace;

  const ExploreGenresFailure({required this.error, required this.stackTrace});
  @override
  List<Object> get props => [error, stackTrace];
}

class ExploreGenresSucess extends ExploreGenresState {
  final List<GameAttrModel> listData;

  const ExploreGenresSucess({required this.listData});
  @override
  List<Object> get props => [listData];
}
