part of 'errlytics_bloc.dart';

abstract class ErrlyticsEvent extends Equatable {
  const ErrlyticsEvent();

  @override
  List<Object> get props => [];
}

class ErrlyticsAddLog extends ErrlyticsEvent {
  final Report log;
  const ErrlyticsAddLog(this.log);

  @override
  List<Object> get props => [log];
}

class ErrlyticsGetList extends ErrlyticsEvent {}

class ErrlyticsClearAll extends ErrlyticsEvent {}
