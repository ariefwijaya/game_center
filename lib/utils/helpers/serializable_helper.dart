import 'package:game_center/utils/helpers/format_helper.dart';
import 'package:json_annotation/json_annotation.dart';

//Convert to local timezone from utc or either
class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();
  @override
  DateTime fromJson(String json) {
    final datecnv = DateTime.parse(json);
    if (datecnv.isUtc) {
      return datecnv.toLocal();
    } else {
      return datecnv;
    }
  }

  @override
  String toJson(DateTime object) {
    final toUtc = object.toUtc();
    final isoFormat = toUtc.toIso8601String();
    return isoFormat.replaceAll("Z", "") +
        FormatHelper.formatTimeOffsetDuration(toUtc.timeZoneOffset);
  }
}

class DateTimeNullableConverter implements JsonConverter<DateTime?, String?> {
  const DateTimeNullableConverter();
  @override
  DateTime? fromJson(String? json) {
    if (json != null) {
      final datecnv = DateTime.parse(json);
      if (datecnv.isUtc) {
        return datecnv.toLocal();
      } else {
        return datecnv;
      }
    } else {
      return null;
    }
  }

  @override
  String? toJson(DateTime? object) {
    if (object != null) {
      final toUtc = object.toUtc();
      final isoFormat = toUtc.toIso8601String();
      return isoFormat.replaceAll("Z", "") +
          FormatHelper.formatTimeOffsetDuration(toUtc.timeZoneOffset);
    } else {
      return null;
    }
  }
}

class ValidateImageConverter implements JsonConverter<String?, String?> {
  const ValidateImageConverter();
  @override
  String? fromJson(String? json) {
    if (json != null && (json.startsWith("http") || json.startsWith("https"))) {
      return json;
    } else {
      return null;
    }
  }

  @override
  String? toJson(String? json) => json;
}
