import 'package:game_center/core/errlytics/models/errlytics_log_model.dart';
import 'package:game_center/core/errlytics/repositories/errlytics_repository_interface.dart';
import 'package:game_center/main.library.dart';

@Injectable(as: ErrlyticsRepositoryInterface)
class ErrlyticsRepository implements ErrlyticsRepositoryInterface {
  final String errLyticsBox = "errLyticsBoxTest";

  const ErrlyticsRepository();
  @override
  Future<List<ErrylticsLogModel>> getLogsList() async {
    final box = await Hive.openBox(errLyticsBox);
    final errLyticLogs = box.values
        .map((e) => ErrylticsLogModel.fromJson(e))
        .sorted((a, b) => b.dateTime.compareTo(a.dateTime));
    return errLyticLogs;
  }

  @override
  Future<List<ErrylticsLogModel>> saveErrorLog(Report log) async {
    final box = await Hive.openBox(errLyticsBox);
    ErrylticsLogModel logObj = ErrylticsLogModel(
        error: log.error.toString(),
        stackTrace: log.stackTrace.toString(),
        dateTime: log.dateTime,
        deviceParameters: log.deviceParameters,
        applicationParameters: log.applicationParameters,
        customParameters: log.customParameters,
        platformType: log.platformType);
    await box.add(logObj.toJson());
    final errLyticLogs =
        box.values.map((e) => ErrylticsLogModel.fromJson(e)).toList();
    return errLyticLogs;
  }

  @override
  Future<List<ErrylticsLogModel>> clearLogs() async {
    final box = await Hive.openBox(errLyticsBox);
    await box.clear();
    final errLyticLogs =
        box.values.map((e) => ErrylticsLogModel.fromJson(e)).toList();
    return errLyticLogs;
  }
}
