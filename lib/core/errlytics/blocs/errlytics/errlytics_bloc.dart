import 'package:game_center/core/errlytics/models/errlytics_log_model.dart';
import 'package:bloc/bloc.dart';
import 'package:catcher/model/report.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../repositories/errlytics_repository_interface.dart';

part 'errlytics_event.dart';
part 'errlytics_state.dart';

@lazySingleton
class ErrlyticsBloc extends Bloc<ErrlyticsEvent, ErrlyticsState> {
  final ErrlyticsRepositoryInterface errlyticsRepositoryInterface;
  ErrlyticsBloc(this.errlyticsRepositoryInterface) : super(ErrlyticsInitial()) {
    on<ErrlyticsAddLog>((event, emit) async {
      try {
        emit(ErrlyticsLoading());
        final errLyticsLog =
            await errlyticsRepositoryInterface.saveErrorLog(event.log);
        emit(ErrlyticsLogList(list: errLyticsLog));
      } catch (e, s) {
        emit(ErrlyticsErrorException(error: e, stackTrace: s));
      }
    });

    on<ErrlyticsGetList>((event, emit) async {
      try {
        emit(ErrlyticsLoading());
        final errLyticsLog = await errlyticsRepositoryInterface.getLogsList();
        emit(ErrlyticsLogList(list: errLyticsLog));
      } catch (e, s) {
        emit(ErrlyticsErrorException(error: e, stackTrace: s));
      }
    });

    on<ErrlyticsClearAll>((event, emit) async {
      try {
        emit(ErrlyticsLoading());
        final errLyticsLog = await errlyticsRepositoryInterface.clearLogs();
        emit(ErrlyticsLogList(list: errLyticsLog));
      } catch (e, s) {
        emit(ErrlyticsErrorException(error: e, stackTrace: s));
      }
    });
  }
}
