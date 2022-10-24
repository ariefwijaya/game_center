part of 'explore_game_detail_bloc.dart';

abstract class ExploreGameDetailState extends Equatable {
  const ExploreGameDetailState();

  @override
  List<Object> get props => [];
}

class ExploreGameDetailInitial extends ExploreGameDetailState {}

class ExploreGameDetailLoading extends ExploreGameDetailState {}

class ExploreGameDetailFailure extends ExploreGameDetailState {
  final Object error;
  final StackTrace stackTrace;

  const ExploreGameDetailFailure(
      {required this.error, required this.stackTrace});
  @override
  List<Object> get props => [error, stackTrace];
}

class ExploreGameDetailSucess extends ExploreGameDetailState {
  final GameModel data;

  const ExploreGameDetailSucess({required this.data});
  @override
  List<Object> get props => [data];
}

class ExploreGameListSuccess extends ExploreGameDetailState {
  final List<GameModel> listData;

  const ExploreGameListSuccess({required this.listData});
  @override
  List<Object> get props => [listData];
}
