import 'package:flutter/material.dart';

import 'light_theme.dart';

/// Enumeration of available themes in the app
///
/// [AppTheme.primaryLight] for Light Theme
/// or [AppTheme.primaryDark] for Dark/Night Theme
enum AppTheme {
  /// Key of light theme apps
  primaryLight,

  /// Key of Dark theme apps
  primaryDark
}

// The array of Theme Data that keep Available themes
final Map<AppTheme, ThemeData> appThemeData = {
  AppTheme.primaryLight: ThemeData(
      fontFamily: "NeutrifPro",
      scaffoldBackgroundColor: ColorLight.neutralWhite,
      backgroundColor: ColorLight.neutralWhite,
      primaryColor: ColorLight.tiger,
      focusColor: ColorLight.tiger,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: ColorLight.tiger,
        selectionColor: ColorLight.ashGrey,
        selectionHandleColor: ColorLight.tiger,
      ),
      brightness: Brightness.light,
      primaryColorDark: ColorLight.doffBlack,
      primaryColorLight: ColorLight.neutralWhite,
      splashColor: ColorLight.neutralWhite,
      errorColor: ColorLight.raspberry,
      disabledColor: ColorLight.ashGrey,
      canvasColor: Colors.white,
      // sliderTheme: SliderThemeData(
      //   activeTrackColor:
      // ),
      colorScheme: ColorScheme.light(
          secondary: ColorLight.doffBlack, primary: ColorLight.tiger),
      unselectedWidgetColor: ColorLight.borderShade,
      hintColor: ColorLight.borderShade,
      dividerColor: ColorLight.borderShade,
      switchTheme: SwitchThemeData(
          overlayColor: MaterialStateProperty.resolveWith((states) =>
              (states.contains(MaterialState.disabled))
                  ? ColorLight.torque
                  : ColorLight.ashGrey),
          trackColor: MaterialStateProperty.resolveWith((states) =>
              (states.contains(MaterialState.disabled))
                  ? ColorLight.doffBlack.withOpacity(0.5)
                  : Colors.white)),
      checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.resolveWith((states) => (states.contains(MaterialState.disabled))
              ? ColorLight.ashGrey
              : ColorLight.tiger),
          checkColor: MaterialStateProperty.all(Colors.white),
          shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1.5, color: ColorLight.ashGrey),
              borderRadius: BorderRadius.circular(4))),
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorLight.neutralWhite,
        elevation: 0,
        iconTheme: IconThemeData(color: ColorLight.doffBlack),
        titleTextStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: ColorLight.doffBlack),
      ),
      textTheme: const TextTheme(button: TextStyle(fontFamily: 'Mont', fontSize: 18, fontWeight: FontWeight.w800, color: ColorLight.doffBlack), headline1: TextStyle(fontFamily: 'Mont', fontSize: 36, fontWeight: FontWeight.w800, color: ColorLight.doffBlack), headline2: TextStyle(fontFamily: 'Mont', fontSize: 30, fontWeight: FontWeight.w800, color: ColorLight.doffBlack), headline3: TextStyle(fontFamily: 'Mont', fontSize: 24, fontWeight: FontWeight.w800, color: ColorLight.doffBlack), headline4: TextStyle(fontFamily: 'Mont', fontSize: 18, fontWeight: FontWeight.w800, color: ColorLight.doffBlack), headline5: TextStyle(fontFamily: 'Mont', fontSize: 16, fontWeight: FontWeight.w800, color: ColorLight.doffBlack), bodyText1: TextStyle(fontFamily: "NeutrifPro", fontSize: 18, fontWeight: FontWeight.w500, color: ColorLight.doffBlack), bodyText2: TextStyle(fontFamily: "NeutrifPro", fontSize: 15, fontWeight: FontWeight.w400, color: ColorLight.doffBlack), caption: TextStyle(fontFamily: "NeutrifPro", fontSize: 12, fontWeight: FontWeight.w400, color: ColorLight.doffBlack), subtitle1: TextStyle(fontFamily: "NeutrifPro", fontSize: 14, fontWeight: FontWeight.w500, color: ColorLight.doffBlack), subtitle2: TextStyle(fontFamily: "NeutrifPro", fontSize: 10, fontWeight: FontWeight.w500, color: ColorLight.doffBlack))),
  // Dark Theme Data that will be used in the future. Still not used.
  AppTheme.primaryDark: ThemeData(brightness: Brightness.dark)
};

extension ColorSchemeExtension on ThemeData {
  MaterialColor get primaryMaterialColor => ColorLight.tiger;
  LinearGradient get accentGradient => brightness == Brightness.light
      ? const LinearGradient(colors: ColorLight.tigerBerry)
      : const LinearGradient(colors: ColorLight.tigerBerry);

  Color get success =>
      brightness == Brightness.light ? ColorLight.torque : ColorLight.torque;
  Color get successLight =>
      brightness == Brightness.light ? ColorLight.tango : ColorLight.tango;

  Color get error => brightness == Brightness.light
      ? ColorLight.raspberry
      : ColorLight.raspberry;

  Color get warning =>
      brightness == Brightness.light ? ColorLight.sunglow : ColorLight.sunglow;

  Color get successLow => brightness == Brightness.light
      ? const Color(0xFFDFFFFD)
      : const Color(0xFFDFFFFD);

  Color get errorLow => brightness == Brightness.light
      ? const Color(0xFFFFDDEA)
      : const Color(0xFFFFDDEA);

  Color get warningLow => brightness == Brightness.light
      ? const Color(0xFFFAF4E1)
      : const Color(0xFFFAF4E1);
  Color get subheadingColor => brightness == Brightness.light
      ? ColorLight.textGrey
      : ColorLight.textGrey;

  BoxShadow get shadow1 => brightness == Brightness.light
      ? const BoxShadow(
          offset: Offset(2, 2), blurRadius: 4, color: Color(0xff231f20))
      : const BoxShadow();

  BoxShadow get shadow2 => brightness == Brightness.light
      ? const BoxShadow(
          offset: Offset(4, 4), blurRadius: 16, color: Color(0xff000000))
      : const BoxShadow();

  BoxShadow get shadow3 => brightness == Brightness.light
      ? const BoxShadow(
          offset: Offset(0, 2),
          blurRadius: 8,
          spreadRadius: 1,
          color: Color(0xFF000000))
      : const BoxShadow();

  LinearGradient get facebookGradient => brightness == Brightness.light
      ? const LinearGradient(colors: [Color(0xFF18ACFE), Color(0xFF0163E0)])
      : const LinearGradient(colors: [Color(0xFF18ACFE), Color(0xFF0163E0)]);

  LinearGradient get googleGradient => brightness == Brightness.light
      ? const LinearGradient(colors: [Color(0xFFFFFFFF), Color(0xFFECECEC)])
      : const LinearGradient(colors: [Color(0xFFFFFFFF), Color(0xFFECECEC)]);

  LinearGradient get appleGradient => brightness == Brightness.light
      ? const LinearGradient(colors: [Color(0xFF3B4959), Color(0xFF283544)])
      : const LinearGradient(colors: [Color(0xFF3B4959), Color(0xFF283544)]);
}
