import 'package:game_center/core/errlytics/models/errlytics_log_model.dart';
import 'package:game_center/main.library.dart';

abstract class ErrlyticsRepositoryInterface {
  Future<List<ErrylticsLogModel>> saveErrorLog(Report log);
  Future<List<ErrylticsLogModel>> getLogsList();
  Future<List<ErrylticsLogModel>> clearLogs();
}
