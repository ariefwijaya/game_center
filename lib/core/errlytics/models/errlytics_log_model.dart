import 'package:catcher/model/platform_type.dart';
import 'package:flutter/foundation.dart';

class ErrylticsLogModel {
  final String error;
  final String stackTrace;
  final DateTime dateTime;
  final Map<String, dynamic> deviceParameters;
  final Map<String, dynamic> applicationParameters;
  final Map<String, dynamic> customParameters;
  final PlatformType platformType;

  ErrylticsLogModel(
      {required this.error,
      required this.stackTrace,
      required this.dateTime,
      required this.deviceParameters,
      required this.applicationParameters,
      required this.customParameters,
      required this.platformType});

  factory ErrylticsLogModel.fromJson(dynamic data) {
    return ErrylticsLogModel(
        error: data['error'],
        stackTrace: data['stackTrace'],
        dateTime: DateTime.parse(data['dateTime']),
        deviceParameters: Map<String, dynamic>.from(data['deviceParameters']),
        applicationParameters:
            Map<String, dynamic>.from(data['applicationParameters']),
        customParameters: Map<String, dynamic>.from(data['customParameters']),
        platformType: PlatformType.values.firstWhere(
            (element) => describeEnum(element) == data['platformType']));
  }

  Map<String, dynamic> toJson() {
    return {
      "error": error.toString(),
      "stackTrace": stackTrace.toString(),
      "dateTime": dateTime.toIso8601String(),
      "deviceParameters": deviceParameters,
      "applicationParameters": applicationParameters,
      "customParameters": customParameters,
      "platformType": describeEnum(platformType)
    };
  }
}
