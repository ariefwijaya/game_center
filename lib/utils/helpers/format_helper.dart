import 'package:easy_localization/easy_localization.dart';

import '../../core/app_setting.dart';

class FormatHelper {
  FormatHelper._();

  static String formatNumberDecimal(num number, {String? locale}) {
    return NumberFormat("#,##0.####", locale).format(number);
  }

  static String formatCurrency(
    num number, {
    String? locale,
    String? symbol,
    int decimalDigits = 0,
  }) {
    return NumberFormat.currency(
      locale: locale ?? AppSetting.defaultIsoCode,
      symbol: symbol ?? AppSetting.currencySymbol,
      decimalDigits: decimalDigits,
    ).format(number);
  }

  static String formatCurrencyCompact(num number,
      {String? locale, String? symbol, int decimalDigits = 2}) {
    return NumberFormat.compactCurrency(
            locale: locale ?? AppSetting.defaultIsoCode,
            symbol: symbol ?? AppSetting.currencySymbol,
            decimalDigits: decimalDigits)
        .format(number);
  }

  static String formatTimeOffsetDuration(Duration duration,
      {bool withSeconds = false, bool withHour = true, bool useSymbol = true}) {
    String _twoDigits(int n) {
      return n.abs().toString().padLeft(2, "0");
    }

    final String twoDigitMinutes = _twoDigits(duration.inMinutes.remainder(60));
    final String twoDigitHours = _twoDigits(duration.inHours.remainder(60));

    String prefix = "+";
    if (duration.isNegative) {
      prefix = "-";
    }

    if (!useSymbol) {
      prefix = "";
    }

    String digitHours = "";
    if (withHour) {
      digitHours = "$twoDigitHours:";
    }

    String twoDigitSeconds = "";
    if (withSeconds) {
      twoDigitSeconds = ":${_twoDigits(duration.inSeconds.remainder(60))}";
    }

    return "$prefix$digitHours$twoDigitMinutes$twoDigitSeconds";
  }
}

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${substring(1)}';
  String get allInCaps => toUpperCase();
  String get capitalizeFirstofEach =>
      split(" ").map((str) => str.capitalizeFirst).join(" ");
  String get capitalizeFirst => "${this[0].toUpperCase()}${substring(1)}";
}

extension HexString on String {
  int get hexValue => int.parse(replaceAll('#', '0xff'));
}
