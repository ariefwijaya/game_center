part of 'errlytics_bloc.dart';

abstract class ErrlyticsState extends Equatable {
  const ErrlyticsState();

  @override
  List<Object> get props => [];
}

class ErrlyticsInitial extends ErrlyticsState {}

class ErrlyticsLoading extends ErrlyticsState {}

class ErrlyticsLogList extends ErrlyticsState {
  final List<ErrylticsLogModel> list;

  const ErrlyticsLogList({required this.list});

  @override
  List<Object> get props => [list];
}

class ErrlyticsErrorException extends ErrlyticsState {
  final Object error;
  final StackTrace stackTrace;

  const ErrlyticsErrorException(
      {required this.error, required this.stackTrace});

  @override
  List<Object> get props => [error, stackTrace];
}
